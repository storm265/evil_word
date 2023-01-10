import 'dart:convert';
import 'package:evil_word/home_page/home_screen_decoration.dart';
import 'package:evil_word/model/joke_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity_plus/connectivity_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // getting joke
  Future<Joke> getData() async {
    var responce = await http.get(Uri.parse(
        'https://evilinsult.com/generate_insult.php?lang=en&type=json'));
    if (responce.statusCode != 200) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Error of getting data.')));
    }
    if (responce.statusCode == 200) {
      Map<String, dynamic> jsonInfo = json.decode(responce.body);
      return Joke.toMap(jsonInfo);
    } else {
      throw Exception('statusCode !=200');
    }
  }

  var subscription;
  @override
  void initState() {
    super.initState();
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      if (result == ConnectivityResult.mobile) {
        print('mobile status');
        getData();
      } else if (result == ConnectivityResult.wifi) {
        print('wifi status');
        getData();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: const Text('Required internet connection!')));
      }
      print(result);
    });
  }

  @override
  void dispose() {
    super.dispose();
    subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HomeScreenDecoration.backgroundColor,
      appBar:
          HomeScreenDecoration.appBar(Theme.of(context).colorScheme.secondary),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Center(
              child: FutureBuilder<Joke>(
                future: getData(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return CircularProgressIndicator();
                  }

                  if (snapshot.hasData) {
                    final student = snapshot.data;

                    return Material(
                      elevation: 1,
                      color: Colors.transparent,
                      shadowColor: Theme.of(context).colorScheme.secondary,
                      child: Container(
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                                width: 3,
                                color:
                                    Theme.of(context).colorScheme.secondary),),
                        child: Text(
                          "${student!.insult}.",
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,),
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
                      const SizedBox(
                        width: 8,
                      ),
                      Text(
                        'Loading \😈',
                        style: TextStyle(
                            color: Theme.of(context).textTheme.headline6!.color,
                            fontSize: 25,),
                      ),
                    ],
                  );
                },
              ),
            ),
          ),
          // button
          Padding(
            padding: const EdgeInsets.only(top: 20),
            child: ElevatedButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      Theme.of(context).colorScheme.secondary)),
              onPressed: () {
                setState(() {
                  getData();
                });
              },
              child: const Text(
                'Generate joke',
                style: TextStyle(fontSize: 18),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
