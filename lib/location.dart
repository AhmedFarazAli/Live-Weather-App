import 'package:geolocator/geolocator.dart';
class Location{
  late final Latitude;
  late final longitude;
  Future getLatAndlong() async{
    try{
      LocationPermission permission = await Geolocator.requestPermission();
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.low);
      this.longitude=position.longitude;
      this.Latitude=position.latitude;
      print(this.longitude);
      print(this.Latitude);
    }
    catch(exception){
      print(exception);
    }

  }
}