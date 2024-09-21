// ignore_for_file: prefer_const_constructors, unused_field, use_super_parameters

import 'package:flutter/material.dart';

class EditGalleryScreen extends StatefulWidget {
  const EditGalleryScreen({Key? key}) : super(key: key);

  @override
  EditGalleryScreenState createState() => EditGalleryScreenState();
}

class EditGalleryScreenState extends State<EditGalleryScreen> {
  final _formKey = GlobalKey<FormState>();
  String _name = '';
  String _imageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Gallery')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: 'Image Name'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a name';
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: 'Image URL'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter an url';
                  }
                  //regular expression to check if the url is valid
                  if (!RegExp(r'^https?://\S+$').hasMatch(value)) {
                    return 'Please enter a valid url';
                  }
                  return null;
                },
                onSaved: (value) => _imageUrl = value!,
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Image edited in gallery successfully')),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFFFDE82),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text('Edit in Gallery', style: TextStyle(color: Colors.black)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
