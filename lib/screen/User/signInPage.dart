import 'package:ecotrack/Components/MyBottomNavigationBar.dart';
import 'package:ecotrack/screen/User/homePage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _isVisible = false;
  String? _email;
  String? _password;

  Future<Map<String, dynamic>?> authenticateUser(
      String username, String password) async {
    const apiUrl = 'http://192.168.43.20:8080/authenticate';

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {
          'Content-Type': 'application/json',
          'VERSION': 'V1',
        },
        body: json.encode({
          'username': username,
          'password': password,
        }),
      );

      if (response.statusCode == 200) {
        final responseData = json.decode(response.body);
        final token = responseData['token'] as String?;
        final userDetails = responseData['user'] as Map<String, dynamic>?;

        return {'token': token, 'userDetails': userDetails};
      } else {
        // Handle authentication error
        print('Authentication failed with status: ${response.statusCode}');
        print('weda meka');
        return null;
      }
    } catch (error) {
      // Handle network or other errors
      print('Error: $error');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("asset/images/appicon.png"),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Column(
                    children: [
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          labelText: "Email",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 10,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.email),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _email = value;
                        },
                      ),
                      const SizedBox(height: 10),
                      TextFormField(
                        obscureText: !_isVisible,
                        decoration: InputDecoration(
                          labelText: "Password",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(14),
                            borderSide: const BorderSide(
                              color: Colors.green,
                              width: 10,
                            ),
                          ),
                          prefixIcon: const Icon(Icons.person),
                          suffixIcon: IconButton(
                            icon: Icon(
                              _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your password';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          _password = value;
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _signIn,
                  child: const Text(
                    "Sign In",
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _signIn() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      final authResult = await authenticateUser(_email!, _password!);
      if (authResult != null) {
        final token = authResult['token'];
        final userDetails = authResult['userDetails'];

        // Authentication successful, proceed to the home page with user details
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyBottomNavigationBar(token: token, userDetails: userDetails)),
        );
        //MyBottomNavigationBar(token: token, userDetails: userDetails)),
      } else {
        // Authentication failed, show error message or handle accordingly
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Authentication failed'),
          ),
        );
      }
    }
  }
}
