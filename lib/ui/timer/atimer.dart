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

  var timerVal = new TimerVal();

  List _lapTimes = [];

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');
    return "$hours : $minutes : $seconds";
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

  void handleStartStop() {
    if (_stopwatch.isRunning) {
      _stopwatch.stop();
      timerVal.addStopCount();
    } else {
      _stopwatch.start();
    }
    setState(() {}); // re-render the page
  }

  void _reset() {
    setState(() {
      _stopwatch.reset();
      timerVal.stopCount = 0;
      _lapTimes.clear();
    });
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
                  Text(formatTime(_stopwatch.elapsedMilliseconds),
                      style: TextStyle(color: Colors.white, fontSize: 60.0)),
                  SizedBox(
                    height: 50.0,
                  ),
                  Container(
                      height: 30,
                      width: 300,
                      child: Center(
                          child: CustomPaint(
                        size: Size(300, 200),
                        painter: LinePainter(),
                      ))),
                  Container(
                    width: 300,
                    height: 200,
                    child: ListView(
                      children: _lapTimes
                          .map((time) => Center(child: RichText(text: time)))
                          .toList(),
                    ),
                  ),
                  // making distance between Text and Button
                  SizedBox(
                    height: 30.0,
                  ),
                  stopCountMention,
                  SizedBox(
                    height: 30.0,
                  ),
                  // Icon Box design
                  SizedBox(
                    // Icon Box attributes
                    height: 40.0,
                    width: 90.0,
                    // box child -> Elevated Button
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
                  ),
                ])
              ],
            ),
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
          ])),
    );
  }

  Text get stopCountMention {
    return Text('${timerVal.stopCount} / 3',
        style: TextStyle(
          color: timerVal.stopCount >= 3 ? Colors.red : Colors.white,
          fontSize: 40.0,
          fontWeight: FontWeight.bold,
        ));
  }

  void _recordLapTime(String time) {
    _lapTimes.insert(0, _lapText);
  }

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
}
//완
