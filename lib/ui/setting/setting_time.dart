import 'package:flutter/material.dart';

class TimeSetting extends StatefulWidget {
  @override
  _TimeSettingState createState() => _TimeSettingState();
}

class _TimeSettingState extends State<TimeSetting> {
  TimeOfDay _time = TimeOfDay(hour: 7, minute: 15);

  void _selectTime() async {
    TimeOfDay newtime = await showTimePicker(context: context, initialTime: _time);
    if (newtime != null) {
      setState(() {
        _time = newtime;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: _selectTime,
              child: Text('SELECT TIME'),
            ),
            SizedBox(height: 8),
            Text(
              'Selected time: ${_time.format(context)}',
            ),
          ],
        ),
      ),
    );
  }
}
