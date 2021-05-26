import 'package:flutter/material.dart';
import 'package:flutter_basic/main.dart';
import 'package:scratcher/scratcher.dart';
import './tab1.dart';
import 'tab2.dart';

class Reward extends StatefulWidget {
  @override
  _Reward createState() => _Reward();
}

class _Reward extends State<Reward> with SingleTickerProviderStateMixin {
  final List<Tab> rewardTabs = <Tab>[
    Tab(
      text: 'icon',
      icon: Icon(Icons.alarm_sharp),
    ),
  ];

  TabController controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(vsync: this, length: rewardTabs.length);
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: DefaultTabController(
          length: 2,
          child: Scaffold(
              backgroundColor: Colors.grey[850],
              appBar: AppBar(
                  backgroundColor: Colors.grey[850],
                  title: Text(
                    'Reward',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 17.0,
                    ),
                  ),
                  bottom: TabBar(
                    //controller: controller,
                    tabs: [
                      Tab(
                        //icon: Icon(Icons.lock),
                        text: 'Grid',
                      ),
                      Tab(
                        // icon: Icon(Icons.av_timer),
                        text: 'List',
                      ),
                    ],
                    isScrollable: true,
                  )),
              body: TabBarView(children: [
                Tab1(),
                Tab2(),
              ]))),
    );
  }
}
