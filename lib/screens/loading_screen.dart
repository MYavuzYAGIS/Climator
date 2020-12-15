import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';
import 'package:clima/services/networking.dart';
import 'package:clima/screens/location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

const APIKEY = '6cfd305a659bfc9e8730c1f3d12505aa';

double latitude;
double longitude;

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
    Location location = Location();
    await location.getCurrentLocation();
    latitude = location.latitude;
    longitude = location.longitude;
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$APIKEY');
    var weatherData = await networkHelper.getData();
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return LocationScreen();
    }));
  }

  // GPS ACIK IKEN longtitue- latitude veriyor
  //
  // GPS kapali veya izin verilmedigi zaman:
  // flutter: User denied permissions to access the device's location.
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
