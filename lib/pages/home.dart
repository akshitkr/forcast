import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};
  String temp = '0';

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    String location = data['location'];

    void getWeather() async {
    Response weather = await get('https://samples.openweathermap.org/data/2.5/weather?q=$location&appid=b2570864304e97e5fce40fa539a1865b');
    Map weatherdata = jsonDecode(weather.body);
    temp = ((weatherdata['main']['temp'])-273).toString().substring(0,4);
    print(temp);

    } 
    

    String back = data['isDay'] ? 'day.jpeg' : 'night.jpeg';
    Color daynightcolor = data['isDay'] ? Colors.black : Colors.white;
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image:
            DecorationImage(image: AssetImage('pics/$back'), fit: BoxFit.cover),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          SizedBox(height: 80),
          FlatButton.icon(
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, '/location');
                setState(() {
                  data = 
                    result;
                });
                getWeather();
              },
              icon: Icon(Icons.edit_location,color: daynightcolor,),
              label: Text(
                'Edit Location',
                style: TextStyle(fontSize: 15, color: daynightcolor),
              )),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(data['location'], style: TextStyle(fontSize: 30.0, color: daynightcolor)),
            ],
          ),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(data['time'], style: TextStyle(fontSize: 50.0, color: daynightcolor)),
            ],
          ),
        ],
      ),
    ));
  }
}
