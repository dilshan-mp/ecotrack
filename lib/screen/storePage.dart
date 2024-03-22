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
