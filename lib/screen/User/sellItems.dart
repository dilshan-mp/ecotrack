import 'dart:convert';
import 'dart:io';
import 'package:ecotrack/ipconfig.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SellItems extends StatefulWidget {
   final String? token;
  final Map<String, dynamic>? userDetails;
  const SellItems({Key? key, required this.token, required this.userDetails}) : super(key: key);

  @override
  State<SellItems> createState() => _SellItemsState();
}

class _SellItemsState extends State<SellItems> {
  late TextEditingController _nameController;
  late TextEditingController _quantityController;
  late TextEditingController _priceController;
  late TextEditingController _descriptionController;
  late File? _imageFile;

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
    _quantityController = TextEditingController();
    _priceController = TextEditingController();
    _descriptionController = TextEditingController();
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
            _imageFile != null ? Image.file(_imageFile!) : const Icon(Icons.image),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                _pickImage();
              },
              child: const Text('Pick Image'),
            ),
            const SizedBox(height: 20),
            const Text(
              'Name',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _nameController,
              decoration: const InputDecoration(
                hintText: 'Enter name',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Quantity',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _quantityController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                hintText: 'Enter quantity',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Price',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _priceController,
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              decoration: const InputDecoration(
                hintText: '0.00',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Description',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextFormField(
              controller: _descriptionController,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Enter description',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: ElevatedButton(
                onPressed: _imageFile != null ? _submitData : null,
                child: const Text('Submit'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  Future<void> _submitData() async {
    if (_nameController.text.isEmpty ||
        _quantityController.text.isEmpty ||
        _priceController.text.isEmpty ||
        _descriptionController.text.isEmpty) {
      return;
    }

    var request = http.MultipartRequest(
      'POST',
      Uri.parse('$localhost/users/store_items'),
    );

    var imageFile = await http.MultipartFile.fromPath(
      'imagePath',
      _imageFile!.path,
    );
    request.files.add(imageFile);

    request.fields['name'] = _nameController.text;
    request.fields['quantity'] = _quantityController.text;
    request.fields['price'] = _priceController.text;
    request.fields['description'] = _descriptionController.text;

    request.headers['Authorization'] = 'Bearer ${widget.token}';
    request.headers['VERSION'] = 'V1';

    try {
      var response = await request.send();
      if (response.statusCode == 200) {
        setState(() {
          _imageFile = null;
          _priceController.clear();
          _nameController.clear();
          _quantityController.clear();
          _descriptionController.clear();
        });
        _showSuccessDialog();
      } else {
        print('Error uploading data: ${response.reasonPhrase}');
        final responseBody = await response.stream.bytesToString();
        print('Response body: $responseBody');
      }
    } catch (e) {
      print('Error submitting data: $e');
    }
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Success'),
          content: const Text('Post submitted successfully.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _quantityController.dispose();
    _priceController.dispose();
    _descriptionController.dispose();
    super.dispose();
  }
}
