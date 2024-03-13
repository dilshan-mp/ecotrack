import 'package:ecotrack/screen/storePage.dart';
import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/text.dart';
import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {

  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.only(top: 60),
        child: Center(
          child: Column(
            children: [
              Image.asset(
                "asset/images/appicon.png"
              ),
              const SizedBox(height: 50,),
              Padding(
                padding: const EdgeInsets.only(left: 20,right: 20),
                child: Column(
                  children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      decoration:  InputDecoration(
                        labelText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 10,
                          )
                        ),
                        prefixIcon: const Icon(Icons.email)
                      ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      obscureText: _isVisible,
                      decoration:  InputDecoration(
                        labelText: "password",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                          borderSide: const BorderSide(
                            color: Colors.green,
                            width: 10,
                          )
                        ),
                        prefixIcon: const Icon(Icons.person),
                        suffixIcon: IconButton(
                          icon: Icon(_isVisible ? Icons.visibility : Icons.visibility_off ),
                          onPressed: () => setState(() {
                            _isVisible = !_isVisible;
                          }),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 30,),
              ElevatedButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyHomePage()));
                },
                style:mainButtton ,
                child:const Text("Sign In",style: MainbuttonText,),
              )
            ],
          ),
        ),
      ),
    );
  }
}
