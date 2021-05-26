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
  var stopCount = 0;
  int dCounterTime;

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
var axisCount = 6;

var test = '작심삼일이 뭔데???';
var test1 = '7일 연속 수고했어!';

var rewardCheck = List<int>.filled(axisCount, 0);

Map rewardMap = {
  '7일 연속 수고했어!': 0,
  '작심삼일이 뭔데???': 1,
  '벌써 한 달!': 2,
  '100일!': 3,
  '123': 4,
  '456': 5
};

//////////////////////////////////////////////////////////
/// Reward
//////////////////////////////////////////////////////////
//
//
