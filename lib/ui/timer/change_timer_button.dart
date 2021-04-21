import 'package:flutter/material.dart';

import '../../main.dart';
import '../home.dart';

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