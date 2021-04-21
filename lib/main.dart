import 'package:flutter/material.dart';

import './ui/calendar/calendar.dart';
import './ui/rewards/reward.dart';
import './ui/setting/setting.dart';
import './ui/home.dart';


void main() => runApp(MaterialApp(home: MyTabs()));

var currentState = 0;

// TabController 객체를 멤버로 만들어서 상태를 유지하기 때문에 StatefulWidget 클래스 사용
class MyTabs extends StatefulWidget{
  @override
  MyTabsState createState() => MyTabsState();
}

// SingleTickerProviderStateMixin 클래스는 애니메이션을 처리하기 위한 헬퍼 클래스
// 상속에 포함시키지 않으면 탭바 컨트롤러를 생성할 수 없다.
// mixin은 다중 상속에서 코드를 재사용하기 위한 한 가지 방법으로 with 키워드와 함께 사용
class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  // 컨트롤러는 TabBar와 TabBarView 객체를 생성할 때 직접 전달
  TabController controller;

  // 객체가 위젯 트리에 추가될 때 호출되는 함수. 즉, 그려지기 전에 탭바 컨트롤러 생성.
  @override
  void initState() {
    super.initState();

    // SingleTickerProviderStateMixin를 상속 받아서
    // vsync에 this 형태로 전달해야 애니메이션이 정상 처리된다.
    controller = TabController(vsync: this, length: 4);
  }

  // initState 함수의 반대.
  // 위젯 트리에서 제거되기 전에 호출. 멤버로 갖고 있는 컨트롤러부터 제거.
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      //appBar: AppBar(title: Text('타이머 예시')),
      body: TabBarView(
          controller: controller,                     // 컨트롤러 연결
          children: [Home(), Calendar(), Reward(), Setting()]
      ),
      bottomNavigationBar: Container(
        child: TabBar(
            controller: controller,                 // 컨트롤러 연결
            tabs: [
              // 제목에 들어간 색상은 중요.
              Tab(icon: Icon(Icons.av_timer), text: 'Timer'),
              Tab(icon: Icon(Icons.calendar_today), text: 'Calendar',),
              Tab(icon: Icon(Icons.card_giftcard), text: 'Reward'),
              Tab(icon: Icon(Icons.settings_rounded), text: 'Setting'),
            ]
        ),
        color: Color.fromRGBO(58, 55, 55, 1.0),                     // 탭바 색상 설정
      ),
    );
  }
}
//TODO:main.dart

/*
// 차감식 타이머 위젯 구현
class Dtimer extends StatefulWidget {
  @override
  DtimerState createState() => DtimerState();
}

class DtimerState extends State<Dtimer> with TickerProviderStateMixin {
  AnimationController controller; //애니메이션 컨트롤러 생성
  String get timerString {
    Duration duration = controller.duration * controller.value;
    return '${(duration.inHours).toString().padLeft(2, '0')}:${(duration
        .inMinutes % 60).toString().padLeft(2, '0')}:${(duration.inSeconds % 60)
        .toString()
        .padLeft(2, '0')}';
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
                children: <Widget>[
                  ChangeTimerButton()
                ]
            ),
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
                                    backgroundColor: Color.fromRGBO(
                                        105, 101, 87, 1.0),
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
                                builder: (BuildContext context,
                                    Widget child) {
                                  return Text(
                                    _timerMention,
                                    style: themeData.textTheme.bodyText2,
                                  );
                                }),
                            AnimatedBuilder(
                                animation: controller,
                                builder: (BuildContext context,
                                    Widget child) {
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
    }
    else {
      return Icon(Icons.play_arrow);
    }
  }

//차감식 타이머 멘트 설정
  String get _timerMention {
    if (controller.isAnimating) {
      return '열공중입니다...';
    }
    else {
      return '준비중입니다...';
    }
  }
}
//TODO:Dtimer.dart





//차감식 타이머 디자인 구성 위젯
class TimerPainter extends CustomPainter {
  TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color,
  }) : super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor, color;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;

    canvas.drawCircle(size.center(Offset.zero), size.width / 2.0, paint);
    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter old) {
    return animation.value != old.animation.value ||
        color != old.color ||
        backgroundColor != old.backgroundColor;
  }
}




//누적식 타이머(스톱워치) 구현
class Atimer extends StatefulWidget {
  @override
  AtimerState createState() => AtimerState();
}

class AtimerState extends State<Atimer> {
  Stopwatch _stopwatch;
  Timer _timer;

  String formatTime(int milliseconds) {
    var secs = milliseconds ~/ 1000;
    var hours = (secs ~/ 3600).toString().padLeft(2, '0');
    var minutes = ((secs % 3600) ~/ 60).toString().padLeft(2, '0');
    var seconds = (secs % 60).toString().padLeft(2, '0');  return "$hours:$minutes:$seconds";
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
    }
    else {
      _stopwatch.start();
    }
    setState(() {});    // re-render the page
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:
          Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  ChangeTimerButton()
                ]
            ),
            Text(formatTime(_stopwatch.elapsedMilliseconds), style: TextStyle(fontSize: 48.0)),
            ElevatedButton(onPressed: handleStartStop, child: Text(_stopwatch.isRunning ? 'Stop' : 'Start')),
          ],
        ),
      ),
    );
  }
}
// TODO:Atimer.dart





//Calendar 위젯 구현
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('캘린더 위젯 샘플'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(calendarController: _controller,)
          ],
        ),
      ),
    );
  }
}




// Reward 위젯 구현
class Reward extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
        appBar: AppBar(title: Text('리워드 위젯 샘플')),
        body: GridView.count(
          crossAxisCount: 2,
            children: List.generate(100, (index){
              return Center(
                child: Text(
                  'Item $index',
                  style: Theme.of(context).textTheme.headline6,
                )
              );
        },
        ),
      )
    );
  }
}




//Setting 위젯 구현
class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: Text('설정 위젯 샘플')),
      body: ListView(
        padding: const EdgeInsets.all(11),
        children: <Widget>[
          Container(
            height: 50,
              color: Colors.amber[600],
            child: const Center(child: Text('테마')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('버전 확인')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('프로필 설정')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('개인/보안')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('알림')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('화면')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('기타')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('도움말')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('공지사항')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('고객센터')),
          ),
          Container(
            height: 50,
            color: Colors.amber[600],
            child: const Center(child: Text('실험실')),
          ),
        ],
      ),
    );
  }
}




//타이머간 화면 전환 버튼 구현
class ChangeTimerButton extends StatefulWidget {
  @override
  _ChangeTimerButtonState createState() => _ChangeTimerButtonState();
}

class _ChangeTimerButtonState extends State<ChangeTimerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.transform,
            color: Colors.blue,
            size: 50
        ),
        onPressed: () {
          if (currentState == 0) {
            currentState = 1;
            Home();

          }
          else {
            currentState = 0;
            Home();

          }

          /*Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => Home()),
                    (route) => false,
              );*/

        }
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    if (currentState == 0) {
      return Dtimer();
    }
    if (currentState == 1) {
      return Atimer();
    }
  }
}
*/
//TODO : 타이머 위젯 빌드 컨텍스트 조건문 넣어서 전환 가능하게 만들어야 함.(21.04.14)