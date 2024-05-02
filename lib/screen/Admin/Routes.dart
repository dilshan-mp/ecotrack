import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Routes extends StatefulWidget {
  final String? token;
  final Map<String, dynamic>? userDetails;

  const Routes({Key? key, required this.token, required this.userDetails})
      : super(key: key);

  @override
  State<Routes> createState() => _RoutesState();
}

class _RoutesState extends State<Routes> {
  List<RouteResponseDTO> routesData = [];

  @override
  void initState() {
    super.initState();
    // Fetch routes data when the widget is initialized
    fetchRoutesData();
  }

  Future<void> fetchRoutesData() async {
    final apiUrl = 'http://192.168.43.180:8080/route';

    try {
      final response = await http.get(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${widget.token}',
          'VERSION': 'V1',
        },
      );

      if (response.statusCode == 200) {
        // Parse response data
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          // Update routesData list with parsed data
          routesData = responseData
              .map((route) => RouteResponseDTO.fromJson(route))
              .toList();
        });
      } else {
        // Handle error scenario
        print('Failed to fetch routes data with status: ${response.statusCode}');
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Routes")),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Table(
            border: TableBorder.all(color: const Color.fromARGB(77, 7, 7, 7)),
            defaultVerticalAlignment: TableCellVerticalAlignment.middle,
            children: [
              const TableRow(
                decoration: BoxDecoration(
                  color: Colors.greenAccent,
                ),
                children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Name"),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Latitude"),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Longitude"),
                    ),
                  )
                ],
              ),
              ...routesData.map((route) {
                return TableRow(children: [
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(route.name),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(route.latitude.toString()),
                    ),
                  ),
                  TableCell(
                    verticalAlignment: TableCellVerticalAlignment.middle,
                    child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(route.longitude.toString()),
                    ),
                  ),
                ]);
              }),
            ],
          ),
        ),
      ),
    );
  }
}

class RouteResponseDTO {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  RouteResponseDTO({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory RouteResponseDTO.fromJson(Map<String, dynamic> json) {
    return RouteResponseDTO(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      latitude: json['latitude'] ?? 0.0,
      longitude: json['longitude'] ?? 0.0,
    );
  }
}
