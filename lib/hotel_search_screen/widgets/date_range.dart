import 'package:flutter/material.dart';

class DateRange extends StatefulWidget {
  const DateRange({super.key});

  @override
  State<DateRange> createState() => _DateRangeState();
}

class _DateRangeState extends State<DateRange> {
  DateTimeRange selectedDates = DateTimeRange(
    start: DateTime.now(),
    end: DateTime.now(),
  );
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(24),
              color: Colors.white,
              border: const Border.fromBorderSide(
                BorderSide(
                  color: Colors.blueAccent,
                ),
              ),
            ),
            padding: const EdgeInsets.all(8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  child: Text(
                    '${selectedDates.start.year}-${selectedDates.start.month}-${selectedDates.start.day} ==> ${selectedDates.end.year}-${selectedDates.end.month}-${selectedDates.end.day}',
                    style: const TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 18,
                    ),
                  ),
                  onPressed: () async {
                    final DateTimeRange? dateTimeRange =
                        await showDateRangePicker(
                      context: context,
                      firstDate: DateTime(2023),
                      lastDate: DateTime(2025),
                    );
                    if (dateTimeRange != null) {
                      setState(() {
                        selectedDates = dateTimeRange;
                      });
                    }
                  },
                ),
                const Icon(
                  Icons.close_outlined,
                  color: Colors.black54,
                  size: 25,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
