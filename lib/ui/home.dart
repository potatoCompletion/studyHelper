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
    return PageView(children: [
      AutomaticKeepAliveScreen(
        child: Dtimer(),
      ),
      AutomaticKeepAliveScreen(
        child: Atimer(),
      )
    ]);
  }
}
//TODO : PageView 사용해서 두 가지 타이머 스와이프 전환 가능하게 구현 완료. (2021-05-11)

class AutomaticKeepAliveScreen extends StatefulWidget {
  final Widget child;

  AutomaticKeepAliveScreen({
    Key key,
    @required this.child,
  }) : assert(child != null);

  @override
  _AutomaticKeepAliveScreenState createState() =>
      _AutomaticKeepAliveScreenState();
}

class _AutomaticKeepAliveScreenState extends State<AutomaticKeepAliveScreen>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true;

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return widget.child;
  }
}