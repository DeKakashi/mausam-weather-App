import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../worker/worker.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {

  late String city = "Indore";
  late String temp;
  late String hum;
  // ignore: non_constant_identifier_names
  late String air_speed;
  late String des;
  late String main;
  late String icon;

  void startApp(String city) async
  {
    worker instance  = worker(location: city);
    await instance.getData();

    temp = instance.temp;
    hum = instance.humidity;
    air_speed = instance.air_speed;
    des = instance.description;
    main = instance.main;
    icon = instance.icon;


    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushReplacementNamed(context, '/home',arguments: {
        "temp_value" : temp,
        "hum_value" : hum,
        "air_speed_value" : air_speed,
        "des_value" : des,
        "main_value" : main,
        "icon_value" : icon,
        "city_value" : city,




      } );
    });

  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    Map? search = ModalRoute.of(context)!.settings.arguments as Map?;

    if(search?.isNotEmpty ?? false)
    {
      city = search?['searchText'];
    }
    startApp(city);
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const SizedBox(height: 180,),
              Image.network("https://img.freepik.com/free-icon/weather_318-452578.jpg?w=2000",height: 240,width: 240,),

              const Text("Mausam App",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.white
                ),),
              const SizedBox(height: 10,),
              const Text("Made By Dev",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white
                ),),
              const SizedBox(height: 30,),
              const SpinKitWave(
                color: Colors.white,
                size: 50.0,
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.blue[300],

    );
  }
}