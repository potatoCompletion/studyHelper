import 'package:flutter/material.dart';

// Reward 위젯 구현
class Reward extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('리워드 위젯 샘플')),
        body: GridView.count(
          crossAxisCount: 2,
          children: List.generate(
            100,
            (index) {
              return Center(
                  child: Text(
                'Item $index',
                style: Theme.of(context).textTheme.headline6,
              ));
            },
          ),
        ));
  }
}
