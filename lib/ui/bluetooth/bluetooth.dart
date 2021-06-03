import 'package:flutter/material.dart';
import 'dart:async';
import 'bt-controller.dart';

class ArduinoBT extends StatefulWidget {
  @override
  _ArduinoBTState createState() => _ArduinoBTState();
}

class _ArduinoBTState extends State<ArduinoBT> {
  String sensorValue = "N/A";
  bool ledState = false;

  @override
  initState() {
    super.initState();
    BTController.init(onData);
    scanDevices();
  }

  void onData(dynamic str) {
    setState(() {
      sensorValue = str;
    });
  }

  void switchLed() {
    setState(() {
      ledState = !ledState;
    });
    BTController.transmit(ledState ? '0' : '1');
  }

  Future<void> scanDevices() async {
    BTController.enumerateDevices().then((devices) {
      onGetDevices(devices);
    });
  }

  void onGetDevices(List<dynamic> devices) {
    Iterable<SimpleDialogOption> options = devices.map((device) {
      return SimpleDialogOption(
        child: Text(device.keys.first),
        onPressed: () {
          selectDevice(device.values.first);
        },
      );
    });

    SimpleDialog dialog = SimpleDialog(
      title: const Text('Choose a device'),
      children: options.toList(),
    );

    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return dialog;
        });
  }

  selectDevice(String deviceAddress) {
    Navigator.of(context, rootNavigator: true).pop('dialog');
    BTController.connect(deviceAddress);
  }

  @override
  Widget build(BuildContext context) {
    Color color = ledState ? Colors.deepPurpleAccent : Colors.white24;
    TextTheme theme = Theme.of(context).textTheme;

    return Scaffold(
      //appBar: AppBar(title: Text(widget.title)),
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Sensor Value',
                style: theme.display1.copyWith(color: Colors.white)),
            Text(sensorValue,
                style: theme.display2.copyWith(color: Colors.white)),
          ],
        )),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: color,
        onPressed: switchLed,
        tooltip: 'Increment',
        child: Icon(Icons.power_settings_new),
      ),
    );
  }
}

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:flutter_blue/flutter_blue.dart';

// class Bluetooth extends StatefulWidget {
//   final FlutterBlue flutterBlue = FlutterBlue.instance;
//   final List<BluetoothDevice> devicesList = new List<BluetoothDevice>();
//   final Map<Guid, List<int>> readValues = new Map<Guid, List<int>>();

//   @override
//   _BluetoothState createState() => _BluetoothState();
// }

// class _BluetoothState extends State<Bluetooth> {
//   final _writeController = TextEditingController();
//   BluetoothDevice _connectedDevice;
//   List<BluetoothService> _services;
//   //bool _isScanning= false;

//   _addDeviceTolist(final BluetoothDevice device) {
//     if (!widget.devicesList.contains(device)) {
//       setState(() {
//         widget.devicesList.add(device);
//       });
//     }
//   }

//   @override
//   void initState() {
//     super.initState();
//     widget.flutterBlue.connectedDevices
//         .asStream()
//         .listen((List<BluetoothDevice> devices) {
//       for (BluetoothDevice device in devices) {
//         _addDeviceTolist(device);
//       }
//     });
//     widget.flutterBlue.scanResults.listen((List<ScanResult> results) {
//       for (ScanResult result in results) {
//         _addDeviceTolist(result.device);
//       }
//     });
//     widget.flutterBlue.stopScan();
//   }

//   ListView _buildListViewOfDevices() {
//     List<Container> containers = new List<Container>();
//     for (BluetoothDevice device in widget.devicesList) {
//       containers.add(
//         Container(
//           height: 50,
//           child: Row(
//             children: <Widget>[
//               Expanded(
//                 child: Column(
//                   children: <Widget>[
//                     Text(
//                       device.name == '' ? '(unknown device)' : device.name,
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                     Text(
//                       device.id.toString(),
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               FlatButton(
//                 color: Colors.blue[800],
//                 child: Text(
//                   'Connect',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 onPressed: () async {
//                   widget.flutterBlue.stopScan();
//                   try {
//                     await device.connect();
//                   } catch (e) {
//                     if (e.code != 'already_connected') {
//                       throw e;
//                     }
//                   } finally {
//                     _services = await device.discoverServices();
//                   }
//                   setState(() {
//                     _connectedDevice = device;
//                   });
//                 },
//               ),
//             ],
//           ),
//         ),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }

//   List<ButtonTheme> _buildReadWriteNotifyButton(
//       BluetoothCharacteristic characteristic) {
//     List<ButtonTheme> buttons = new List<ButtonTheme>();

//     if (characteristic.properties.read) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: RaisedButton(
//               color: Colors.blue,
//               child: Text('READ', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 var sub = characteristic.value.listen((value) {
//                   setState(() {
//                     widget.readValues[characteristic.uuid] = value;
//                   });
//                 });
//                 List<int> value1 = await characteristic.read();
//                 print(value1);
//                 sub.cancel();
//               },
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.write) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: RaisedButton(
//               child: Text('WRITE', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 await showDialog(
//                     context: context,
//                     builder: (BuildContext context) {
//                       return AlertDialog(
//                         title: Text("Write"),
//                         content: Row(
//                           children: <Widget>[
//                             Expanded(
//                               child: TextField(
//                                 controller: _writeController,
//                               ),
//                             ),
//                           ],
//                         ),
//                         actions: <Widget>[
//                           FlatButton(
//                             child: Text(
//                               "Send",
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () {
//                               characteristic.write(
//                                   utf8.encode(_writeController.value.text));
//                               Navigator.pop(context);
//                             },
//                           ),
//                           FlatButton(
//                             child: Text(
//                               "Cancel",
//                               style: TextStyle(
//                                 color: Colors.white,
//                               ),
//                             ),
//                             onPressed: () {
//                               Navigator.pop(context);
//                             },
//                           ),
//                         ],
//                       );
//                     });
//               },
//             ),
//           ),
//         ),
//       );
//     }
//     if (characteristic.properties.notify) {
//       buttons.add(
//         ButtonTheme(
//           minWidth: 10,
//           height: 20,
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 4),
//             child: RaisedButton(
//               child: Text('NOTIFY', style: TextStyle(color: Colors.white)),
//               onPressed: () async {
//                 characteristic.value.listen((value) {
//                   widget.readValues[characteristic.uuid] = value;
//                 });
//                 await characteristic.setNotifyValue(true);
//               },
//             ),
//           ),
//         ),
//       );
//     }

//     return buttons;
//   }

//   ListView _buildConnectDeviceView() {
//     List<Container> containers = new List<Container>();

//     for (BluetoothService service in _services) {
//       List<Widget> characteristicsWidget = new List<Widget>();

//       for (BluetoothCharacteristic characteristic in service.characteristics) {
//         characteristicsWidget.add(
//           Align(
//             alignment: Alignment.centerLeft,
//             child: Column(
//               children: <Widget>[
//                 Row(
//                   children: <Widget>[
//                     Text(characteristic.uuid.toString(),
//                         style: TextStyle(fontWeight: FontWeight.bold)),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     ..._buildReadWriteNotifyButton(characteristic),
//                   ],
//                 ),
//                 Row(
//                   children: <Widget>[
//                     Text(
//                       'Value: ' +
//                           widget.readValues[characteristic.uuid].toString(),
//                       style: TextStyle(
//                         color: Colors.white,
//                       ),
//                     ),
//                   ],
//                 ),
//                 Divider(),
//               ],
//             ),
//           ),
//         );
//       }
//       containers.add(
//         Container(
//           child: ExpansionTile(
//               title: Text(service.uuid.toString()),
//               children: characteristicsWidget),
//         ),
//       );
//     }

//     return ListView(
//       padding: const EdgeInsets.all(8),
//       children: <Widget>[
//         ...containers,
//       ],
//     );
//   }

//   ListView _buildView() {
//     if (_connectedDevice != null) {
//       return _buildConnectDeviceView();
//     }
//     return _buildListViewOfDevices();
//   }

// /////////////////////////////////////////////////////////////

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.grey[850],

//       ////////////////////////////////////////
//       // Scaffold element -> appBar
//       appBar: AppBar(
//         title: Text(
//           "Bluetooth",
//           style: TextStyle(
//             color: Colors.white,
//             fontWeight: FontWeight.bold,
//             fontSize: 17.0,
//           ),
//         ),
//         backgroundColor: Colors.grey[850],
//         elevation: 0.0,
//         actions: <Widget>[
//           IconButton(
//               icon: Icon(Icons.bluetooth_rounded),
//               onPressed: () async {
//                 widget.flutterBlue.startScan(timeout: Duration(seconds: 10));

//                 setState(
//                   () {
//                     widget.devicesList.clear();
//                   },
//                 );
//               }),
//         ],
//       ),

//       body: _buildView(),
//     );
//   }
// }
