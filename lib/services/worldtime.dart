import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location name for the ui
  String time; //time of the location

  String flag; // url for the asset flags of the locations

  String url; //contains the url for the specific location for the api endpoint

  bool isDayTime; // true if time is 06:00 to 18:00, false otherwise

  WorldTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    try {
      Response response =
          await get('http://worldtimeapi.org/api/timezone/$url');
      Map data = jsonDecode(response.body);
      //print(data);

      //Get data we need from the raw data

      String datetime = data['datetime'];
      String offset1 = data['utc_offset'].substring(1, 3);
      String offset2 = data['utc_offset'].substring(4, 6);

      DateTime now = DateTime.parse(datetime);

      now = now.add(
          Duration(hours: int.parse(offset1), minutes: int.parse(offset2)));

      isDayTime = now.hour > 6 && now.hour < 18 ? true : false;
      // set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print('caught error: $e');
      time = 'could not get time';
    }
  }
}
