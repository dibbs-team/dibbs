import 'dart:io';

import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:logger/logger.dart';

import '../models/user_stub.dart';
import '../models/ad.dart';
import '../lang/my_localizations.dart';
import '../widgets/upload/step_container.dart';
import '../widgets/upload/ad_type_selector.dart';
import '../widgets/upload/find_ad_details_fom.dart';
import '../widgets/upload/ad_uploader_form.dart';
import '../widgets/upload/list_ad_images_form.dart';
import '../widgets/upload/list_ad_details_form.dart';
import '../widgets/upload/list_ad_payment_form.dart';
import '../widgets/upload/upload_step.dart';
import '../utils/firestore_values.dart' as fs;
import '../utils/ad_types.dart';

class UploadAdScreen extends StatefulWidget {
  @override
  _UploadAdScreenState createState() => _UploadAdScreenState();
}

class _UploadAdScreenState extends State<UploadAdScreen> {
  final _firestore = FirebaseFirestore.instance;
  final _storage = firebase_storage.FirebaseStorage.instance;
  var _currentIndex = 0;
  List<UploadStep?> _steps = [];
  AdType? type;

  // Handles to forms.
  AdUploaderForm? adUploaderForm;
  FindAdDetailsForm? findAdDetailsForm;
  ListAdImagesForm? listAdImagesForm;
  ListAdDetailsForm? listAdDetailsForm;
  ListAdPaymentForm? listAdPaymentForm;

  UploadStep? get _currentStep =>
      _currentIndex > 0 ? _steps[_currentIndex - 1] : null;

  void _initFindMode() {
    setState(() {
      // Init find ad steps.
      findAdDetailsForm = FindAdDetailsForm();
      adUploaderForm = AdUploaderForm();
      _steps = [
        findAdDetailsForm,
        adUploaderForm,
      ];
      _currentIndex += 1; // Navigates to next step.
      type = AdType.FIND;
    });
  }

  void _initListMode() {
    setState(() {
      // Init list ad steps.
      listAdImagesForm = ListAdImagesForm();
      listAdDetailsForm = ListAdDetailsForm();
      adUploaderForm = AdUploaderForm();
      listAdPaymentForm = ListAdPaymentForm();
      _steps = [
        listAdImagesForm,
        listAdDetailsForm,
        adUploaderForm,
        listAdPaymentForm,
      ];
      _currentIndex += 1; // Navigates to next step.
      type = AdType.LIST;
    });
  }

  /// If steps left navigates to the next step, else uploads ad.
  Future<void> _finishStep() async {
    if (_currentIndex == _steps.length) {
      var res = await _uploadAd();
      //* Communicates result of upload to parent screen.
      Navigator.of(context).pop(res);
    } else {
      setState(() {
        _currentIndex += 1; // Navigates to next step.
      });
    }
  }

  // Uploads images to Firebase and returns corresponding URL references.
  Future<List<String>> _uploadImages({
    required List<File> images,
    required String adId,
  }) async {
    // Get reference to directory to save images in.
    final imageDirectoryRef =
        _storage.ref().child(fs.Storage.adImages).child(adId);

    // Create a list that will be filled by image URLs.
    var res = List<String>.filled(images.length, '', growable: false);

    // Start to upload all images.
    var futures = <Future>[];
    for (var i = 0; i < images.length; ++i) {
      final imageRef = imageDirectoryRef.child('$i.jpeg');
      futures.add(imageRef
          .putFile(images[i])
          .then((_) => imageRef.getDownloadURL().then((url) => res[i] = url)));
    }

    //  Wait until a URL has been recieved for each image.
    await Future.wait(futures);

    return res;
  }

  /// Uploads an ad to Firestore. Returns whether upload was succesful.
  Future<bool> _uploadAd() async {
    // Get information about uploader.
    final user = auth.FirebaseAuth.instance.currentUser!;
    final uploader = UserStub(
      id: user.uid,
      name: user.displayName!,
      image: user.photoURL!,
    );

    if (type == AdType.FIND) {
      try {
        // Upload ad.
        await _firestore.collection(fs.Collection.ads).add(FindAd(
              title: findAdDetailsForm!.title,
              description: findAdDetailsForm!.description,
              price: findAdDetailsForm!.price,
              uploader: uploader,
              dates: findAdDetailsForm!.dates,
            ).toFirestoreObject());
        return true;
      } catch (e) {
        return false;
      }
    } else if (type == AdType.LIST) {
      DocumentReference? adRef;
      try {
        // Create an ad to get a reference to a document.
        adRef = await _firestore
            .collection(fs.Collection.ads)
            .add({fs.Ad.complete: false});

        // Upload images to Firebase Storage.
        final images = await _uploadImages(
          images: listAdImagesForm!.images,
          adId: adRef.id,
        );

        // Upload ad.
        await adRef.set(ListAd(
          title: listAdDetailsForm!.title,
          description: listAdDetailsForm!.description,
          price: listAdDetailsForm!.price,
          images: images,
          uploader: uploader,
        ).toFirestoreObject());

        return true;
      } catch (e) {
        // Clean up any already made writes.
        if (adRef != null) {
          adRef.delete();
          _storage
              .ref()
              .child(fs.Storage.adImages)
              .child(adRef.id)
              .listAll()
              .then(
                  (result) => result.items.forEach((image) => image.delete()));
        }

        return false;
      }
    } else {
      Logger().w('Ad to be uploaded had unknown type.');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return WillPopScope(
      onWillPop: () async {
        //* This can happen if the user presses the back button on Android.
        if (_currentIndex == 0) {
          return true; // Pop this screen.
        }
        setState(() {
          _currentIndex -= 1; // Navigate to previous step.
        });
        return false; // Do not pop this screen.
      },
      child: Scaffold(
        appBar: AppBar(
          // Do not show back button on first step.
          leading: _currentIndex == 0 ? null : BackButton(),
          automaticallyImplyLeading: false,
          title: Text(
            _currentIndex == 0
                ? l10n.chooseUploadTypeTitle
                : l10n.uploadStep(
                    _currentIndex,
                    _steps.length,
                  ),
          ),
          actions: [
            IconButton(
              icon: Icon(Icons.clear),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        ),
        body: _currentIndex == 0
            ? AdTypeSelector(
                onSelectedFind: _initFindMode,
                onSelectedList: _initListMode,
              )
            : StepContainer(
                buttonText: _currentIndex == _steps.length
                    ? l10n.uploadAd
                    : l10n.nextStep,
                onButtonPressed: () async {
                  if (_currentStep!.validate()) {
                    await _finishStep();
                  }
                },
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: _currentStep,
                ),
              ),
      ),
    );
  }
}
