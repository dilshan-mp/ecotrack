import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecotrack/style/button.dart';
import 'package:ecotrack/style/colors.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellItems extends StatefulWidget {
  const SellItems({super.key});

  @override
  State<SellItems> createState() => _SellItemsState();
}

class _SellItemsState extends State<SellItems> {
  late TextEditingController _descriptionController;
  late TextEditingController _priceController; // Add this line for price
  late DateTime _selectedDate;
  late File? _imageFile;

  @override
  void initState() {
    super.initState();
    _descriptionController = TextEditingController();
    _priceController = TextEditingController(); // Initialize the price controller
    _selectedDate = DateTime.now();
    _imageFile = null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sell Items'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _imageFile != null
                ? Image.file(_imageFile!)
                : const Icon(Icons.image), // Placeholder for image display
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _pickImage();
              },
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _priceController, // Connect the controller
              keyboardType: TextInputType.numberWithOptions(decimal: true), // Set keyboard type to number with decimal
              decoration: const InputDecoration(
                hintText: '0.00',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Date',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () => _selectDate(context),
              child: InputDecorator(
                decoration: const InputDecoration(
                  hintText: 'Select date',
                  border: OutlineInputBorder(),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${_selectedDate.toLocal()}'.split(' ')[0],
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                  onPressed: () {
                    Map<String, dynamic> addpost = {
                      'Image': "",
                      'Description': _descriptionController.text, // Use entered description
                      'Price': double.parse(_priceController.text), // Convert entered price to double
                      'Date': _selectedDate,
                    };
                    CollectionReference collectionReference =
                        FirebaseFirestore.instance.collection('Admin_Post');
                    collectionReference.add(addpost);
                  },
                  style: mainButtton,
                  child: const Text('Submit')),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void dispose() {
    _descriptionController.dispose();
    _priceController.dispose(); // Dispose price controller
    super.dispose();
  }
}
