import 'package:flutter/material.dart';

//Setting 위젯 구현
class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      // Scaffold element - appBar
      appBar: AppBar(
          backgroundColor: Colors.grey[850],
          title: Text(
            'Settings',
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.bold,
            ),
          )),
      body: ListView(
        padding: const EdgeInsets.all(11),
        children: <Widget>[
          // 1st factor - Theme
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '테마',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 2nd factor - Version Check
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '버전 확인',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 3rd factor - Profile setup
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '프로필 설정',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 4th factor - User/Security
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '개인/보안',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 5th factor - Alarm
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '알림',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 6th factor - Screen
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '화면',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 7th factor - Others
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '기타',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 8th factor - Help
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '도움말',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 9th factor - Information
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '공지사항',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 10th factor - Contects
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '고객센터',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
          // 11th factor - Labotary
          Container(
            height: 50,
            color: Colors.grey[850],
            child: const Center(
                child: Text(
              '실험실',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            )),
          ),
        ],
      ),
    );
  }
}
