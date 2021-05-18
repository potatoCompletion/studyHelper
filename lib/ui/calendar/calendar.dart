import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';
import 'package:table_calendar/table_calendar.dart';

class Calendar extends StatefulWidget {
  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<Calendar> {
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
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
      // Scaffold element -> body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.blue,
                selectedColor: Colors.green,
                //// Today Style
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
                //// OutSide Style
                outsideStyle: TextStyle(
                  color: Colors.grey,
                ),
                //// OutSide-Weekends Style
                outsideWeekendStyle: TextStyle(
                  color: Colors.red[200],
                ),
                //// Weekdays Style
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
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
              builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      )),
                  todayDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.blue,
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
                      )),
              calendarController: _controller,
            ),

            //// Raised Button
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
  CalendarController _controller;

  @override
  void initState() {
    super.initState();
    _controller = CalendarController();
  }

  Container buildCalendarDay(String day, Color backColor) {
    return Container(
      color: Colors.grey[600],
      width: 53,
      height: 53,
    );
  }

  AnimatedContainer buildCalendarDayMarker(String text, Color backColor) {
    return AnimatedContainer(
      duration: Duration(microseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        image: DecorationImage(
          image: AssetImage('assets\\stamp-sample.png'),
        ),
      ),
      width: 52,
      height: 52,
    );
  }

  // var alertStyle = AlertStyle(
  //   descStyle: TextStyle(
  //     color: Colors.black,
  //     fontWeight: FontWeight.bold,
  //     fontSize: 20.0,
  //   ),
  // );

  @override
  Widget build(BuildContext context3) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
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
      // Scaffold element -> body
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            TableCalendar(
              initialCalendarFormat: CalendarFormat.month,
              calendarStyle: CalendarStyle(
                todayColor: Colors.blue,
                selectedColor: Colors.green,
                //// Today Style
                todayStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                  color: Colors.white,
                ),
                //// OutSide Style
                outsideStyle: TextStyle(
                  color: Colors.grey,
                ),
                //// OutSide-Weekends Style
                outsideWeekendStyle: TextStyle(
                  color: Colors.red[200],
                ),
                //// Weekdays Style
                weekdayStyle: TextStyle(
                  color: Colors.white,
                ),
              ),
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
              builders: CalendarBuilders(
                  selectedDayBuilder: (context, date, events) => Container(
                      margin: const EdgeInsets.all(5.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          //color: Theme.of(context).primaryColor,
                          //color: Colors.grey[850],
                          border: Border.all(color: Colors.red),
                          // image: DecorationImage(
                          //   image: AssetImage('assets\\stamp-sample.png'),
                          // ),
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
                      )),
              calendarController: _controller,
            ),

            //// Snack Bar
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
                    onPressed: () {
                      var alertStyle = AlertStyle(
                        descStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                        ),
                        titleStyle: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                        alertBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          side: BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                      );

                      Alert(
                        context: context2,
                        style: alertStyle,
                        title: "오늘도, 수고했어",
                        desc: "타이머의 버튼을 눌러 도장을 받으세요",
                        //image: Image.asset("assets\\pushdown.jpg"),
                        image: Image.asset("assets/pushdown.jpg"),
                        buttons: [
                          DialogButton(
                            child: Text(
                              "이해했습니다",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                fontSize: 18.0,
                              ),
                            ),
                            onPressed: () => Navigator.pop(context2),
                            color: Colors.grey[600],
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
