import 'package:http/http.dart';
import 'dart:convert';
import 'location.dart';
class Network{
 late String url;
  Network(this.url);
  Future getAIPData() async{
    Response response = await get(Uri.parse(url));
    dynamic gatherData=jsonDecode(response.body);
    if(response.statusCode==200){
      return gatherData;
    }
    else{
      print('Data Not Available');
    }
  }
}