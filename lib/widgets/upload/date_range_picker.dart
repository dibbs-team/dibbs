import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../lang/my_localizations.dart';
import '../../design/my_colors.dart';

// ignore: must_be_immutable
class DateRangePicker extends StatelessWidget {
  final _key = new GlobalKey<_DateRangePickerImplState>();
  //* _datesWhenDisposed is mutable because it is used for saving the selected
  //* dates if the state is disposed before the getter is called.
  DateTimeRange _datesWhenDisposed;

  //* If the state has not been disposed we get the selected dates directly
  //* from otherwise we return the dates that were selected at disposal.
  DateTimeRange get dates =>
      _key.currentState?.selectedDates ?? _datesWhenDisposed;

  @override
  Widget build(BuildContext context) {
    return _DateRangePickerImpl(
      key: _key,
      saveDatesOnDispose: (dates) {
        _datesWhenDisposed = dates;
      },
    );
  }
}

class _DateRangePickerImpl extends StatefulWidget {
  final void Function(DateTimeRange) saveDatesOnDispose;

  _DateRangePickerImpl({
    this.saveDatesOnDispose,
    @required key,
  }) : super(key: key);

  @override
  _DateRangePickerImplState createState() => _DateRangePickerImplState();
}

class _DateRangePickerImplState extends State<_DateRangePickerImpl> {
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now().add(Duration(days: 1)),
  );

  /// Let's the user select a date range and sets the state accordingly.
  Future<void> _selectDates(BuildContext ctx) async {
    final l10n = MyLocalizations.of(ctx);
    final DateTimeRange range = await showDateRangePicker(
      context: ctx,
      firstDate: selectedDates.start,
      lastDate: selectedDates.start.add(Duration(days: 365)),
      initialDateRange: selectedDates,
      helpText: l10n.datePickerHelp,
      builder: (BuildContext context, Widget child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              onPrimary: MyColors.black,
            ),
          ),
          child: child,
        );
      },
    );
    setState(() {
      selectedDates = range;
    });
  }

  @override
  void dispose() {
    super.dispose();
    widget.saveDatesOnDispose(selectedDates);
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: Text(
        '${DateFormat.yMMMMd().format(selectedDates.start)} - '
        '${DateFormat.yMMMMd().format(selectedDates.end)}',
      ),
      onPressed: () async {
        await _selectDates(context);
      },
    );
  }
}