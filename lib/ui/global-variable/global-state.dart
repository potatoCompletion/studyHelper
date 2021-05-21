/**
 - file Layout
 -
 -
 -- 1st Section -----------------------------------------
 -
 - Timer Global state 
 - 
 -
 -- 2nd Section -----------------------------------------
 -
 - Calendar Global state
 -
 -
 -- 3rd Section ----------------------------------------- 
 -
 - Reward Global state
 -
 -
 **/

//////////////////////////////////////////////////////////
/// Timer
//////////////////////////////////////////////////////////
//
//
class TimerVal {
  int stopCount = 0;
  String labTime;
}

//////////////////////////////////////////////////////////
/// Calandar
//////////////////////////////////////////////////////////
//
//
class Event {
  final String title;
  Event({this.title});

  String toSting() => this.title;
}

// Keep specific events that represent that user has received stamp
Map<DateTime, List<Event>> selectedEvents = {};

// reward day count
var stampDayCount = 0;
var _itemCount = 50;

//////////////////////////////////////////////////////////
/// Reward
//////////////////////////////////////////////////////////
//
//
