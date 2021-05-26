import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/global-variable/global-state.dart';
import 'tab1.dart';

class Tab2 extends StatefulWidget {
  @override
  _Tab2State createState() => _Tab2State();
}

class _Tab2State extends State<Tab2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[850],
        body: Container(
            child: ListView.builder(
                padding: const EdgeInsets.all(8),
                itemCount: achievementCount,
                itemBuilder: (context, index) {
                  return Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12.0),
                          color: Colors.grey[900]),
                      child: ListTile(
                        subtitle: _state(index),
                      ));
                })));
  }
}

Widget _state(int index) {
  if (achievementCheck[achievementMap[test3]] == 0)
    achievementCheck[achievementMap[test3]] = 1;
  if (achievementCheck[index] == 1)
    return Text(
      rewardMap.keys.toList()[index],
      style: TextStyle(
        fontWeight: FontWeight.bold,
        color: Colors.white,
        fontSize: 18.0,
      ),
      textAlign: TextAlign.center,
    );
  else
    return Icon(
      Icons.lock,
      color: Colors.orange,
      size: 24.0,
    );
}
