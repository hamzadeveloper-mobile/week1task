import 'package:flutter/material.dart';
import 'package:week1task/Services/airqualityindexapi.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // = '...'
  String fCurrentCityName;
  String fCurrentCityAqi;
  String fCurrentCityDominentPol;
  String fCurrentCityTime;
  String fCity1Name;
  String fCity1Aqi;
  String fCity2Name;
  String fCity2Aqi;
  String fCity3Name;
  String fCity3Aqi;
  String fCity4Name;
  String fCity4Aqi;

  void getAqi() async {
    AqiApi instance = AqiApi();
    await instance.getCurrentCityData();
    await instance.getDataCity1();
    await instance.getDataCity2();
    await instance.getDataCity3();
    await instance.getDataCity4();
    setState(() {
      fCurrentCityName = instance.currentCityName;
      fCurrentCityAqi = instance.currentCityAqi;
      fCurrentCityTime = instance.currentCityTime;
      fCurrentCityDominentPol = instance.currentCityDominentPol;
      fCity1Name = instance.city1Name;
      fCity1Aqi = instance.city1Aqi;
      fCity2Name = instance.city2Name;
      fCity2Aqi = instance.city2Aqi;
      fCity3Name = instance.city3Name;
      fCity3Aqi = instance.city3Aqi;
      fCity4Name = instance.city4Name;
      fCity4Aqi = instance.city4Aqi;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getAqi();
  }

  Widget displayAqi() {
    if (fCurrentCityTime == null) {
      return Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          centerTitle: true,
          title: Text('Air Quality Index'),
        ),
        body: Center(child: CircularProgressIndicator()),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Air Quality Index'),
        ),
        body: Column(
          children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.only(top: 50.0),
                child: Column(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: Colors.blue,
                    ),
                    Text(
                      fCurrentCityName,
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'AQI',
                      style: TextStyle(fontSize: 17.0),
                    ),
                    Text(
                      fCurrentCityAqi,
                      style: TextStyle(
                          fontSize: 30.0,
                          letterSpacing: 3.0,
                          color: Colors.blue,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      fCurrentCityTime,
                      style: TextStyle(
                        fontSize: 16.0,
                      ),
                    ),
                    SizedBox(
                      height: 10.0,
                    ),
                    Text(
                      'Dominant Pollutants:-  $fCurrentCityDominentPol',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 50.0,
            ),
            Card(
              child: ListTile(
                title: Text(
                  fCity1Aqi,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    fCity1Name,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  fCity2Aqi,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    fCity2Name,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  fCity3Aqi,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    fCity3Name,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: Text(
                  fCity4Aqi,
                  style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue),
                ),
                leading: Padding(
                  padding: const EdgeInsets.only(top: 3.0),
                  child: Text(
                    fCity4Name,
                    style: TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return displayAqi();
  }
}
