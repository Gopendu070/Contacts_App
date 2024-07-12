import 'dart:async';

import 'package:contacts_app/view/MyHomePage.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 1), () {
      animate();
    });
  }

  void navigateToHome() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ));
  }

  double Height = 50;
  double Width = 50;

  ///////////////////////////////////////////////////////
  void animate() {
    if (Height == 50 && Width == 50) {
      setState(() {
        Height = 80;
        Width = 80;
      });
    }
    //navigateToHome();
    Timer(Duration(seconds: 3), () {
      navigateToHome();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [Colors.white, Color.fromARGB(217, 143, 174, 191)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter)),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                  duration: Duration(seconds: 2),
                  height: Height,
                  width: Width,
                  child: Image.asset(
                    'lib/asset/images/appicon.png',
                    fit: BoxFit.fitWidth,
                  )),
              SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }
}
