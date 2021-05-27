import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../global-variable/global-state.dart';

class TimeSetting extends StatefulWidget {
  @override
  _TimeSettingState createState() => _TimeSettingState();
}

class _TimeSettingState extends State<TimeSetting> {
  var timerVal = new TimerVal();

  var value = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('timer time setting'),
      ),
      body: ListView(
        children: [
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (BuildContext builder) {
                            return Container(
                              height: MediaQuery.of(context).copyWith().size.height / 3,
                              child: CupertinoTimerPicker(
                                mode: CupertinoTimerPickerMode.hms,
                                minuteInterval: 1,
                                secondInterval: 1,
                                initialTimerDuration: timerVal.dTimerTime,
                                onTimerDurationChanged: (Duration changedTimer) {
                                    timerVal.dTimerTime = changedTimer;
                                },
                              ),
                            );
                          });
                    },
                    child: Text('SELECT TIME'),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                        Navigator.pop(context, timerVal.dTimerTime);
                    },
                    child: Text('저장'),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]
      ),
    );
  }
}