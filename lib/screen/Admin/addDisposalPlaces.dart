import 'dart:convert';
import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/text.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class AddDisposalPlaces extends StatefulWidget {
  const AddDisposalPlaces({Key? key}) : super(key: key);

  @override
  State<AddDisposalPlaces> createState() => _AddDisposalPlacesState();
}

class _AddDisposalPlacesState extends State<AddDisposalPlaces> {
  final _formKey = GlobalKey<FormState>(); // Add form key

  // Backend API endpoint
  final String apiUrl = 'http://192.168.8.138:8080/routes/{route_id}/disposalPlaces'; // Replace with your actual endpoint

  // TextEditingController for form fields
  final TextEditingController nameController = TextEditingController();
  final TextEditingController routeIdController = TextEditingController();
  final TextEditingController latitudeController = TextEditingController();
  final TextEditingController longitudeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Disposal Places"),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      TextFormField(
                        controller: nameController,
                        decoration: InputDecoration(
                          labelText: "Name",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.place),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: routeIdController,
                        decoration: InputDecoration(
                          labelText: "Route ID",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.route),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a route ID';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: latitudeController,
                        decoration: InputDecoration(
                          labelText: "Latitude",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter latitude';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 30),
                      TextFormField(
                        controller: longitudeController,
                        decoration: InputDecoration(
                          labelText: "Longitude",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.location_on),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter longitude';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 40),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              _submitForm();
                            }
                          },
                          style: mainButtton,
                          child: const Text("Add", style: MainbuttonText),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() async {
    // Create payload from form data
    Map<String, dynamic> payload = {
      'name': nameController.text,
      'routeId': int.parse(routeIdController.text),
      'latitude': double.parse(latitudeController.text),
      'longitude': double.parse(longitudeController.text),
    };

    try {
      // Send data to backend API
      final response = await http.post(
        Uri.parse(apiUrl),
        body: jsonEncode(payload),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      );

      // Check response status
      if (response.statusCode == 200) {
        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Disposal place added successfully!'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        // Show error message
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Failed to add disposal place. Please try again.'),
            backgroundColor: Colors.red,
          ),
        );
      }
    } catch (error) {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('An error occurred. Please try again later.'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  void dispose() {
    // Dispose controllers
    nameController.dispose();
    routeIdController.dispose();
    latitudeController.dispose();
    longitudeController.dispose();
    super.dispose();
  }
}
