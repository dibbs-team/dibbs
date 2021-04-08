import 'package:flutter/material.dart';

import 'date_range_picker.dart';
import 'form_info.dart';
import 'upload_step.dart';
import 'form_field_title.dart';
import '../../lang/my_localizations.dart';

/// Form used to create a booking of a list ad
class ListBookingForm extends StatelessWidget implements UploadStep {
  final _key = GlobalKey<_ListBookingFormImplState>();

  /// The price per day of booking the ad
  final int price;

  DateTimeRange get dates => _key?.currentState?.dateRangePicker?.dates;

  ListBookingForm(this.price);

  bool validate() {
    // Verify that a date range has been selected
    print(dates);
    return dates != null && dates.duration.inDays != 0;
  }

  @override
  Widget build(BuildContext context) {
    return _ListBookingFormImpl(
      key: _key,
      price: price,
    );
  }
}

/// Implementation of the List booking form, seperated since a key is needed inorder to acces the state
class _ListBookingFormImpl extends StatefulWidget {
  final _formKey = GlobalKey<FormState>();

  /// The price per day of booking the ad
  final int price;

  _ListBookingFormImpl({
    @required key,
    @required this.price,
  }) : super(key: key);

  @override
  _ListBookingFormImplState createState() => _ListBookingFormImplState();
}

class _ListBookingFormImplState extends State<_ListBookingFormImpl> {
  DateRangePicker dateRangePicker;

  // The amount of days the ad is currently being booked
  int days = 0;

  /// Updates the number of dates, used in dateRangePicker, in order to notify
  /// that the selected dateTimeRange has changed and the UI should therefor
  /// be updated.
  void setDateTimeRange() {
    setState(() {
      days = dateRangePicker?.dates?.duration?.inDays ?? 0;
    });
  }

  _ListBookingFormImplState() {
    dateRangePicker = DateRangePicker(notifyDatesChanged: setDateTimeRange);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = MyLocalizations.of(context);

    return Form(
      key: widget._formKey,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              l10n.listBookingDateTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            FormInfo(l10n.listBookingDateInfo),
            FormFieldTitle(l10n.listBookingDatesFieldTitle),
            dateRangePicker,
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(),
            ),
            Text(
              l10n.priceTitle,
              style: Theme.of(context).textTheme.headline2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormInfo(l10n.listAdPriceTitle),
                FormInfo(l10n.price(widget.price)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FormInfo(l10n.nrOfDays),
                FormInfo("$days"),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  FormFieldTitle(l10n.total),
                  FormFieldTitle(l10n.price(days * widget.price)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
