import 'package:flutter/material.dart';

import '../../models/booking.dart';
import '../../lang/my_localizations.dart';
import 'form_field_title.dart';
import 'form_info.dart';
import 'form_title.dart';
import 'upload_step.dart';

class ListAdBookingCompleted extends StatelessWidget implements UploadStep {
  final Booking booking;

  ListAdBookingCompleted({@required this.booking});

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        FormTitle(l10n.bookingCompletedTitle),
        FormFieldTitle(l10n.requestSentConfirmation(booking.ad.uploader.name)),
        FormInfo(l10n.requestSentInfo),
      ],
    );
  }

  @override
  bool validate() {
    return true;
  }
}
