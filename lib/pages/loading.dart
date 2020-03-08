import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'time.dart';


class Loading extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  

  void getData() async {
    GetTime instance = GetTime(flag: 'germ.png', location: 'London', url: 'Europe/London');
    await instance.getTime();
    
    
  }

  @override
  void initState() {
    super.initState();
    getData();
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
          child: Container(
        color: Colors.lightBlue,
        child: Center(
          child: Loading()
        ),
      ),
    );
  }
}