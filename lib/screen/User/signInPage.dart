import 'package:flutter/material.dart';
import 'package:ecotrack/screen/User/homePage.dart';
import 'package:ecotrack/screen/User/storePage.dart';
import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/text.dart';
import 'package:ecotrack/Components/bottomNavBar.dart';

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
                              _isVisible ? Icons.visibility : Icons.visibility_off,
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
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      // Process login with _email and _password
                      // For now, navigate to homePage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const bottomNavigationBar()),
                      );
                    }
                  },
                  style: mainButtton,
                  child: const Text(
                    "Sign In",
                    style: MainbuttonText,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
