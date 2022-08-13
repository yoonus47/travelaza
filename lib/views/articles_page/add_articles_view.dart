import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';

class AddArticlesView extends StatefulWidget {
  const AddArticlesView({Key? key}) : super(key: key);

  @override
  State<AddArticlesView> createState() => _AddArticlesViewState();
}

class _AddArticlesViewState extends State<AddArticlesView> {
  final TextEditingController _descriptionEditingControlller =
      TextEditingController();

  File? _image;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Write an Article'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Column(
          children: [
            _image == null
                ? Container(
                    width: double.infinity,
                    height: 250,
                    color: Colors.grey,
                    child: Center(
                      child: RaisedButton(
                          onPressed: () {
                            _openImagePicker();
                          },
                          color: Colors.pink,
                          child: Text(
                            'Choose Image',
                            style: TextStyle(fontSize: 16, color: Colors.white),
                          )),
                    ))
                : GestureDetector(
                    onTap: () {
                      _openImagePicker();
                    },
                    child: Container(
                      width: double.infinity,
                      height: 250,
                      child: _image != null
                          ? Image.file(_image!, fit: BoxFit.cover)
                          : const Text('Please select an image'),
                    ),
                  ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionEditingControlller,
              keyboardType: TextInputType.text,
              decoration: (InputDecoration(labelText: 'Description')),
            ),
            SizedBox(height: 40),
            GestureDetector(
              onTap: () {},
              child: Container(
                color: Colors.pink,
                width: double.infinity,
                height: 50,
                child: Center(
                    child: Text(
                  'Add New Post',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
