import 'package:http/http.dart';
import 'dart:convert';
import 'package:geolocator/geolocator.dart';

class AqiApi {
  String currentCityName;
  String currentCityAqi;
  String currentCityDominentPol;
  String currentCityTime;
  String city1Name;
  String city1Aqi;
  String city2Name;
  String city2Aqi;
  String city3Name;
  String city3Aqi;
  String city4Name;
  String city4Aqi;
  String latitude;
  String longitude;
  Future<void> getCurrentCityData() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.low);
    latitude = position.latitude.toString();
    longitude = position.longitude.toString();

    Response response = await get(Uri.parse(
        'https://api.waqi.info/feed/geo:$latitude;$longitude/?token=ad318e1528d4cab3cd6d4940707bda3dfdb67594'));
    Map aqiData = jsonDecode(response.body);
    print(aqiData);
    String cAqi = aqiData['data']['aqi'].toString();
    String cName = aqiData['data']['city']['name'];
    String cDominentPol = aqiData['data']['dominentpol'];
    String cTime = aqiData['data']['time']['s'];
    currentCityAqi = cAqi;
    currentCityName = cName;
    currentCityDominentPol = cDominentPol;
    currentCityTime = cTime;
  }

  Future<void> getDataCity1() async {
    Response response = await get(Uri.parse(
        'https://api.waqi.info/feed/karachi/?token=ad318e1528d4cab3cd6d4940707bda3dfdb67594'));
    Map aqiData = jsonDecode(response.body);
    String cAqi = aqiData['data']['aqi'].toString();
    String cName = aqiData['data']['city']['name'];
    city1Aqi = cAqi;
    city1Name = cName;
  }

  Future<void> getDataCity2() async {
    Response response = await get(Uri.parse(
        'https://api.waqi.info/feed/peshawar/?token=ad318e1528d4cab3cd6d4940707bda3dfdb67594'));
    Map aqiData = jsonDecode(response.body);
    String cAqi = aqiData['data']['aqi'].toString();
    String cName = aqiData['data']['city']['name'];
    city2Aqi = cAqi;
    city2Name = cName;
  }

  Future<void> getDataCity3() async {
    Response response = await get(Uri.parse(
        'https://api.waqi.info/feed/islamabad/?token=ad318e1528d4cab3cd6d4940707bda3dfdb67594'));
    Map aqiData = jsonDecode(response.body);
    String cAqi = aqiData['data']['aqi'].toString();
    String cName = aqiData['data']['city']['name'];
    city3Aqi = cAqi;
    city3Name = cName;
  }

  Future<void> getDataCity4() async {
    Response response = await get(Uri.parse(
        'https://api.waqi.info/feed/lahore/?token=ad318e1528d4cab3cd6d4940707bda3dfdb67594'));
    Map aqiData = jsonDecode(response.body);
    String cAqi = aqiData['data']['aqi'].toString();
    String cName = aqiData['data']['city']['name'];
    city4Aqi = cAqi;
    city4Name = cName;
  }
}
