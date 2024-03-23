import 'package:ecotrack/screen/Admin/adminHomePage.dart';
import 'package:ecotrack/screen/TruckDriver/TruckDriverHomePage.dart';
import 'package:ecotrack/screen/User/disposalRequest.dart';
import 'package:ecotrack/screen/User/firstPage.dart';
import 'package:ecotrack/screen/User/homePage.dart';
import 'package:ecotrack/screen/User/locationPage.dart';
import 'package:ecotrack/screen/User/signInPage.dart';
import 'package:ecotrack/screen/User/startPage.dart';
import 'package:ecotrack/screen/User/storePages.dart';
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
      home:StartPage()
    );
  }
}

