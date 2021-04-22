import 'package:flutter/material.dart';

import 'timer_painter.dart';
import 'change_timer_button.dart';

// 차감식 타이머 위젯 구현
class Dtimer extends StatefulWidget {
  @override
  DtimerState createState() => DtimerState();
}

class DtimerState extends State<Dtimer> with TickerProviderStateMixin {
  AnimationController controller; //애니메이션 컨트롤러 생성
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inHours).toString().padLeft(2, '0')}:${(duration.inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  } //차감식 타이머 그래픽 안 시간

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5), //차감식 타이머 시간 설정
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  // 차감식 타이머 구현 위젯
  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[ChangeTimerButton()]),
            Expanded(
              child: Align(
                alignment: FractionalOffset.center,
                child: AspectRatio(
                  aspectRatio: 1.0,
                  child: Stack(
                    children: <Widget>[
                      Positioned.fill(
                        child: AnimatedBuilder(
                          animation: controller,
                          builder: (BuildContext context, Widget child) {
                            return CustomPaint(
                                painter: TimerPainter(
                                    animation: controller,
                                    backgroundColor:
                                        Color.fromRGBO(105, 101, 87, 1.0),
                                    color: Color.fromRGBO(143, 7, 7, 1.0)
                                    //themeData.indicatorColor,
                                    ));
                          },
                        ),
                      ),
                      Align(
                        alignment: FractionalOffset.center,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          //차감식 타이머 멘션 스트링, 타이머 남은 시간 스트링 두개 정렬 및 나열
                          children: <Widget>[
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    _timerMention,
                                    style: themeData.textTheme.bodyText2,
                                  );
                                }),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context, Widget child) {
                                  return Text(
                                    timerString,
                                    style: themeData.textTheme.headline4,
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FloatingActionButton(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return _setIcon;
                      },
                    ),
                    onPressed: () {
                      if (controller.isAnimating) {
                        controller.stop(canceled: true);
                      } else {
                        controller.reverse(
                            from: controller.value == 0.0
                                ? 1.0
                                : controller.value);
                      }
                      setState(() {
                        _setIcon;
                      });
                    },
                  )
                ],
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Color.fromRGBO(241, 227, 190, 1.0),
    );
  }

  //차감식 타이머 버튼 아이콘 상태 판단 후 설정
  Icon get _setIcon {
    if (controller.isAnimating) {
      return Icon(Icons.pause);
    } else {
      return Icon(Icons.play_arrow);
    }
  }

//차감식 타이머 멘트 설정
  String get _timerMention {
    if (controller.isAnimating) {
      return '열공중입니다...';
    } else {
      return '준비중입니다...';
    }
  }
}
