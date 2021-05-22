import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/global-variable/global-state.dart';

class Tab1 extends StatefulWidget {
  @override
  _Tab1State createState() => _Tab1State();
}

class _Tab1State extends State<Tab1> {
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
                  // rewardMention(index),
                  decoration: gridState(index),
                  margin: EdgeInsets.all(1.0),
                  child: Icon(Icons.access_alarm,
                      size: 40.0, color: Colors.white30),
                )),
      ),
    );
  }
}

// Text textState(int index) {
//   if (rewardCheck[index] == 1) {
//     return Text(rewardMap[index], style: TextStyle(color: Colors.white));
//   }
// }

// Text get rewardMention(index){
//   if (rewardCheck[index]==1)
//   {
//     return Text('{rewardMap[index]}',
//     style: TextStyle(color: Colors.white,
//     fontSize: 25.0,
//     fontWeight: FontWeight.bold),)
//   }
// }

BoxDecoration gridState(int index) {
  if (rewardCheck[rewardMap[test]] == 0) rewardCheck[rewardMap[test]] = 1;
  if (rewardCheck[rewardMap[test1]] == 0) rewardCheck[rewardMap[test1]] = 1;
  if (rewardCheck[index] == 1) {
    return BoxDecoration(
      color: Colors.grey[600],
      shape: BoxShape.rectangle,
      image: DecorationImage(
        image: AssetImage("assets/reward7.png"),
      ),
    );
  } else {
    return BoxDecoration(
      color: Colors.grey[600],
      shape: BoxShape.rectangle,
    );
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
