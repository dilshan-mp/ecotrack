import 'package:ecotrack/screen/disposalRequest.dart';
import 'package:ecotrack/screen/firstPage.dart';
import 'package:ecotrack/screen/homePage.dart';
import 'package:ecotrack/screen/signInPage.dart';
import 'package:ecotrack/screen/startPage.dart';
import 'package:ecotrack/screen/storePages.dart';
import 'package:ecotrack/Components/bottomNavBar.dart';
import 'package:ecotrack/Components/likeButton.dart';

import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';
import 'package:like_button/like_button.dart';

void main() => runApp(
  DevicePreview(
    //enabled: !kReleaseMode,
    builder: (context) => MainApp(), // Wrap your app
  ),
);
class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  const MaterialApp(
      debugShowCheckedModeBanner: false,
      home:FirstPage()
    );
  }
}

