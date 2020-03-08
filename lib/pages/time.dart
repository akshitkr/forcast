import 'package:http/http.dart';
import 'dart:convert';

class GetTime {
  String time;
  String location;
  String url;
  String flag;

  GetTime({this.location, this.flag, this.url});

  Future<void> getTime() async {
    Response response = await get('http://worldtimeapi.org/api/timezone/Asia/Kolkata');
    Map data = jsonDecode(response.body);

    String datetime = data['datetime'];
    String offset = data['utc_offset'].substring(1,3);

    DateTime now = DateTime.parse(datetime);
    now = now.add(Duration(hours: int.parse(offset)));

    time = now.toString();


    


  }
}