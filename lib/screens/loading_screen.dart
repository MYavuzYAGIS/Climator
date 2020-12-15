import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    Location location = Location();
    await location.getCurrentLocation();
    print(location.latitude);
    print(location.longitude);
  }

  // GPS ACIK IKEN longtitue- latitude veriyor
  //
  // GPS kapali veya izin verilmedigi zaman:
  // flutter: User denied permissions to access the device's location.
  // flutter: unable to fetch!
  //

  // lets make http requests

  void getData() async {
    http.Response response = await http.get(
        'https://api.openweathermap.org/data/2.5/weather?lat=36.9&lon=35&appid=6cfd305a659bfc9e8730c1f3d12505aa');
    if (response.statusCode == 200) {
      String data = response.body;
      print(response.statusCode);
      var longitude = jsonDecode(data)['coord']['lon'];
      var latitude = jsonDecode(data)['coord']['lat'];
      print(longitude);
      print(latitude);
      var decoded = jsonDecode(data);
      var weatherDescription = decoded['weather'][0]['description'];
      print(weatherDescription);
      var temp = decoded['main']['temp'];
      print(temp);
      var condition = decoded['weather'][0]['id'];
      print(condition);
      var city = decoded['name'];
      print(city);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      body: Center(
        child: RaisedButton(
          onPressed: () {
            getLocation();
          },
          child: Text('Get Location'),
        ),
      ),
    );
  }
}

/* Widged lifecycles:
  stateless widgets are like lego blocks you cannot play around them unless you destroy and build new ones
  So, only when they are built, they are interactive, it is their lifecycle.

  Stateful Widgets can be combined and traced by using statae objects like setState

  there is initState() when it is initialized
  there is build() method when it is called and printed on the screen and
  there is deactivate() method that terminates the widget



 */
