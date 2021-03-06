import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'timer_painter.dart';
import '../global-variable/global-state.dart';
import '../timer/line_painter.dart';
import '../../main.dart';

// 차감식 타이머 위젯 구현
class Dtimer extends StatefulWidget {
  var timerVal = new TimerVal();

  Dtimer({@required this.timerVal});

  @override
  DtimerState createState() => DtimerState();

  // static DtimerState of(BuildContext context) =>
  //     context.findAncestorStateOfType<DtimerState>();
}

class DtimerState extends State<Dtimer> with TickerProviderStateMixin {
  var timerVal = new TimerVal(); //타이머 클래스 객체 생성
  AnimationController controller; //애니메이션 컨트롤러 생성

  DtimerState({this.timerVal});

  String get timerString {
    controller.duration =
        timerVal.dTimerTime; //controller duration에 timerVal.dCounterTime 값 전달
    Duration duration = controller.duration * controller.value;
    return '${(duration.inHours).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  } //차감식 타이머 그래픽 안 시간

  @override
  void initState() {
    super.initState();
    timerVal = widget.timerVal;
    controller = AnimationController(
      vsync: this,
      duration: timerVal.dTimerTime, //차감식 타이머 시간 설정
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  //(디자인) 일시정지 카운트 텍스트
  Text get stopCountMention {
    return Text('Stop : ${timerVal.stopCount} / 3',
        style: TextStyle(
          color: timerVal.stopCount >= 3 ? Colors.red : Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ));
  }

//차감식 타이머 멘트 설정
  String get _timerMention {
    if (controller.isAnimating) {
      return '열공중입니다!!';
    } else {
      return '준비중입니다..';
    }
  }

  Icon get _setIcon {
    if (controller.isAnimating) {
      return Icon(Icons.pause);
    } else {
      return Icon(Icons.play_arrow);
    }
  }

  //초기화 버튼 동작 구현
  void _reset() {
    setState(() {
      controller.reset();
      timerVal.stopCount = 0;
    });
  }

  // 차감식 타이머 구현 위젯
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Stack(
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Align(
                    alignment: FractionalOffset.center,
                    child: AspectRatio(
                      aspectRatio: 1.0,
                      child: Stack(
                        children: <Widget>[
                          Positioned.fill(
                            top: 25.0,
                            left: 25.0,
                            right: 25.0,
                            bottom: 25.0,
                            child: AnimatedBuilder(
                              animation: controller,
                              builder: (BuildContext context, Widget child) {
                                return CustomPaint(
                                    painter: TimerPainter(
                                        animation: controller,
                                        //(디자인) 차감식 타이머 원형 색상////
                                        backgroundColor:
                                            Color.fromRGBO(104, 104, 104, 1.0),
                                        color: Color.fromRGBO(143, 7, 7, 1.0)));
                                ////////////////////////////////////
                              },
                            ),
                          ),
                          Align(
                            alignment: FractionalOffset.center,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              //차감식 타이머 멘션 스트링, 타이머 남은 시간 스트링 두개 정렬 및 나열
                              children: <Widget>[
                                // First Animated Builder -> Text
                                AnimatedBuilder(
                                    animation: controller,
                                    builder:
                                        //(디자인) 차감식 타이머 안에 멘트 (열공중, 준비중) 관련//////////////
                                        (BuildContext context, Widget child) {
                                      return Text(
                                        _timerMention,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 25.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                      ///////////////////////////////////////////////////////////////////////
                                    }),
                                // Sized Box for Aligning between two AnimatedBuilders
                                SizedBox(
                                  height: 50.0,
                                ),
                                // Second Animated Builder -> Numerical value
                                AnimatedBuilder(
                                    animation: controller,
                                    builder:
                                        (BuildContext context, Widget child) {
                                      //(디자인) 타이머 시간 문자열 관련 //////////////////
                                      return Text(
                                        timerString,
                                        //style: themeData.textTheme.headline4,
                                        style: TextStyle(
                                          fontSize: 40.0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      );
                                      ///////////////////////////////////////////////////
                                    }),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                // align between line and stop count
                SizedBox(
                  height: 35,
                ),
                stopCountMention,
                // align between line and stop count
                SizedBox(
                  height: 35,
                ),
                Container(
                    height: 10,
                    width: 300,
                    child: Center(
                        child: CustomPaint(
                      size: Size(300, 200),
                      painter: LinePainter(),
                    ))),

                // align between line and buttons
                SizedBox(
                  height: 25,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            //(디자인) 타이머 시간 문자열 관련 //////////////////
                            return FloatingActionButton(
                              backgroundColor: Colors.grey,
                              onPressed: () {
                                _reset();
                              },
                              child: Icon(Icons.rotate_left),
                            );
                            ///////////////////////////////////////////////////
                          }),
                      SizedBox(
                        height: 0,
                        width: 40,
                      ),
                      AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            //(디자인) 타이머 시간 문자열 관련 //////////////////
                            return FloatingActionButton(
                              backgroundColor: Colors.blue[800],
                              child: controller.isAnimating
                                  ? Icon(Icons.pause)
                                  : Icon(Icons.play_arrow),
                              onPressed: () {
                                if (controller.isAnimating) {
                                  controller.stop(canceled: true);
                                  timerVal.addStopCount();
                                } else {
                                  controller.reverse(
                                      from: controller.value == 0.0
                                          ? 1.0
                                          : controller.value);
                                }
                                setState(() {});
                              },
                            );
                            ///////////////////////////////////////////////////
                          }),
                    ],
                  ),
                ),
                // align between bottom and start button
                SizedBox(
                  height: 30,
                ),
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.grey[850],
    );
  }
}
