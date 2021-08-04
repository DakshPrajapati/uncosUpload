import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';

void _showDialog() {
  // flutter defined function
  showDialog(
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          new FlatButton(
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

final Shader linearGradient = LinearGradient(
  colors: <Color>[Color(0xff0178F6), Color(0xff8921aa)],
).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

TextEditingController details = TextEditingController();
TextEditingController title = TextEditingController();
TextEditingController name = TextEditingController();
TextEditingController date = TextEditingController();
TextEditingController brief = TextEditingController();
TextEditingController time = TextEditingController();

Future<void> _showMyDialog() async {
  return showDialog<void>(
    context: null,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text('AlertDialog Title'),
        content: SingleChildScrollView(
          child: ListBody(
            children: const <Widget>[
              Text('This is a demo alert dialog.'),
              Text('Would you like to approve of this message?'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Approve'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

finalupload() {
  var data = {
    "title": title.text,
    "name": name.text,
    "details": details.text,
    "date": date.text,
    "brief": brief.text,
    "time": time.text,
  };

  firestoreinstance.collection("news").document().setData(data);
}

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

final firestoreinstance = Firestore.instance;

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      bottom: true,
      left: true,
      right: true,
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0, right: 15),
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Event Name",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0C2A36),
                borderRadius: BorderRadius.circular(15),
              ),
              //color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                    controller: title,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0178F6)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Orgnaizer",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0C2A36),
                borderRadius: BorderRadius.circular(15),
              ),
              //color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                    controller: name,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0178F6)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 25,
            ),
            Text(
              "Brief Information",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            SizedBox(
              height: 25,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0C2A36),
                borderRadius: BorderRadius.circular(15),
              ),
              //color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                    maxLines: 3,
                    controller: brief,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0178F6)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MainNews extends StatefulWidget {
  @override
  _MainNewsState createState() => _MainNewsState();
}

class _MainNewsState extends State<MainNews> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0C2132),
      body: SafeArea(child: MainNewsBody()),
      floatingActionButton: FloatingActionButton(
        elevation: 1,
        backgroundColor: Color(0xff8921aa),
        child: Text(
          "upload",
          style: TextStyle(
            color: Color(0xff0C2132),
          ),
        ),
        onPressed: () {
          if (title == null ||
              name == null ||
              date == null ||
              brief == null ||
              details == null) {
            showDialog(
              context: context,
              builder: (ctx) => AlertDialog(
                title: Text("Attention"),
                content: Text("Please fill up all the details"),
                actions: <Widget>[
                  FlatButton(
                    onPressed: () {
                      Navigator.of(ctx).pop();
                    },
                    child: Text("okay"),
                  ),
                ],
              ),
            );
          } else {
            finalupload();
          }
        },
      ),
    );
  }
}

class MainNewsBody extends StatefulWidget {
  @override
  _MainNewsBodyState createState() => _MainNewsBodyState();
}

class _MainNewsBodyState extends State<MainNewsBody> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15.0, left: 15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 25,
            ),
            Text(
              "Enter Details",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0C2A36),
                borderRadius: BorderRadius.circular(15),
              ),
              //color: Colors.red,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8),
                child: TextField(
                    maxLines: 15,
                    controller: details,
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Color(0xff0178F6)),
                      ),
                      border: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Enter Date",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0C2A36),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    controller: date,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,-]')),
                    ],
                    decoration: InputDecoration(
                      hintText: "dd-mm-yyyy",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              "Enter Date",
              style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  foreground: Paint()..shader = linearGradient),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                color: Color(0xff0C2A36),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 10),
                child: TextFormField(
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white),
                    controller: time,
                    keyboardType: TextInputType.number,
                    inputFormatters: <TextInputFormatter>[
                      FilteringTextInputFormatter.allow(RegExp(r'[0-9,-]')),
                    ],
                    decoration: InputDecoration(
                      hintText: "hr-min(24 hr format)",
                      enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                      ),
                    )),
              ),
            ),
            SizedBox(
              height: 15,
            )
          ],
        ),
      ),
    );
  }
}
