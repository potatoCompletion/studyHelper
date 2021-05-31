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
  Duration dTimerTime = Duration(hours: 0, minutes: 0, seconds: 3);

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
var rewardCount = 15;
var achievementCount = 15;

var test = '벌써 한 달!';
var test1 = '91011';

var test3 = '333333';

var xAlignment = 0.0;
var yAlignment = 0.9;

var rewardCheck = List<int>.filled(rewardCount, 0);
var achievementCheck = List<int>.filled(achievementCount, 0);

Map rewardMap = {
  '7일 연속 수고했어!': 0,
  '벌써 한 달!': 1,
  '100일!': 2,
  '123': 3,
  '456': 4,
  '678': 5,
  '91011': 6,
  '121314': 7,
  '151617': 8,
  '181920': 9,
  '212223': 10,
  '242526': 11,
  '272829': 12,
  '303132': 13,
  '333435': 14,
};

Map achievementMap = {
  '작심삼일이 뭔데???': 0,
  '111111': 1,
  '222222': 2,
  '333333': 3,
  '444444': 4,
  '555555': 5,
  '666666': 6,
  '777777': 7,
  '888888': 8,
  '999999': 9,
  '101010': 10,
  '121212': 11,
  '131313': 12,
  '141414': 13,
  '151515': 14,
};

//////////////////////////////////////////////////////////
/// Reward
//////////////////////////////////////////////////////////
//
//

