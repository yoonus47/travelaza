import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_picker/image_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';

import 'package:flutter_spinkit/flutter_spinkit.dart';

class AddArticlesView extends StatefulWidget {
  const AddArticlesView({Key? key}) : super(key: key);

  @override
  State<AddArticlesView> createState() => _AddArticlesViewState();
}

class _AddArticlesViewState extends State<AddArticlesView> {
  final TextEditingController _titleEditingControlller =
      TextEditingController();
  final TextEditingController _descriptionEditingControlller =
      TextEditingController();

  File? _image;
  bool _loading = false;

  final _picker = ImagePicker();
  // Implementing the image picker
  Future<void> _openImagePicker() async {
    final XFile? pickedImage = await _picker.pickImage(
      maxHeight: 600,
      maxWidth: 900,
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

  void _validate() {
    if (_image == null && _descriptionEditingControlller.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please Add the Image and the Description');
    } else if (_image == null) {
      Fluttertoast.showToast(msg: 'Please Add the Image');
    } else if (_titleEditingControlller.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please Add the Title');
    } else if (_descriptionEditingControlller.text.isEmpty) {
      Fluttertoast.showToast(msg: 'Please Add the Description');
    } else {
      setState(() {
        _loading = true;
      });
      _uploadImage();
    }
  }

  void _uploadImage() {
    String imageFileName = DateTime.now().millisecondsSinceEpoch.toString();

    final Reference storageReference = FirebaseStorage.instance
        .ref()
        .child('Article_Images')
        .child(imageFileName);

    final UploadTask uploadTask = storageReference.putFile(_image!);

    uploadTask.then((TaskSnapshot taskSnapshot) {
      taskSnapshot.ref.getDownloadURL().then((imageUrl) {
        _saveData(imageUrl);
      });
    }).catchError((e) {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  void _saveData(String imageUrl) {
    var dateFormat = DateFormat('MMM d, yyyy');
    var timeFormat = DateFormat('EEEE, hh:mm a');

    String date = dateFormat.format(DateTime.now()).toString();
    String time = timeFormat.format(DateTime.now()).toString();

    FirebaseFirestore.instance.collection('articles').add({
      'imageUrl': imageUrl,
      'title': _titleEditingControlller.text,
      'description': _descriptionEditingControlller.text,
      'date': date,
      'time': time,
    }).whenComplete(() {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(msg: 'Article added successsfully');
      Navigator.of(context).pop();
    }).catchError((e) {
      setState(() {
        _loading = false;
      });
      Fluttertoast.showToast(msg: e.toString());
    });
  }

  Widget loadingScreen() {
    return Center(
      child: SpinKitCubeGrid(
        color: Color(0xFF1A395A),
        size: 50.0,
      ),
    );
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
              controller: _titleEditingControlller,
              keyboardType: TextInputType.text,
              decoration: (InputDecoration(labelText: 'Title')),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _descriptionEditingControlller,
              keyboardType: TextInputType.text,
              decoration: (InputDecoration(labelText: 'Description')),
            ),
            SizedBox(height: 40),
            _loading
                ? loadingScreen()
                : GestureDetector(
                    onTap: _validate,
                    child: Container(
                      color: Colors.pink,
                      width: double.infinity,
                      height: 50,
                      child: Center(
                          child: Text(
                        'Post Article',
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
