import 'package:flutter/material.dart';

import './ui/calendar/calendar.dart';
import './ui/rewards/reward.dart';
import './ui/setting/setting.dart';
import './ui/home.dart';

void main() => runApp(MaterialApp(
      home: MyTabs(),
      debugShowCheckedModeBanner: false,
    ));

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
      //appBar: AppBar(title: Text('타이머 예시')),
      body: TabBarView(controller: controller, // 컨트롤러 연결
          children: [Home(), Calendar(), Reward(), Setting()]),
      bottomNavigationBar: Container(
        child: TabBar(controller: controller, // 컨트롤러 연결
            tabs: [
              // 제목에 들어간 색상은 중요.
              Tab(icon: Icon(Icons.av_timer), text: 'Timer'),
              Tab(
                icon: Icon(Icons.calendar_today),
                text: 'Calendar',
              ),
              Tab(icon: Icon(Icons.card_giftcard), text: 'Reward'),
              Tab(icon: Icon(Icons.settings_rounded), text: 'Setting'),
            ]),
        color: Color.fromRGBO(58, 55, 55, 1.0), // 탭바 색상 설정
      ),
    );
  }
}

//민욱 깃 테스트
