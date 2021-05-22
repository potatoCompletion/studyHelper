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

  void addStopCount() {
    stopCount++;
  }
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
var _itemCount = 2;

var test = '작심삼일이 뭔데???';
var test1 = '7일 연속 수고했어!';

var rewardCheck = List<int>.filled(_itemCount, 0);

Map rewardMap = {'7일 연속 수고했어!': 0, '작심삼일이 뭔데???': 1};

//////////////////////////////////////////////////////////
/// Reward
//////////////////////////////////////////////////////////
//
//
