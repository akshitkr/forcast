import 'package:http/http.dart';
import 'dart:convert';
import 'package:intl/intl.dart';

class GetTime {
  String time;
  String location;
  String url;
  String flag;
  bool isDay;
  String temp;

  GetTime({this.location, this.flag, this.url, this.isDay});

  Future<void> getTime() async {
    try {


    Response response = await get('http://worldtimeapi.org/api/timezone/$url');
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offsethours = data['utc_offset'].substring(1,3);
    String offsetminutes = data['utc_offset'].substring(4,6);


    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offsethours)));
    now = now.add(Duration(minutes: int.parse(offsetminutes)));

    time = DateFormat.jm().format(now);

    isDay = now.hour > 6 && now.hour < 18 ? true : false;
    
    }
    catch (e){
      print('error $e');
      time = 'error in loading time :(';

    }
    






    


  }
}