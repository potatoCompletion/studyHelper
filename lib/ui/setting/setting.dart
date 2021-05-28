import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import '../global-variable/global-state.dart';

class Setting extends StatefulWidget {
  var timerVal = new TimerVal();

  Setting({@required this.timerVal});

  @override
  SettingState createState() => SettingState();
}

class SettingState extends State<Setting> {
  var timerVal = new TimerVal();
  Duration changedTime;

  var value = "";

  SettingState({this.timerVal});

  void initState(){
    setState(() {
      timerVal = widget.timerVal;
    });
  }

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
                                    changedTime = changedTimer;
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
                    changedTime == null
                        ? Navigator.pop(context, timerVal.dTimerTime)
                        : Navigator.pop(context, changedTime);
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

//TODO: SETTING 들어갔다가 뒤로가기로 나오면 시간 초기화되는 문제 해결해야함