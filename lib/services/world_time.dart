import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {
  String location; //location of the UI
  String time; //time for that location
  String flag; // url to an asset flag icon
  String url; // location url for api endpoint
  bool isDayTime; // true or false if daytime or not

  WorldTime({this.location, this.flag, this.url});

  Future<void> getData() async {
    try {
      //make the request
      Response response = await get(Uri.parse('https://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);

      //get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);

      // print(datetime);
      // print(offset);

      //create DateTime

      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      isDayTime = now.hour > 6 && now.hour < 20 ? true : false;
      // set the time property
      time = DateFormat.jm().format(now);
    } catch (e) {
      print(e);
      time = "Could not get time";
    }
  }
}
