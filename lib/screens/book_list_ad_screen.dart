import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/material.dart';

import '../lang/my_localizations.dart';
import '../models/ad.dart';
import '../models/ad_stub.dart';
import '../models/booking.dart';
import '../models/user_stub.dart';
import '../utils/firestore_values.dart' as fs;
import '../widgets/upload/list_ad_booking_completed.dart';
import '../widgets/upload/list_ad_booking_form.dart';
import '../widgets/upload/step_container.dart';
import '../widgets/upload/upload_step.dart';

/// The arguments that need to be provided when navigating to an
///  UploadBookingScreen, returns true if a booking was sucessfully uploaded.
class BookListAdScreenArguments {
  /// The ad being booked
  final ListAd ad;

  BookListAdScreenArguments(this.ad);
}

/// Screen that creates a booking for a given list ad.
class BookListAdScreen extends StatelessWidget {
  static const routeName = '/book-list-ad';

  @override
  Widget build(BuildContext context) {
    final BookListAdScreenArguments args =
        ModalRoute.of(context).settings.arguments;

    return _UploadListBookingScreenImpl(args.ad);
  }
}

/// Implementation of UploadBookingScreen, seperate in order to make the ad
/// accessible outside of the build function
class _UploadListBookingScreenImpl extends StatefulWidget {
  final ListAd ad;
  final _firestore = FirebaseFirestore.instance;

  _UploadListBookingScreenImpl(this.ad);

  @override
  _UploadListBookingScreenImplState createState() =>
      _UploadListBookingScreenImplState();
}

class _UploadListBookingScreenImplState
    extends State<_UploadListBookingScreenImpl> {
  /// The step currently being displayed
  UploadStep child;

  /// Handle to form that generate a booking
  ListBookingForm listBookingForm;

  /// Handle Widget where confirmation info is diplayed after a booking has been completed
  ListAdBookingCompleted listBookingCompleted;

  @override
  void initState() {
    super.initState();
    listBookingForm = ListBookingForm(widget.ad.price);
    child = listBookingForm;
  }

  /// Handles a press on the next button.
  Future<void> _finishStep() async {
    if (child == listBookingForm) {
      var booking = await _uploadBooking();

      if (booking != null) {
        setState(() {
          listBookingCompleted = ListAdBookingCompleted(booking: booking);
          child = listBookingCompleted;
        });
      } else {
        Navigator.of(context).pop(false);
      }
    } else {
      Navigator.of(context).pop(true);
    }
  }

  /// Creates a Future that uploads a booking to Firestore and return it.
  /// Returns null if upload failed.
  Future<Booking> _uploadBooking() async {
    // Get information about uploader.
    final user = auth.FirebaseAuth.instance.currentUser;
    final uploader = UserStub(
      id: user.uid,
      name: user.displayName,
      image: user.photoURL,
    );

    var booking = Booking(
        ad: ListAdStub(
            id: widget.ad.id,
            uploader: widget.ad.uploader,
            title: widget.ad.title,
            image: widget.ad.images[0]),
        dates: (child as ListBookingForm).dates,
        uploader: uploader,
        status: BookingStatus.PENDING);

    try {
      await widget._firestore
          .collection(fs.Collection.bookings)
          .add(booking.toFirestoreObject());
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(MyLocalizations.of(context).firebaseError)),
      );

      return null;
    }

    return booking;
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Scaffold(
      appBar: AppBar(
        // Do not show back button
        automaticallyImplyLeading: false,
        actions: child == listBookingForm
            ? [
                IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
              ]
            : [],
      ),
      body: StepContainer(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: child,
        ),
        onButtonPressed: () async {
          if (child.validate()) {
            await _finishStep();
          }
        },
        buttonText:
            child == listBookingForm ? l10n.confirmRequest : l10n.finish,
      ),
    );
  }
}
