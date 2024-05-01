import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TruckDriver {
  final String name;
  final String licenceNumber;
  final String phone;
  final String nic;
  final int age;
  final String password;
  final String email;
  final String role;

  TruckDriver({
    required this.name,
    required this.licenceNumber,
    required this.phone,
    required this.nic,
    required this.age,
    required this.password,
    required this.email,
    required this.role,
  });

Future<String?> authenticateUser(String username, String password) async {
  const apiUrl = 'http://localhost:8080/authenticate';

  try {
    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {
        'Content-Type': 'application/json',
        'VERSION': 'V1', // Add any custom headers if required
      },
      body: json.encode({
        'username': username,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      final responseData = json.decode(response.body);
      final token = responseData['token'] as String?;
      return token;
    } else {
      // Handle authentication error
      print('Authentication failed with status: ${response.statusCode}');
      return null;
    }
  } catch (error) {
    // Handle network or other errors
    print('Error: $error');
    return null;
  }
}

// // Example usage:
// void loginUser() async {
//   final username = 'example@example.com'; // Replace with user's username
//   final password = 'password123'; // Replace with user's password

//   final token = await authenticateUser(username, password);
//   if (token != null) {
//     // Authentication successful, store the token and proceed with app logic
//     print('JWT token: $token');
//     // Store the token locally (e.g., using shared_preferences)
//   } else {
//     // Authentication failed, handle accordingly
//     print('Authentication failed');
//   }
// }


  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'licenceNumber': licenceNumber,
      'phone': phone,
      'nic': nic,
      'age': age,
      'password': password,
      'email': email,
      'role': role,
    };
  }
}
class AddTruckDriverScreen extends StatefulWidget {
  @override
  _AddTruckDriverScreenState createState() => _AddTruckDriverScreenState();
}

class _AddTruckDriverScreenState extends State<AddTruckDriverScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _nameController;
  late TextEditingController _licenceNumberController;
  late TextEditingController _phoneController;
  late TextEditingController _nicController;
  late TextEditingController _ageController;
  late TextEditingController _passwordController;
  late TextEditingController _emailController;
  late TextEditingController _roleController;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _licenceNumberController = TextEditingController();
    _phoneController = TextEditingController();
    _nicController = TextEditingController();
    _ageController = TextEditingController();
    _passwordController = TextEditingController();
    _emailController = TextEditingController();
    _roleController = TextEditingController();
  }

  @override
  void dispose() {
    _nameController.dispose();
    _licenceNumberController.dispose();
    _phoneController.dispose();
    _nicController.dispose();
    _ageController.dispose();
    _passwordController.dispose();
    _emailController.dispose();
    _roleController.dispose();
    super.dispose();
  }

  Future<void> addTruckDriver(TruckDriver truckDriver) async {
    const String apiUrl = 'http://localhost:8080/truckdriver'; // Change this to your actual backend URL
    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    try {
      final http.Response response = await http.post(
        Uri.parse(apiUrl),
        headers: headers,
        body: json.encode(truckDriver.toJson()),
      );

      if (response.statusCode == 201) {
        // Truck driver added successfully
        print('Truck driver added successfully');
      } else {
        // Error adding truck driver
        print('Error adding truck driver: ${response.body}');
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Truck Driver'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your name';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _licenceNumberController,
                decoration: InputDecoration(labelText: 'Licence Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your licence number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _nicController,
                decoration: InputDecoration(labelText: 'NIC'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your NIC';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _ageController,
                decoration: InputDecoration(labelText: 'Age'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your age';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _passwordController,
                decoration: InputDecoration(labelText: 'Password'),
                obscureText: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your password';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your email';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _roleController,
                decoration: InputDecoration(labelText: 'Role'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your role';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final truckDriver = TruckDriver(
                      name: _nameController.text,
                      licenceNumber: _licenceNumberController.text,
                      phone: _phoneController.text,
                      nic: _nicController.text,
                      age: int.parse(_ageController.text),
                      password: _passwordController.text,
                      email: _emailController.text,
                      role: _roleController.text,
                    );
                    addTruckDriver(truckDriver);
                  }
                },
                child: Text('Add Truck Driver'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
