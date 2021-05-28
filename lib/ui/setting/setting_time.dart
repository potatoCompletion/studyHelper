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
      backgroundColor: Colors.grey[850],
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text('timer time setting'),
        backgroundColor: Colors.grey[850],
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Container(
                width: 300,
                height: 400,
                child: ListView(children: [
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (BuildContext builder) {
                              return Container(
                                height: MediaQuery.of(context)
                                        .copyWith()
                                        .size
                                        .height /
                                    3,
                                child: CupertinoTimerPicker(
                                  mode: CupertinoTimerPickerMode.hms,
                                  minuteInterval: 1,
                                  secondInterval: 1,
                                  initialTimerDuration: timerVal.dTimerTime,
                                  onTimerDurationChanged:
                                      (Duration changedTimer) {
                                    timerVal.dTimerTime = changedTimer;
                                  },
                                ),
                              );
                            });
                      },
                      child: Text('SELECT TIME'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        //     TODO: add function
                      },
                      child: Text('BLUETOOTH SETTING'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        //     TODO: add function
                      },
                      child: Text('HELP'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        //     TODO: add function
                      },
                      child: Text('PROFILE SETTING'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        //     TODO: add function
                      },
                      child: Text('CONTACT'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        //     TODO: add function
                      },
                      child: Text('UI/UX SETTING'),
                    ),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.grey[800],
                      ),
                      onPressed: () {
                        //     TODO: add function
                      },
                      child: Text('AUTHOR'),
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 100,
              ),
              Container(
                width: 100,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, timerVal.dTimerTime);
                  },
                  child: Text(
                    '저장',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
