import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../lang/my_localizations.dart';
import '../../design/my_colors.dart';

class DateRangePicker extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return _DateRangePickerImpl();
  }
}

class _DateRangePickerImpl extends StatefulWidget {
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
