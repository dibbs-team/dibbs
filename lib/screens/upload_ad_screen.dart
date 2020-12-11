import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';
import '../widgets/upload/step_container.dart';
import '../widgets/upload/ad_type_selector.dart';
import '../widgets/upload/find_ad_details_fom.dart';
import '../widgets/upload/ad_uploader_form.dart';
import '../widgets/upload/list_ad_images_form.dart';
import '../widgets/upload/list_ad_details_form.dart';
import '../widgets/upload/list_ad_payment_form.dart';
import '../widgets/upload/upload_step.dart';

class UploadAdScreen extends StatefulWidget {
  @override
  _UploadAdScreenState createState() => _UploadAdScreenState();
}

class _UploadAdScreenState extends State<UploadAdScreen> {
  var _currentIndex = 0;
  List<UploadStep> _steps = [];

  UploadStep get _currentStep =>
      _currentIndex > 0 ? _steps[_currentIndex - 1] : null;

  void _initFindMode() {
    setState(() {
      // Init find ad steps.
      _steps = [
        FindAdDetailsForm(),
        AdUploaderForm(),
      ];
      _currentIndex += 1; // Navigates to next step.
    });
  }

  void _initListMode() {
    setState(() {
      // Init list ad steps.
      _steps = [
        ListAdImagesForm(),
        ListAdDetailsForm(),
        AdUploaderForm(),
        ListAdPaymentForm(),
      ];
      _currentIndex += 1; // Navigates to next step.
    });
  }

  /// If steps left navigates to the next step, else uploads ad.
  Future<void> _finishStep() async {
    if (_currentIndex == _steps.length) {
      var res = true; //! Result from upload. Assume true for now.
      //* Communicates result of upload to parent screen.
      Navigator.of(context).pop(res);
    } else {
      setState(() {
        _currentIndex += 1; // Navigates to next step.
      });
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
          leading: _currentIndex == 0 ? Container() : BackButton(),
          title: Text(
            _currentIndex == 0
                ? l10n.chooseUploadTypeTitle
                : l10n.uploadStep(
                    current: _currentIndex,
                    total: _steps.length,
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
                step: _currentIndex,
                totalSteps: _steps.length,
                onButtonPressed: () async {
                  if (_currentStep.validate()) {
                    await _finishStep();
                  }
                },
                child: _currentStep,
              ),
      ),
    );
  }
}
