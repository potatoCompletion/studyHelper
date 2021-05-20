/*
- Project Title -> CapstonDesign TouchDownTimer 
- 
- Calendar.dart -> sub Page of App
- Author        -> YuJunhee 
*/

/*
 - Package List 
 - 
 - 1st  -> fundametal Package 
 - 2nd  -> global variable 
 - 3rd  -> Alert massage
 - 4th  -> Calendar 
 -
 */

import 'package:flutter/material.dart';
import 'package:flutter_basic/ui/global-variable/global-state.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

/**
 - Page Layout
 -
 -
 -- Main Page----------------------------------------------

 - Page access  -> press 'calendar' button on Tab bar which is locatted in bellow
 - Page Concept -> Normal Calendar 
 - Page context -> it has imformations about user's achievement
 -              -> two states of achievement       
 -         
 -              -> first state  -> succeded to receive stamp -> red color
 -              -> Second state -> failed to receive stamp   -> green color
 - 
 - Button       -> used for jumping to sub page
 -
 -- Sub Page-----------------------------------------------

 - Page access  -> press Button located right bellow Calendar in Main Page
 - Page Concept -> Reward Calendar
 - Page context -> it has several user-interactive factors such as button etc
 - 
 - 
 - Button       -> User can get Daily reward through this button
 - 
 - Alert        -> show information that show how to get stamp using timer to user
 - 
 **/

/////////////////////////////////////////////////////////////////////////
// Main Page
/////////////////////////////////////////////////////////////////////////
class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  // Calendar & Stamp image controller
  CalendarController _controller;
  TextEditingController _eventController;

  // Variable for day control
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime _selectedDay;

  // input occured event data
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  // controller initialization
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
  }

  // event list elemet disposal
  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  // Calendar format which is for Main Page
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],

      ////////////////////////////////////////
      // Scaffold element -> appBar
      appBar: AppBar(
        title: Text(
          "Calendar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17.0,
          ),
        ),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),

      ////////////////////////////////////////
      // Scaffold element -> body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ////////////////////////////////////////
            /// Scaffold-body -> 1st Widget -> TableCalendar
            TableCalendar(
              ////////////////////////////////////////
              /// TableCalendar element -> initialCalendarFormat
              initialCalendarFormat: CalendarFormat.month,

              ////////////////////////////////////////
              /// TableCalendar element -> event
              events: selectedEvents,

              ////////////////////////////////////////
              /// TableCalendar element -> onDaySelected
              onDaySelected: (DateTime selectDay, _, __) {
                setState(() {
                  selectedDay = selectDay;
                  //print(selectedDay);
                });
              },

              ////////////////////////////////////////
              /// TableCalendar element -> calendarStyle
              calendarStyle: CalendarStyle(
                //// Today Tile color
                todayColor: Colors.blue,

                //// Selected day tile color
                selectedColor: Colors.amber[100],

                //// Today Style -> text color
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),

                //// OutSide Style -> text color
                outsideStyle: TextStyle(
                  color: Colors.grey,
                ),

                //// OutSide-Weekends Style -> text color
                outsideWeekendStyle: TextStyle(
                  color: Colors.red[200],
                ),

                //// Weekdays Style -> text color
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),

                //// eventday Style -> text color
                eventDayStyle: TextStyle(
                  color: Colors.white,
                ),

                //// marker Style -> marker color
                markersColor: Colors.green[700],
              ),

              ////////////////////////////////////////
              /// TableCalendar element -> headerStyle
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                //// left button style
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                //// right button style
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
                formatButtonShowsNext: false,
              ),

              ////////////////////////////////////////
              /// TableCalendar element -> builder
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber[100]),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, events) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                dowWeekdayBuilder: (context, date) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Text(
                    date.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                dowWeekendBuilder: (context, date) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Text(
                    date.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),

              ////////////////////////////////////////
              /// TableCalendar element -> calendarController
              calendarController: _controller,
            ),

            ////////////////////////////////////////
            /// Scaffold-body -> 2nd Widget -> Raisedbutton
            Builder(builder: (BuildContext context2) {
              return Container(
                child: Align(
                  alignment: Alignment(0.70, 0.50),
                  child: RaisedButton(
                    child: Text(
                      "Reward Calendar",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ////////////////////////////////////////
                    /// button reaction
                    onPressed: () {
                      Navigator.push(
                          context2,
                          MaterialPageRoute(
                              builder: (context) => RewardCalendarPage()));
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

/////////////////////////////////////////////////////////////////////////
// sub Page
/////////////////////////////////////////////////////////////////////////
class RewardCalendarPage extends StatefulWidget {
  @override
  _RewardCalendarPageState createState() => _RewardCalendarPageState();
}

class _RewardCalendarPageState extends State<RewardCalendarPage> {
  // Calendar & Stamp image controller
  CalendarController _controller;
  TextEditingController _eventController;

  // Variable for day control
  DateTime selectedDay = DateTime.now();
  DateTime focusedDay = DateTime.now();
  DateTime _selectedDay;

  // input occured event data
  List<Event> _getEventsfromDay(DateTime date) {
    return selectedEvents[date] ?? [];
  }

  // controller initialization
  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
    _eventController = TextEditingController();
  }

  // event list elemet disposal
  @override
  void dispose() {
    _eventController.dispose();
    super.dispose();
  }

  // Calendar format which is for Sub Page
  @override
  Widget build(BuildContext context3) {
    return Scaffold(
      backgroundColor: Colors.grey[850],

      ////////////////////////////////////////
      // Scaffold element -> appBar
      appBar: AppBar(
        title: Text(
          "Reward Calendar",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        backgroundColor: Colors.grey[850],
        elevation: 0.0,
      ),

      ////////////////////////////////////////
      // Scaffold element -> body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ////////////////////////////////////////
            /// Scaffold-body -> 1st Widget -> TableCalendar
            TableCalendar(
              ////////////////////////////////////////
              /// TableCalendar element -> initialCalendarFormat
              initialCalendarFormat: CalendarFormat.month,

              ////////////////////////////////////////
              /// TableCalendar element -> event
              events: selectedEvents,

              ////////////////////////////////////////
              /// TableCalendar element -> onDaySelected
              onDaySelected: (DateTime selectDay, _, __) {
                setState(() {
                  selectedDay = selectDay;
                  //print(selectedDay);
                });
              },

              ////////////////////////////////////////
              /// TableCalendar element -> calendarStyle
              calendarStyle: CalendarStyle(
                //// Today Tile color
                todayColor: Colors.blue,

                //// Selected day tile color
                selectedColor: Colors.green,

                //// Today Style -> text color
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),

                //// OutSide Style -> text color
                outsideStyle: TextStyle(
                  color: Colors.grey,
                ),

                //// OutSide-Weekends Style -> text color
                outsideWeekendStyle: TextStyle(
                  color: Colors.red[200],
                ),

                //// Weekdays Style -> text color
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),
                //// eventday Style -> text color
                eventDayStyle: TextStyle(
                  color: Colors.white,
                ),
              ),

              ////////////////////////////////////////
              /// TableCalendar element -> headerStyle
              headerStyle: HeaderStyle(
                centerHeaderTitle: true,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                ),
                //// left button style
                leftChevronIcon: Icon(
                  Icons.chevron_left,
                  color: Colors.white,
                ),
                //// right button style
                rightChevronIcon: Icon(
                  Icons.chevron_right,
                  color: Colors.white,
                ),
                formatButtonDecoration: BoxDecoration(
                  color: Colors.brown,
                  borderRadius: BorderRadius.circular(22.0),
                ),
                formatButtonTextStyle: TextStyle(
                  color: Colors.white,
                ),
                formatButtonShowsNext: false,
              ),

              ////////////////////////////////////////
              /// TableCalendar element -> builders
              builders: CalendarBuilders(
                selectedDayBuilder: (context, date, _) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.amber[100]),
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                todayDayBuilder: (context, date, _) => Container(
                    margin: const EdgeInsets.all(5.0),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.blue),
                        //color: Colors.blue,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Text(
                      date.day.toString(),
                      style: TextStyle(color: Colors.white),
                    )),
                dowWeekdayBuilder: (context, date) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Text(
                    date.toString(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                dowWeekendBuilder: (context, date) => Container(
                  margin: const EdgeInsets.all(5.0),
                  alignment: Alignment.center,
                  child: Text(
                    date.toString(),
                    style: TextStyle(color: Colors.red),
                  ),
                ),

                ////////////////////////////////////////
                // event day control builder
                markersBuilder: (context, date, selectedEvents, _) {
                  final children = <Widget>[];

                  // stamp image position
                  if (selectedEvents.isNotEmpty) {
                    children.add(
                      Positioned(
                        left: 1,
                        right: 1,
                        top: 1,
                        bottom: 1,
                        // jump to function which is for load image
                        child:
                            _buildEventMarkerSub(selectedDay, selectedEvents),
                      ),
                    );
                  }
                  return children;
                  //return;
                },
              ),

              ////////////////////////////////////////
              /// TableCalendar element -> calendarController
              calendarController: _controller,
            ),

            ////////////////////////////////////////
            /// Scaffold-body -> 2nd Widget -> Raisedbutton
            Builder(builder: (BuildContext context2) {
              return Container(
                child: Align(
                  alignment: Alignment(0.70, 0.50),
                  child: RaisedButton(
                    child: Text(
                      "Reward",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),

                    ////////////////////////////////////////
                    /// button reaction
                    onPressed: () {
                      var alertStyle = AlertStyle(
                        backgroundColor: Colors.grey[700],
                        descStyle: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                        titleStyle: TextStyle(
                          color: Colors.grey[200],
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        alertBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.white,
                          ),
                        ),
                      );

                      ////////////////////////////////////////
                      /// pop up message
                      Alert(
                        context: context2,
                        style: alertStyle,
                        title: "오늘도, 수고했어",
                        desc: "타이머의 버튼을 눌러 도장을 받으세요",
                        //image: Image.asset("assets\\pushdown.jpg"),
                        image: Image.asset("assets/pushdown.PNG",
                        //height: 170,
                        //width: 170,
                        //alignment: Alignment(-1, 0),
                        ),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "이해했습니다",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey[200],
                                fontSize: 18.0,
                              ),
                            ),

                            ////////////////////////////////////////
                            /// button reaction
                            onPressed: () {
                              stampDayCount += 1;
                              // image load
                              if (selectedEvents[selectedDay] != null) {
                                selectedEvents[selectedDay].add(
                                  Event(title: ""),
                                );
                              } else {
                                selectedEvents[selectedDay] = [
                                  Event(title: ""),
                                ];
                              }

                              // reward manage
                              switch (stampDayCount) {
                                // count 3
                                case 3:
                                  {
                                    // Snack Bar setup
                                    Scaffold.of(context2).showSnackBar(SnackBar(
                                      content: Text(
                                        "작심삼일이 뭔데???",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0,
                                        ),
                                      ),
                                      backgroundColor: Colors.teal,
                                      duration: Duration(milliseconds: 2500),
                                    ));
                                    Navigator.pop(context2);
                                  }
                                  break;

                                // count 7
                                case 7:
                                  {
                                    Navigator.pop(context2);
                                    Alert(
                                      context: context2,
                                      style: alertStyle,
                                      title: "이대로만 가자!",
                                      desc: "7일 연속 수고했어!",
                                      image: Image.asset("assets/reward7.png",
                                      color: Colors.grey[600],
                                      ),
                                      buttons: [
                                        DialogButton(
                                          child: Text(
                                            "메달 받기",
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white,
                                              fontSize: 18.0,
                                            ),
                                          ),
                                          onPressed: () {
                                            Navigator.pop(context2);
                                          },
                                          color: Colors.grey[600],
                                          radius: BorderRadius.circular(10.0),
                                        ),
                                      ],
                                    ).show();
                                  }
                                  break;

                                // default
                                default:
                                  {
                                    Navigator.pop(context2);
                                  }
                                  break;
                              }

                              //Navigator.pop(context2);
                              _eventController.clear();

                              setState(() {});
                              return;
                            },
                            color: Colors.grey[850],
                            radius: BorderRadius.circular(10.0),
                          ),
                        ],
                      ).show();
                    },
                  ),
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}

////////////////////////////////////////
/// pre-function for Marker image setup
Widget _buildEventMarkerSub(DateTime date, List events) {
  return buildCalendarDayMarkerSub(date, events);
}

////////////////////////////////////////
/// main-function for Marker image setup
AnimatedContainer buildCalendarDayMarkerSub(DateTime date, List events) {
  return AnimatedContainer(
    duration: Duration(milliseconds: 300),
    decoration: BoxDecoration(
      shape: BoxShape.rectangle,
      image: DecorationImage(
        image: AssetImage('assets/stamp-sample.png'),
      ),
    ),
    width: 53,
    height: 53,
  );
}
