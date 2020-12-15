import 'package:flutter/material.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:clima/services/weather.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocationData();
  }

  void getLocationData() async {
    WeatherModel weatherModel = WeatherModel();
    var weatherData = await weatherModel.getLocationWeather();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen(
        locationWeather: weatherData,
      );
    }));
  }

  // GPS ACIK IKEN longtitue- latitude veriyor
  //
  // GPS kapali veya izin verilmedigi zaman:
  // flutter: User denied permissions to access the device's location..
  // flutter: unable to fetch!
  //
  // lets make http requests
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitWave(
          color: Colors.teal,
          size: 100,
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
