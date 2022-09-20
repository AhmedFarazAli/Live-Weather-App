import 'package:flutter/material.dart';
import 'package:live_weather_app/constants.dart';
class CityLocation extends StatefulWidget {
  const CityLocation({Key? key}) : super(key: key);

  @override
  State<CityLocation> createState() => _CityLocationState();
}

class _CityLocationState extends State<CityLocation> {
  late String cityName;
  @override
  Widget build(BuildContext context) {
    return Container(
      color: kBackGroundColor,
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              style: TextStyle(
                color: Colors.black,
              ),
              onChanged: (value){
                cityName=value;
              },
            ),
            ElevatedButton(onPressed: (){
              Navigator.pop(context,cityName);
            }, child: Text(
              'Get Weather'
            ),),
          ],
        ),
      ),
    );
  }
}
