import 'package:flutter/material.dart';

class StorePage extends StatefulWidget {
  @override
  _StorePageState createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  String _selectedButton = ''; // Track the selected button
  List<String>category = ['Clay','Glass','Iron','wood'];
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text("Store",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 8,right: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: CustomButton(
                      text: 'Clay',
                      isSelected: _selectedButton == 'Clay',
                      onTap: () {
                        setState(() {
                          _selectedButton = 'Clay';
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: CustomButton(
                      text: 'Glass',
                      isSelected: _selectedButton == 'Glass',
                      onTap: () {
                        setState(() {
                          _selectedButton = 'Glass';
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: CustomButton(
                      text: 'Iron',
                      isSelected: _selectedButton == 'Iron',
                      onTap: () {
                        setState(() {
                          _selectedButton = 'Iron';
                        });
                      },
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 4,right: 4),
                    child: CustomButton(
                      text: 'Wood',
                      isSelected: _selectedButton == 'Wood',
                      onTap: () {
                        setState(() {
                          _selectedButton = 'Wood';
                        });
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30),
                      child: Container(
                        width: 150,
                        height: 300,
                        decoration: const BoxDecoration(
                          boxShadow: [
                      BoxShadow(
                           color: Color.fromARGB(255, 237, 231, 231),
                           spreadRadius: 1,
                           blurRadius: 5
                        )
                          ]
                        ),
                        child: Column(
                          children: [
                            Image.asset('asset/images/1a8a6ac05e82a7d9b5ddcd225c5e7384.jpg'),
                            const SizedBox(height: 4,),
                            const Text("Glass Light",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 25),),
                            const Text("Rs.800.00",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            ElevatedButton(
                              onPressed: (){},
                              child: const Text("Details"),
                              style: ElevatedButton.styleFrom(
                                
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final String text;
  final bool isSelected;
  final VoidCallback onTap;

  const CustomButton({super.key, 
    required this.text,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isSelected ? Colors.green : Colors.grey.shade300,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
