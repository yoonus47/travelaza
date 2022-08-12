import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class AddArticlesView extends StatefulWidget {
  const AddArticlesView({Key? key}) : super(key: key);

  @override
  State<AddArticlesView> createState() => _AddArticlesViewState();
}

class _AddArticlesViewState extends State<AddArticlesView> {
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
            Container(
                width: double.infinity,
                height: 25,
                color: Colors.grey,
                child: Center(
                  child: RaisedButton(
                      onPressed: () {},
                      color: Colors.pink,
                      child: Text(
                        'Upload Image',
                        style: TextStyle(fontSize: 16, color: Colors.white),
                      )),
                ))
          ],
        ),
      ),
    );
  }
}
