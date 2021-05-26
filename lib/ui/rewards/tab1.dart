import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/global-variable/global-state.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
          // shrinkWrap: true
          itemCount: rewardCount,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, index) => Container(
              margin: EdgeInsets.all(1.0),
              decoration: BoxDecoration(
                color: Colors.grey[900],
                shape: BoxShape.rectangle,
              ),
              child: Stack(children: <Widget>[
                gridState(index),
                Align(
                  alignment: Alignment(xAlignment, yAlignment),
                  child: _textState(index),
                )
              ]))),
    );
  }
}

Text _textState(int index) {
  if (rewardCheck[index] == 1)
    return Text(
      rewardMap.keys.toList()[index],
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.grey[400],
        fontSize: 20.0,
      ),
    );
}

Widget gridState(int index) {
//  if (rewardCheck[rewardMap[test]] == 0) rewardCheck[rewardMap[test]] = 1;
  if (rewardCheck[rewardMap[test1]] == 0) rewardCheck[rewardMap[test1]] = 1;
  if (rewardCheck[index] == 1)
    return Center(child: Image.asset("assets/reward7.png"));
  else
    return Center(
        child: Icon(
      Icons.lock,
      color: Colors.orange,
      size: 50.0,
    ));
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
