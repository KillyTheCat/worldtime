import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      backgroundColor: data['isDayTime'] ? Colors.white70 : Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 120.0, 0, 30.0),
          child: Column(
            children: <Widget>[
              FlatButton.icon(
                onPressed: () async {
                  dynamic result =
                      await Navigator.pushNamed(context, '/chooselocation');
                  setState(() {
                    data = {
                      'time': result['time'],
                      'location': result['location'],
                      'isDayTime': result['isDayTime'],
                      'flag': result['flag']
                    };
                  });
                },
                icon: Icon(
                  Icons.edit_location,
                ),
                label: Text('Edit Location'),
                color: data['isDayTime'] ? Colors.transparent : Colors.white,
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    data['location'],
                    style: TextStyle(
                      fontSize: 28.0,
                      letterSpacing: 2.0,
                      color: data['isDayTime'] ? Colors.black : Colors.white70,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 66.0,
                  letterSpacing: 3.0,
                  color: data['isDayTime'] ? Colors.grey[800] : Colors.amber,
                  fontFamily: 'Seven-Segment',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
