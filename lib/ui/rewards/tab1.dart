import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/global-variable/global-state.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  List<int> zero = [0];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Container(
        child: GridView.builder(
            itemCount: 50,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (context, index) => Container(
                  decoration: gridState(index),
                  margin: EdgeInsets.all(1.0),
                  child: Icon(Icons.access_alarm,
                      size: 40.0, color: Colors.white30),
                )),
      ),
    );
  }
}

BoxDecoration gridState(int index) {
  switch (stampDayCount) {
    case 3:
      {
        if (stampDayCount == index) {
          return BoxDecoration(
            color: Colors.grey[600],
            shape: BoxShape.rectangle,
            image: DecorationImage(
              image: AssetImage("assets/reward7.png"),
            ),
          );
        }
        //specificGirdStyle(0);
      }
      break;

    default:
      {
        return BoxDecoration(
          color: Colors.grey[600],
          shape: BoxShape.rectangle,
        );
      }
      break;
  }
}

BoxDecoration specificGirdStyle(int index) {
  return BoxDecoration(
    color: Colors.grey[600],
    shape: BoxShape.rectangle,
    image: DecorationImage(
      image: AssetImage("assets/reward7.png"),
    ),
  );
}
