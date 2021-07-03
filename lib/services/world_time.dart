import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class WorldTime {

  String location; // location name for the UI
  String time = ''; // the time in that location
  String flag; // url to an asset flag icon
  String url; // this is the location url for api endpoint

  WorldTime({ required this.location, required this.flag, required this.url });

  Future<void> getTime() async {

    try {
      // Make request
      Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/$url'));
      Map data = jsonDecode(response.body);
      // print(data);

      // Get properties from data
      String datetime = data['datetime'];
      String offset = data['utc_offset'].substring(1, 3);
      print(offset);

      // Create datetime object
      DateTime now = DateTime.parse(datetime);
      now = now.add(Duration(hours: int.parse(offset)));

      // set the time properti
      // time = now.toString();
      time = DateFormat.jm().format(now);

    } catch (e) {
      print('The error: $e');
      time = 'The time cannot be determine';
    }
  }
}
