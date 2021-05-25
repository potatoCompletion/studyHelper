import 'dart:async';

import 'package:flutter/material.dart';
import '../global-variable/global-state.dart';
import '../timer/line_painter.dart';

//누적식 타이머(스톱워치) 구현
class Atimer extends StatefulWidget {
  @override
  AtimerState createState() => AtimerState();
}

class AtimerState extends State<Atimer> {
  Stopwatch _stopwatch;
  Timer _timer;

  var timerVal = new TimerVal(); //타이머 클래스 객체 생성

  List _lapTimes = []; //랩타임 저장할 리스트

  //타이머 시간 문자열
  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours : $minutes : $seconds";
  }

  // 타이머 동작 상태 문자열
  String get _lapTimeState {
    if (_stopwatch.isRunning) {
      if (_lapTimes.isEmpty) {
        return 'start';
      } else {
        return 'restart';
      }
    } else {
      return 'stop';
    }
  }

  // 타이머 동작 상태 문자열 색상 설정
  TextSpan get _lapText {
    return TextSpan(
      text: _lapTimeState,
      style: TextStyle(
          fontSize: 30,
          color: _lapTimeState == 'stop' ? Colors.red : Colors.green),
      children: <TextSpan>[
        TextSpan(
            text: '   ${formatTime(_stopwatch.elapsedMilliseconds)}',
            style: TextStyle(color: Colors.white)),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _stopwatch = Stopwatch();
    // re-render every 30ms
    _timer = Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  // 스타트, 스탑 버튼 동작 구현
  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      timerVal.addStopCount();
    } else {
      _stopwatch.start();
    }
    setState(() {}); // re-render the page
  }

  // 초기화 버튼 동작 구현
  void _reset() {
    setState(() {
      _stopwatch.reset();
      timerVal.stopCount = 0;
      _lapTimes.clear();
    });
  }

  // (디자인) 일시정지 카운트 문자열 설정
  Text get stopCountMention {
    return Text('${timerVal.stopCount} / 3',
        style: TextStyle(
          color: timerVal.stopCount >= 3 ? Colors.red : Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ));
  }

  // 랩타임 리스트 추가
  void _recordLapTime(String time) {
    _lapTimes.insert(0, _lapText);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Background Color setup
      backgroundColor: Colors.grey[850],
      body: Padding(
          padding: EdgeInsets.all(8.0),
          child: Stack(children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(mainAxisAlignment: MainAxisAlignment.start, children: <
                    Widget>[
                      //(디자인) 타이머 시간 문자열/////////////////////////////
                  Text(formatTime(_stopwatch.elapsedMilliseconds),
                      style: TextStyle(color: Colors.white, fontSize: 60.0)),
                     /////////////////////////////////////////////////////////
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                      height: 30,
                      width: 300,
                      child: Center(
                        //(디자인) 타이머 시간 밑 일자 선 관련////////////
                          child: CustomPaint(
                        size: Size(300, 200),
                        painter: LinePainter(),
                      ))),
                        ////////////////////////////////////////////////

                  Container(     // 랩타임 표시하는 구역
                    width: 300,
                    height: 200,
                    child: ListView(
                      children: _lapTimes.map((time) => Center(child: RichText(text: time))).toList(),
                    ),
                  ),
                  // making distance between Text and Button
                  SizedBox(
                    height: 30.0,
                  ),
                  stopCountMention,  // 0 / 3 <----- 일시정지 카운트 텍스트
                  SizedBox(
                    height: 30.0,
                  ),
                  // Icon Box design
                  SizedBox(
                    // Icon Box attributes
                    height: 40.0,
                    width: 90.0,
                    // box child -> Elevated Button
                    // (디자인) 스타트/일시정지 버튼 /////////////////////////////
                    child: ElevatedButton(
                        onPressed: () {
                          handleStartStop();
                          setState(() {
                            _recordLapTime(
                                formatTime(_stopwatch.elapsedMilliseconds));
                          });
                        },
                        child: Text(
                          _stopwatch.isRunning ? 'Stop' : 'Start',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            //fontWeight: FontWeight.bold,
                          ),
                        )),
                    ////////////////////////////////////////////////////////////
                  ),
                ])
              ],
            ),
            // (디자인) 초기화 버튼 /////////////////////////////////////////////
            Positioned(
                left: 0,
                bottom: 10,
                child: FloatingActionButton(
                  backgroundColor: Colors.deepOrange,
                  onPressed: () {
                    _reset();
                  },
                  child: Icon(Icons.rotate_left),
                )),
            ////////////////////////////////////////////////////////////////////
          ])),
    );
  }
}