import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/text.dart';
import 'package:flutter/material.dart';

class AddTruckDriver extends StatefulWidget {
  const AddTruckDriver({Key? key});

  @override
  State<AddTruckDriver> createState() => _AddTruckDriverState();
}

class _AddTruckDriverState extends State<AddTruckDriver> {
  final _formKey = GlobalKey<FormState>();

  String? _validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your age';
    }
    final RegExp ageRegExp = RegExp(r'^[0-9]+$');
    if (!ageRegExp.hasMatch(value)) {
      return 'Age must contain only numbers';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Truck Driver",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Full Name",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.person),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your full name';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Age",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.date_range),
                        ),
                        keyboardType: TextInputType.number, // Set keyboard type to number
                        validator: _validateAge,
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "NIC",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.numbers_sharp),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your NIC';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "License Number",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.nine_mp_outlined),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your license number';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Route",
                          contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                          prefixIcon: const Icon(Icons.roundabout_right_rounded),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your route';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
                        child: ElevatedButton(
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              // If all fields are valid, perform desired action here
                            }
                          },
                          style: mainButtton,
                          child: const Text(
                            "Sign up",
                            style: MainbuttonText,
                          ),
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
}
