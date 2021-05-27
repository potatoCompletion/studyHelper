// Package List
import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:flutter/services.dart';

// Sub Page List
import './ui/calendar/calendar.dart';
import './ui/rewards/reward.dart';
import './ui/setting/setting.dart';
import './ui/setting/setting_time.dart';
import './ui/home.dart';
import './ui/user/signup.dart';
import './ui/user/profile.dart';
<<<<<<< HEAD
import './ui/global-variable/global-state.dart';
import './ui/timer/dtimer.dart';
=======
import './ui/bluetooth/bluetooth.dart';
>>>>>>> 78adea018c540ab31d43f6528da51f34d37886cc

void main() {
  // mobile device system Navigator Bar which is in bellow, -> color theme: dark mode
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.grey[900],
  ));
  runApp(MaterialApp(
    home: MyTabs(),
    debugShowCheckedModeBanner: false,
    // move to other pages
    routes: {
      'signup': (context) => SignUp(),
      'profile': (context) => Profile(),
      'TimeSetting': (context) => TimeSetting()
    },
  ));
}

// TabController 객체를 멤버로 만들어서 상태를 유지하기 때문에 StatefulWidget 클래스 사용
class MyTabs extends StatefulWidget {
  @override
  MyTabsState createState() => MyTabsState();
}

// SingleTickerProviderStateMixin 클래스는 애니메이션을 처리하기 위한 헬퍼 클래스
// 상속에 포함시키지 않으면 탭바 컨트롤러를 생성할 수 없다.
// mixin은 다중 상속에서 코드를 재사용하기 위한 한 가지 방법으로 with 키워드와 함께 사용
class MyTabsState extends State<MyTabs> with SingleTickerProviderStateMixin {
  // 컨트롤러는 TabBar와 TabBarView 객체를 생성할 때 직접 전달
  TabController controller;
  var timerVal = new TimerVal();
  var prevTimerVal = new TimerVal();

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
  Widget build(BuildContext context) {
    return Scaffold(
      // Scaffold element - appBar
      appBar: AppBar(
        brightness: Brightness.dark,
        title: Text(
          'Touch Down Timer',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            color: Colors.grey[400],
          ),
        ),
        // Color
        backgroundColor: Colors.grey[850],
        // AppBar setting Icon
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.settings),
              onPressed: () async{
                print("setting icon is clicked");
                timerVal.dTimerTime = await Navigator.push(context, MaterialPageRoute(builder: (context) => TimeSetting()));
                if (timerVal.dTimerTime == null) {
                  timerVal.dTimerTime = prevTimerVal.dTimerTime;
                }

                print(timerVal.dTimerTime);
              })

        ],
      ),
      // Scaffold element -> body
      body: TabBarView(controller: controller, // 컨트롤러 연결
<<<<<<< HEAD
          children: [Home(timerVal: timerVal), Calendar(), Reward()]),
=======
          children: [Home(), Calendar(), Reward(), Bluetooth()]),
>>>>>>> 78adea018c540ab31d43f6528da51f34d37886cc
      bottomNavigationBar: Container(
        child: TabBar(controller: controller, // 컨트롤러 연결
            tabs: [
              // 제목에 들어간 색상은 중요.
              Tab(icon: Icon(Icons.av_timer), text: 'Timer'),
              Tab(icon: Icon(Icons.calendar_today), text: 'Calendar'),
              Tab(icon: Icon(Icons.card_giftcard), text: 'Reward'),
              Tab(icon: Icon(Icons.settings_rounded), text: 'Bluetooth'),
            ]),
        color: Color.fromRGBO(58, 55, 55, 1.0), // 탭바 색상 설정
      ),

      // Scaffold element -> drawer
      drawer: Container(
        width: 250,
        child: Drawer(
          child: Container(
            color: Colors.grey[700],
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                UserAccountsDrawerHeader(
                  currentAccountPicture: CircleAvatar(
                    // temporary User Image
                    //backgroundImage: AssetImage("assets\\cat_sample2.png"),
                    backgroundImage: AssetImage("assets/cat_sample2.png"),
                    backgroundColor: Colors.grey[400],
                  ),
                  otherAccountsPictures: <Widget>[
                    CircleAvatar(
                      // temporary User Image -> Ignore
                      //backgroundImage: AssetImage("assets\\cat-second.png"),
                      backgroundColor: Colors.grey[850],
                    ),
                  ],
                  //////text - name
                  accountName: Text(
                    "사용자:  Loaf Cat",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 11.0,
                    ),
                  ),
                  //////text - email
                  accountEmail: Text(
                    "junheeyu.***@Gmail.com",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.grey[850],
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20.0),
                        bottomRight: Radius.circular(20.0),
                      )),
                ),
                ///////Drawer Head list

                //////////////////////////////////////////////////////
                // SignIn icon
                ListTile(
                  leading: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Sign in",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("Sign in is clicked");
                    Alert(
                        context: context,
                        title: "LOGIN",
                        content: Column(
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                icon: Icon(Icons.account_circle),
                                labelText: 'Username',
                              ),
                            ),
                            TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                icon: Icon(Icons.lock),
                                labelText: 'Password',
                              ),
                            ),
                          ],
                        ),
                        buttons: [
                          DialogButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text(
                              "LOGIN",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 20),
                            ),
                          )
                        ]).show();
                  },
                  //trailing: Icon(Icons.add),
                ),

                //////////////////////////////////////////////////////
                // SignUp Icon
                ListTile(
                  leading: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                  title: Text(
                    "SignUp",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("SignUp is clicked");
                    Navigator.pushNamed(context, 'signup');
                  },
                  //trailing: Icon(Icons.add),
                ),

                //////////////////////////////////////////////////////
                // Profile Icon
                ListTile(
                  leading: Icon(
                    Icons.person_pin_rounded,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Profile",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("Profile is clicked");
                    Navigator.pushNamed(context, 'profile');
                  },
                  //trailing: Icon(Icons.add),
                ),

                //////////////////////////////////////////////////////
                // Q&A Icon
                ListTile(
                  leading: Icon(
                    Icons.question_answer,
                    color: Colors.white,
                  ),
                  title: Text(
                    "Q&A",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onTap: () {
                    print("Q&A is clicked");
                  },
                  //trailing: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
