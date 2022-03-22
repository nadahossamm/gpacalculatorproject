import 'package:flutter/material.dart';
import 'package:gpacalculator/Home.dart';
import 'package:splashscreen/splashscreen.dart';

class Splashscreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 8,
      navigateAfterSeconds: new HomePage(),
      image: new Image.asset('images/index.png'),
      photoSize: 100.0,
      loaderColor: Colors.orangeAccent,
    );
  }
}
