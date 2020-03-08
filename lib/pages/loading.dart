import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'time.dart';
import 'package:loading/loading.dart';
import 'package:loading/indicator/ball_pulse_indicator.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<LoadingScreen> {
  

  void getData() async {
    GetTime instance = GetTime(flag: 'germ.png', location: 'Tahiti', url: 'Pacific/Tahiti');
    await instance.getTime();
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDay':instance.isDay,
      
    });
    
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
          child: Loading(indicator: BallPulseIndicator(), size: 100.0),
        ),
      ),
    );
  }
}