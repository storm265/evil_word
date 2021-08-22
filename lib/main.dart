import 'dart:convert';

import 'package:evil_word/info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([]);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Evil word',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
        primarySwatch: Colors.red,
      ),
      home: Scaffold(
        appBar: AppBar(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10))),
          centerTitle: true,
          title: Text(
            '🤬 Evil word',
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontSize: 25,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.black26,
        body: HomePage(),
      ),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<Joke> getData() async {
    var responce = await http.get(Uri.parse(
        'https://evilinsult.com/generate_insult.php?lang=en&type=json'));
    if (responce.statusCode != 200) {
      Fluttertoast.showToast(
          msg: "Error of getting data!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
    if (responce.statusCode == 200) {
      Map<String, dynamic> jsonInfo = json.decode(responce.body);

      return Joke.fromJson(jsonInfo);
    } else {
      throw Exception('statusCode !=200');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Center(
            child: FutureBuilder<Joke>(
              future: getData(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  final student = snapshot.data;

                  return Material(
                    elevation: 1,
                    color: Colors.transparent,
                    shadowColor: Colors.redAccent,
                    child: Container(
                      padding: EdgeInsets.all(7),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                              width: 3, color: Theme.of(context).accentColor)),
                      child: Text(
                        "${student!.insult}.",
                        softWrap: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w400,
                            color: Colors.white),
                      ),
                    ),
                  );
                } else if (snapshot.hasError) {
                  return Text(snapshot.error.toString());
                }

                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      'Loading \😈',
                      style: TextStyle(color: Colors.red, fontSize: 25),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            setState(() {
              getData();
            });
          },
          child: Text(
            'Generate',
            style: TextStyle(fontSize: 18),
          ),
          style: ButtonStyle(),
        ),
      ],
    );
  }
}
