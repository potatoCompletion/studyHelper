import 'package:flutter/material.dart';

import './timer/dtimer.dart';
import './timer/atimer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PageView(children: [Dtimer(), Atimer()]);
  }
}
//TODO : PageView 사용해서 두 가지 타이머 스와이프 전환 가능하게 구현 완료. (2021-05-11)
