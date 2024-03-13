import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/text.dart';
import 'package:flutter/material.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(),
      body:  Container(
        padding: const EdgeInsets.only(bottom: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                height: 50,
                decoration: const BoxDecoration(
                  image: DecorationImage(image: AssetImage("asset/images/appicon.png"),
                )
                ),
              ),
              const SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Full Name",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                       prefixIcon: const Icon(Icons.person)
                    ),
                    ),
                    const SizedBox(height: 10,),
                     TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Phone number",
                       contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)
                        ),
                        prefixIcon: const Icon(Icons.phone)
                    ),
                    ),
                      const SizedBox(height: 10,),
                     TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Adress Line 01",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)
                        ),
                        prefixIcon: const Icon(Icons.location_on)
                    ),
                    ),
                      const SizedBox(height: 10,),
                     TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Adress Line 02",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)
                        ),
                        prefixIcon: const Icon(Icons.location_on)
                    ),
                    ),
                    const SizedBox(height: 10,),
                     TextFormField(
                      decoration:  InputDecoration(
                        labelText: "City",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)
                        ),
                        prefixIcon: const Icon(Icons.location_city)
                    ),
                    ),
                    const SizedBox(height: 10,),
                    Row(
                    children: [
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: TextFormField(
                          decoration:  InputDecoration(
                            labelText: "Sate",
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)
                            ),
                            prefixIcon: const Icon(Icons.location_on)
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.only(left: 10),
                          child: TextFormField(
                          decoration:  InputDecoration(
                            labelText: "zip",
                            contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(14)
                            ),
                            prefixIcon: const Icon(Icons.numbers)
                            ),
                          ),
                        ),
                      ),
                    ],
                    ),
                    const SizedBox(height: 10,),
                     TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Password",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye_sharp)
                    ),
                    ),
                    const SizedBox(height: 10,),
                    TextFormField(
                      decoration:  InputDecoration(
                        labelText: "Re-Enter Password",
                        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(14)
                        ),
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: const Icon(Icons.remove_red_eye)
                      ),
                    ),
                  ],
                ),
              ), 
              SizedBox(height: 8,),
              Padding(
                padding: const EdgeInsets.only(left: 10,right: 10,bottom: 10),
                child: ElevatedButton(
                  onPressed: (){},
                  style: mainButtton,
                  child: const Text("Sign up",style: MainbuttonText,),
                ),
              ) 
            ],
          ),
        ),
      ),
    );
  }
}