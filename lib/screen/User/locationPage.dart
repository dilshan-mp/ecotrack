import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class LocationPage extends StatefulWidget {
  const LocationPage({super.key});

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  static const LatLng _pGoogleplex = LatLng(37.4223,-122.0848);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location'),
      ),
      body: const GoogleMap(
        initialCameraPosition: CameraPosition(
          target:_pGoogleplex,
          zoom: 13
        )
      ),
    );
  }
}