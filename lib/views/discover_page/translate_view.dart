import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class TranslateView extends StatefulWidget {
  @override
  _TranslateViews createState() => _TranslateViews();
}

class _TranslateViews extends State<TranslateView> {
  String dropdownFrom = "English";
  String dropdownTo = "Malayalam";
  String userinput = "";
  String result = "";
  // This is made by Bishworaj Poudel for FlutterHope.com
  // https://www.flutterhope.com/
  // If you want to add your country in the list, just add the code in the list.
  // Country Code List: https://cloud.google.com/translate/docs/languages
  //
  List<String> availableLang = <String>[
    'English',
    'French',
    'Arabic',
    'Hindi',
    'Nepali',
    'Japnease',
    'Korean',
    'Malayalam'
  ];
  List<String> languageCode = <String>[
    'en',
    'fr',
    'ar',
    'hi',
    'ne',
    'ja',
    'ko',
    'ml',
  ];
//Translate
  resultTranslate() async {
    final translator = GoogleTranslator();
    translator
        .translate(userinput,
            from: languageCode[availableLang.indexOf(dropdownFrom)],
            to: languageCode[availableLang.indexOf(dropdownTo)])
        .then(print);
    var translation = await translator.translate(userinput,
        to: languageCode[availableLang.indexOf(dropdownTo)]);
    setState(() {
      result = translation.text;
    });
    // prints exemplo
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 246, 235, 244),
      appBar: AppBar(
        title: const Text("Translate"),
      ),
      /* appBar: AppBar(
        title: Text('Back'),
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: new Icon(Icons.arrow_back),
        ),
      ),*/
      body: Padding(
        padding: const EdgeInsets.all(40),
        child: ListView(
          children: [
            // First Row
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Text(
                      'From  ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    dropdownColor: Color.fromARGB(255, 246, 235, 244),
                    value: dropdownFrom,
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownFrom = newValue!;
                      });
                    },
                    items: availableLang
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            // Second Row
            Row(
              children: [
                const Expanded(
                    flex: 3,
                    child: Text(
                      'To  ',
                      style: TextStyle(
                        color: Colors.black87,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                      ),
                    )),
                Expanded(
                  flex: 5,
                  child: DropdownButton<String>(
                    dropdownColor: Color.fromARGB(255, 246, 235, 244),
                    value: dropdownTo,
                    icon: const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 40,
                    ),
                    iconSize: 24,
                    elevation: 16,
                    style: const TextStyle(
                      color: Colors.black54,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownTo = newValue!;
                      });
                    },
                    items: availableLang
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // TextFeild
            TextField(
              style: TextStyle(
                fontSize: 25,
              ),
              keyboardType: TextInputType.text,
              maxLines: 5,
              onChanged: (val) {
                setState(() {
                  userinput = val;
                });
              },
              decoration: const InputDecoration(
                  hintStyle: TextStyle(
                    fontSize: 25,
                  ),
                  hintText: "Enter something..",
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.all(Radius.circular(15)))),
            ),
            const SizedBox(
              height: 40,
            ),
            MaterialButton(
                height: 50,
                color: Color(0xFF1A395A),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                    side: const BorderSide(color: Color(0xFF1A395A))),
                child: const Text('Translate',
                    style: TextStyle(color: Colors.white, fontSize: 20)),
                onPressed: () {
                  resultTranslate();
                }),

            // Result
            const SizedBox(
              height: 20,
            ),
            Center(
                child: Text('$result',
                    style: const TextStyle(color: Colors.black, fontSize: 30))),

            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
