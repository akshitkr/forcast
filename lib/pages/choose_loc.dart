import 'package:flutter/material.dart';
import 'time.dart';
import 'dart:convert';
class ChooseLocation extends StatefulWidget {
  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    super.initState();
  }

  List<GetTime> locations = [
    GetTime(flag: 'germ.png', location: 'Tahiti', url: 'Pacific/Tahiti'),
    GetTime(flag: 'germ.png', location: 'London', url: 'Europe/London'),
    GetTime(flag: 'germ.png', location: 'Berlin', url: 'Europe/Berlin'),
    GetTime(flag: 'germ.png', location: 'Kolkata', url: 'Asia/Kolkata'),
    GetTime(flag: 'germ.png', location: 'Tokyo', url: 'Asia/Tokyo'),
    GetTime(flag: 'germ.png', location: 'Nairobi', url: 'Africa/Nairobi'),
    GetTime(flag: 'germ.png', location: 'Cairo', url: 'Africa/Cairo')
  ];

  void updateTime(index) async {
    GetTime instance = locations[index];
    await instance.getTime();
    Navigator.pop(context, {
      'location':instance.location,
      'time':instance.time,
      'flag':instance.flag,
      'isDay':instance.isDay,
      
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
        itemCount: locations.length,
        itemBuilder: (context, index){
          return Card(
            child: ListTile(
              onTap: (){
                updateTime(index);
              },
              title: Text(locations[index].location),
            )
          );
        },
      ),
    );

  }
}