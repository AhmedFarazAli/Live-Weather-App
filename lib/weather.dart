import 'location.dart';
import 'network.dart';
class WeatherModel{
  Future getCityNameData(String cityName) async{

    Network networkHelper=Network('https://api.openweathermap.org/data/2.5/weather?id=$cityName&appid=bee4d2f7b986a8043a6cbb348c0ac6ee&units=metric');
    var weatherData=await networkHelper.getAIPData();
    return weatherData;
  }
  Future getData() async{
    Location location=Location();
    await location.getLatAndlong();
    Network networkHelper=Network('https://api.openweathermap.org/data/2.5/weather?lat=${location.Latitude}&lon=${location.longitude}&appid=bee4d2f7b986a8043a6cbb348c0ac6ee&units=metric');
    var weatherData=await networkHelper.getAIPData();
    return weatherData;
    
  }
  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}