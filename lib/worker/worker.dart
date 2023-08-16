import 'package:http/http.dart';
import 'dart:convert';

// ignore: camel_case_types
class worker
{

  late String location;

  //Constructor

  worker({required this.location})
  {
    location = location;
  }
  late String temp;
  late String air_speed;
  late String humidity;
  late String description;
  late String main;
  late String icon;


  //method
  Future<void> getData() async
  {
    try{
      Response response  =await get("http://api.openweathermap.org/data/2.5/weather?q=$location&appid=e34a5eb0b4c5ff748fdf9219a63d224e" as Uri);
      Map data = jsonDecode(response.body);

      print(data);
      //Getting Temp,Humidity
      Map tempData = data['main'];
      String getHumidity = tempData['humidity'].toString();
      double getTemp = tempData['temp'] - 273.15;

//Getting air_speed
      Map wind = data['wind'];
      double getairSpeed = wind["speed"]/0.27777777777778;


      //Getting Description
      List weatherData = data['weather'];
      Map weatherMainData = weatherData[0];
      String getmainDes = weatherMainData['main'];
      String getDesc = weatherMainData["description"];




      //Assigning Values
      temp = getTemp.toString(); //C
      humidity = getHumidity; // %
      air_speed = getairSpeed.toString(); //km/hr
      description = getDesc;
      main = getmainDes;
      icon = weatherMainData["icon"].toString();

    }catch(e)
    {
      print(e);
      temp = "NA";
      humidity = "NA";
      air_speed = "NA";
      description = "Can't Find Data";
      main = "NA";
      icon = "09d";
    }



  }


}