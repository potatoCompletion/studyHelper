import 'package:flutter/services.dart';
import 'dart:async';

class BTController {
  static const platform = const MethodChannel('flutter.native/helper');

  static Function _onData = (String string) => {};

  static init(Function onData) {
    _onData = onData;
    platform.setMethodCallHandler(_handler);
  }

  static Future<dynamic> _handler(MethodCall call) {
    return Future.value(_onData(call.arguments));
  }

  static Future<List<dynamic>> enumerateDevices() async {
    print('enumerating devices');

    try {
      return await platform.invokeMethod('enumerate-devices');
    } on PlatformException catch (e) {
      return [];
    }
  }

  static Future<void> connect(String address) async {
    print('connecting ' + address);

    try {
      return await platform.invokeMethod('connect', address);
    } on PlatformException catch (e) {}
  }

  static Future<void> transmit(String data) async {
    try {
      return await platform.invokeMethod('transmit', data);
    } on PlatformException catch (e) {}
  }
}
