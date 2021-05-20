import 'package:flutter/material.dart';
import 'package:flutter_basic/main.dart';
import 'package:scratcher/scratcher.dart';
import './tab1.dart';

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
          length: 1,
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
                  //centerTitle: true,
                  bottom: TabBar(
                    controller: controller,
                    tabs: [
                      Tab(
                        icon: Icon(Icons.av_timer),
                        text: 'Timer',
                      ),
                      /*Tab(
                        text: 'Icon',
                      ),
                      Tab(
                        text: 'Icon',
                      ),
                      Tab(
                        text: 'Icon',
                      ),
                      Tab(
                        text: 'Icon',
                      ),*/
                    ],
                    isScrollable: true,
                  )),
              body: TabBarView(controller: controller, children: [
                Tab1(),
                /*GridView(
                  scrollDirection: Axis.vertical,
                  controller: ScrollController(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0),
                  children: List.generate(100, (index) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),
                          child: Icon(Icons.access_alarm,
                              size: 40.0, color: Colors.white30),
                        ),
                      ),
                      color: Colors.grey[600],
                      margin: EdgeInsets.all(1.0),
                    );
                  }),
                ),*/
                /*GridView.count(
                    crossAxisCount: 2,
                    children: List.generate(100, (index) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: GridTile(
                              footer: Text(
                                'Item $index',
                                textAlign: TextAlign.center,
                              ),
                              header: Text(
                                'SubItem $index',
                                textAlign: TextAlign.center,
                              ),
                              child: IconButton(
                                icon: Icon(Icons.access_alarm),
                                color: Colors.white,
                                iconSize: 40.0,
                                onPressed: () {
                                  print("Hello");
                                },
                              )),
                        ),
                        color: Colors.grey[600],
                        margin: EdgeInsets.all(1.0),
                      );
                    })),
                 GridView.builder(
                  itemCount: 50,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3),
                  itemBuilder: (BuildContext context, int index) {
                    //if (index < 50)
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),
                          child: Icon(Icons.access_alarm,
                              size: 40.0, color: Colors.white30),
                        ),
                      ),
                      color: Colors.blue[400],
                      margin: EdgeInsets.all(1.0),
                    );
                  },
                ),
                GridView.custom(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3),
                    childrenDelegate:
                        SliverChildListDelegate(List.generate(100, (index) {
                      return Container(
                        padding: EdgeInsets.all(20.0),
                        child: Center(
                          child: GridTile(
                            footer: Text(
                              'Item $index',
                              textAlign: TextAlign.center,
                            ),
                            header: Text(
                              'SubItem $index',
                              textAlign: TextAlign.center,
                            ),
                            child: Icon(Icons.access_alarm,
                                size: 40.0, color: Colors.white30),
                          ),
                        ),
                        color: Colors.blue[400],
                        margin: EdgeInsets.all(1.0),
                      );
                    }))),
                GridView.extent(
                  maxCrossAxisExtent: 200.0,
                  children: List.generate(100, (index) {
                    return Container(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: GridTile(
                          footer: Text(
                            'Item $index',
                            textAlign: TextAlign.center,
                          ),
                          header: Text(
                            'SubItem $index',
                            textAlign: TextAlign.center,
                          ),
                          child: Icon(Icons.access_alarm,
                              size: 40.0, color: Colors.white30),
                        ),
                      ),
                      color: Colors.blue[400],
                      margin: EdgeInsets.all(1.0),
                    );
                  }),
                )*/
              ]))),
    );
  }
}
