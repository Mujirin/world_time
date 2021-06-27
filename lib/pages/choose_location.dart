import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {

  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  void getData() async {
    // simulate network request for a username
    String username = await Future.delayed(Duration(seconds: 3), (){
      return "Somename";
    });

    // simulate network request to get bio of the username
   String bio = await Future.delayed(Duration(seconds: 2), (){
      return "Jenius";
    });

    print("Statement $username $bio");
  }

  @override
  void initState() {
    super.initState();
    getData();
    print("hy there");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: Text(''),
    );
  }
}
