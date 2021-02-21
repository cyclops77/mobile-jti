import 'dart:async';

import 'package:flutter/material.dart';
import 'package:test_jti/core/color.dart';
import 'package:test_jti/core/href.dart';
import 'package:test_jti/core/size.dart';
import 'package:test_jti/core/txt.dart';
import 'package:test_jti/view/home.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  void load() {
    Timer(Duration(seconds: 2), () {
      Routes.stfR(context, HomeScreen());
    });
  }

  @override
  void initState() {
    load();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Clr.container,
      body: Container(
        height: displayHeight(context),
        width: displayWidth(context),
        padding: EdgeInsets.symmetric(
            horizontal: displayWidth(context) * 0.1,
            vertical: displayHeight(context) * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: displayHeight(context) * 0.15,
            ),
            FlutterLogo(
              size: displayWidth(context) * 0.4,
            ),
            SizedBox(
              height: 40,
            ),
            PopinText(
              isi: "Soal Test Pemrograman Online Jelajah Tekno Indonesia",
              line: 2,
              weight: FontWeight.w500,
              arah: TextAlign.center,
              color: Clr.black,
            ),
            SizedBox(
              height: displayHeight(context) * 0.285,
            ),
            PopinText(
              isi: "Aplikasi Test",
              weight: FontWeight.w400,
              size: 12,
              color: Clr.black,
              arah: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
