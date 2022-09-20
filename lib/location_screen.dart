import 'package:flutter/material.dart';
import 'package:live_weather_app/constants.dart';
import 'weather.dart';
import 'loading_Screen.dart';
import 'city_location.dart';
WeatherModel weatherModel=WeatherModel();
LoadingScreen loadingScreen=LoadingScreen();

class LocationScreen extends StatefulWidget {
  final weatherData;
  LocationScreen(this.weatherData);

  @override
  State<LocationScreen> createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  late int tempreture;
  late String cityName;
  late int condition;
  late int wind;
  late int humidity;
  late int pressure;
  @override
  void initState() {
    updateUi(widget.weatherData);
    super.initState();
  }
  void updateUi(dynamic weathData){
    setState(() {
      if(weathData==null){
        tempreture=0;
        cityName='Not Available';
        condition=0;
        wind=0;
        humidity=0;
        pressure=0;
        return;
      }
      condition=weathData['weather'][0]['id'];
      double temp=weathData['main']['temp'];
      tempreture=temp.toInt();
      cityName=weathData['name'];
      double tempwind=weathData['wind']['speed'];
      wind=tempwind.toInt();
      humidity=weathData['main']['humidity'];
      pressure=weathData['main']['pressure'];
    });

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        color: kBackGroundColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () async{
                    var weather=await weatherModel.getData();
                    updateUi(weather);
                    print(weather);
                  },
                    child: Icon(
                  Icons.near_me,
                  size: 50,
                )),
                GestureDetector(
                  onTap: ()async{
                    var typeName=await Navigator.push(context, MaterialPageRoute(builder: (context){
                      return CityLocation();
                    }));
                    print(typeName);
                    if(typeName !=null)
                      {
                        var weather=await weatherModel.getCityNameData(typeName);
                        updateUi(weather);
                      }
                  },
                    child: Icon(
                  Icons.location_city,
                  size: 50,
                )),
              ],
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xffA7CFF1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            '$tempreture°',
                            style: TextStyle(
                              fontFamily: 'LSpartan',
                              fontSize: 70.0,
                              color: Colors.white,
                              decoration: TextDecoration.none
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                          color: Color(0xffA7CFF1),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Center(
                          child: Text(
                            '${weatherModel.getWeatherIcon(condition)}',
                            style:TextStyle(
                              fontFamily: 'LSpartan',
                              fontSize: 70.0,
                              color: Colors.white,
                                decoration: TextDecoration.none
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffA7CFF1),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Center(
                    child: Text(
                      '${weatherModel.getMessage(tempreture)}',
                      style: TextStyle(
                        fontFamily: 'LSpartan',
                        fontSize: 45.0,
                        color: Colors.white,
                          decoration: TextDecoration.none
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(8, 40, 8, 0),
              child: Container(
                // height: 120,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xffA7CFF1),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(8, 40, 8, 0),
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Humidity',
                              style: TextStyle(
                                  fontFamily: 'LightSpartan',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                              child: Text(
                                '$humidity%',
                                style: TextStyle(
                                    fontFamily: 'LSpartan',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    decoration: TextDecoration.none
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Wind',
                              style: TextStyle(
                                  fontFamily: 'LightSpartan',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                              child: Text(
                                '$wind Km/h',
                                style: TextStyle(
                                    fontFamily: 'LSpartan',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    decoration: TextDecoration.none
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Pressure',
                              style: TextStyle(
                                  fontFamily: 'LightSpartan',
                                  fontSize: 20.0,
                                  color: Colors.white,
                                  decoration: TextDecoration.none
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(8, 20, 8, 8),
                              child: Text(
                                '$pressure hPa',
                                style: TextStyle(
                                    fontFamily: 'LSpartan',
                                    fontSize: 20.0,
                                    color: Colors.white,
                                    decoration: TextDecoration.none
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
