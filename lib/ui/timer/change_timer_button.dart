import 'package:flutter/material.dart';

import '../../main.dart';

//타이머간 화면 전환 버튼 구현
class ChangeTimerButton extends StatefulWidget {
  @override
  _ChangeTimerButtonState createState() => _ChangeTimerButtonState();
}

class _ChangeTimerButtonState extends State<ChangeTimerButton> {
  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.transform, color: Colors.blue, size: 50),
        onPressed: () {
          if (currentState == 0) {
            currentState = 1;
          } else {
            currentState = 0;
          }
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => MyTabs()),
            (route) => false,
          ); //MyTabs() 클래스를 재호출
        });
  }
}
