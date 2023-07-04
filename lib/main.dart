import 'package:flutter/material.dart';
import 'package:second_app/App_brain.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

void main() {
  runApp(MaterialApp(
      home: Scaffold(
    backgroundColor: Colors.grey[300],
    appBar: AppBar(backgroundColor: Colors.grey, title: Text("hello guys")),
    body: mainApp(),
  )));
}

App_brain app_brain = App_brain();

class mainApp extends StatefulWidget {
  const mainApp({super.key});

  @override
  State<mainApp> createState() => _mainAppState();
}

class _mainAppState extends State<mainApp> {
  List<Widget> answerResult = [];

  var i = 0;

  void testing(reponse) {
    if (i < 3) {
      setState(() {
        if (app_brain.getQuestion(i).reponse == reponse) {
          answerResult.add(Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              Icons.thumb_up,
              color: Colors.green,
            ),
          ));
        } else {
          answerResult.add(Padding(
            padding: const EdgeInsets.all(13.0),
            child: Icon(
              Icons.thumb_down,
              color: Colors.red,
            ),
          ));
        }
        if (i < 3) i++;
      });
    } else {
      setState(() {
        i = 0;
      });
      answerResult.clear();
      Alert(context: context, title: "RFLUTTER", desc: "Flutter is awesome.")
          .show();
    }

    ;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: answerResult,
          ),
        ),
        Expanded(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(app_brain.getQuestion(i).image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                app_brain.getQuestion(i).question,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 24.0, color: Colors.black),
              ),
            ),
          ],
        )),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("faux"),
              ),
              onPressed: () {
                testing(false);
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
            ),
          ),
        ),
        Expanded(
          flex: 0,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ElevatedButton(
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Text("vrai"),
              ),
              onPressed: () {
                /* answerResult.add(Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: Icon(
                      Icons.thumb_up,
                      color: Colors.green,
                    ),
                  ));*/
                testing(true);
              },
              style: ElevatedButton.styleFrom(primary: Colors.blueAccent),
            ),
          ),
        )
      ],
    );
  }
}
