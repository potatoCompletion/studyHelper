import 'package:flutter/material.dart';

import '../main.dart';
import './timer/dtimer.dart';
import './timer/atimer.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    if (currentState == 0) {
      return Dtimer();
    }
    if (currentState == 1) {
      return Atimer();
    }
  }
}