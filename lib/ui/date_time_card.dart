import 'package:flutter/material.dart';

class DateTimeCard extends StatefulWidget {
  const DateTimeCard({ super.key, this.timeToDisplay });

  /// The [DateTime] to display.
  /// If not specified this will default to the current time.
  final DateTime? timeToDisplay;

  @override
  State<DateTimeCard> createState() => _DateTimeCardState();
}

class _DateTimeCardState extends State<DateTimeCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10.0),
      elevation: 10.0,
      child: Padding(
        padding: EdgeInsets.all(10.0),
        child: Text('Not yet implemented'), // TODO: implement it
      ),
    );
  }
}
