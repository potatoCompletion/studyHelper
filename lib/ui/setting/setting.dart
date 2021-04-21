import 'package:flutter/material.dart';

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