import 'dart:async';

import 'package:flutter/material.dart';
import '../global-variable/global-state.dart';
import '../timer/line_painter.dart';

//누적식 타이머(스톱워치) 구현
class Atimer extends StatefulWidget {
  @override
  AtimerState createState() => AtimerState();
}

class AtimerState extends State<Atimer> with TickerProviderStateMixin {
  AnimationController controller; //애니메이션 컨트롤러 생성
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
      } 
      else {
        return 'start';
      }
    } else {
      return 'stop ';
    }
  }

  // 타이머 동작 상태 문자열 색상 설정
  TextSpan get _lapText {
    return TextSpan(
      text: _lapTimeState,
      style: TextStyle(
          fontSize: 30,
          color: _lapTimeState == 'stop ' ? Colors.red[900] : Colors.green[800]),
      children: <TextSpan>[
        TextSpan(
            text: '   ${formatTime(_stopwatch.elapsedMilliseconds)}',
            style: TextStyle(color: Colors.white)),
      ],
    );
  }

  @override
  void initState() {
    controller = null;
    super.initState();
    _stopwatch = Stopwatch();
    // re-render every 30ms
    _timer = Timer.periodic(new Duration(milliseconds: 30), (timer) {
      setState(() {});
    });
    controller = AnimationController(
      vsync: this,
    );
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  //(디자인) 차감식 타이머 스타트 버튼 모양 설정
  Icon get _setIcon {
    if (controller.isAnimating) {
      return Icon(Icons.pause);
    } else {
      return Icon(Icons.play_arrow);
    }
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.start, 
                  children: <Widget>[
                    SizedBox(
                      height: 50,
                    ),
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
                  //stopCountMention,  // 0 / 3 <----- 일시정지 카운트 텍스트
                  SizedBox(
                    height: 30.0,
                  ),
                  // Icon Box design
                  Container(
                    margin: EdgeInsets.fromLTRB(90.0, 8.0, 2.0, 8.0),
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
     
                      // start button 
                      FloatingActionButton(
                        backgroundColor: Colors.blue[800],
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return _setIcon;
                          },
                        ),
                        onPressed: () {
                          handleStartStop();
                          setState(() {
                            _recordLapTime(
                                formatTime(_stopwatch.elapsedMilliseconds));
                          });
                        },
                      ),
                    ],
                  ),
                  ),
                ])
              ],
            ),
            // (디자인) 초기화 버튼 /////////////////////////////////////////////
            Positioned(
                left: 110,
                bottom: 133,
                child: FloatingActionButton(
                  backgroundColor: Colors.grey,
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