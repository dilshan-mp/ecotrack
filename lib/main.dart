import 'package:ecotrack/screen/homePage.dart';
import 'package:ecotrack/screen/signInPage.dart';
import 'package:ecotrack/screen/startPage.dart';
import 'package:flutter/material.dart';
import 'package:device_preview/device_preview.dart';

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
      home:HomePage(),
    );
  }
}
