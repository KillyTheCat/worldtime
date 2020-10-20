import 'package:flutter/material.dart';
import 'package:worldtime/services/worldtime.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  void setUpWorldTime() async {
    WorldTime demo =
        WorldTime(location: 'Kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await demo.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': demo.location,
      'flag': demo.flag,
      'time': demo.time,
      'isDayTime': demo.isDayTime,
    });
  }

  @override
  void initState() {
    super.initState();
    // getTime();
    setUpWorldTime();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: SpinKitChasingDots(
        color: Colors.blue,
        size: 80.0,
      ),
    ));
  }
}
