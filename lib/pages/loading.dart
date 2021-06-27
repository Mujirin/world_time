import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

class Loading extends StatefulWidget {

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  void getTime() async {
    // Make request
    Response response = await get(Uri.parse('http://worldtimeapi.org/api/timezone/Asia/Jakarta'));
    Map data = jsonDecode(response.body);
    // print(data);

    // Get properties from data
    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1, 3);
    // print(datetime);
    print(offset);

    // Create datetime object
    DateTime now = DateTime.parse(datetime);
    print("datetiem befor now $now");
    now = now.add(Duration(hours: int.parse(offset)));
    print('after Now $now');
    print('datetime $datetime');
    print(int.parse(offset));



  }

  @override
  void initState() {
    super.initState();
    getTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Text('Loading screen'),
    );
  }
}
