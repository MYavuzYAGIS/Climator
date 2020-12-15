import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:clima/services/location.dart';

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

  @override
  Widget build(BuildContext context) {
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
