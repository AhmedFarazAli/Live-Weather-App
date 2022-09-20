import 'package:live_weather_app/constants.dart';

import 'location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import 'weather.dart';
WeatherModel weatherModel=WeatherModel();

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  void getValues() async{

    dynamic weatherData= await weatherModel.getData();
    print(weatherData);
    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(weatherData);
    }));
  }
  @override
  void initState() {
    getValues();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
          color: kBackGroundColor,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Stack(
              children: [
                Container(
                  width: 350,
                  height: 350,
                  // padding: EdgeInsets.all(15.0),
                  alignment: Alignment.topLeft,
                  child:Image.asset('images/banner_three_banner_shape_02.png') ,
                ),
                Positioned(
                  left: 300,
                  top: -20,
                  child: Container(
                    width: 350,
                    height: 350,
                    // padding: EdgeInsets.all(15.0),
                    alignment: Alignment.topRight,
                    child:Image.asset('images/Ellipse 2.png') ,
                  ),
                ),
              ],
            ),
            Center(child: SpinKitFadingCircle(
              color: Colors.black,
              size: 100,
            ),),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset('images/Polygon-2-3@3x.png'),
                ],
              ),
            )
          ],
        )
      ),
    );
  }
}
