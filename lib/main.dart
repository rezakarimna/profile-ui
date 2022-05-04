import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
          brightness: Brightness.dark,
          scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
          appBarTheme: AppBarTheme(backgroundColor: Colors.black),
          fontFamily: 'primary',
          textTheme: const TextTheme(
            bodyText1: TextStyle(fontSize: 13),
              bodyText2: TextStyle(fontSize: 15),
              headline6: TextStyle(fontWeight: FontWeight.bold)
          )
          ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text("Curriculum vitae"), actions: const [
          Icon(CupertinoIcons.chat_bubble),
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 16, 0),
            child: Icon(CupertinoIcons.ellipsis_vertical),
          )
        ]),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.asset(
                        "assets/images/profile.jpg",
                        width: 80,
                        height: 80,
                      )),
                  const SizedBox(
                    width: 16,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Brice seraphin'),
                      SizedBox(
                        height: 2,
                      ),
                      Text('Product & print'),
                      SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: [
                          Icon(CupertinoIcons.location),
                          Text('Paris , France'),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(32, 0, 32, 16),
              child: Text(
                  'Short monologues are great for acting tests You, like most actors and actresses, have probably searched words like "monologue for acting test'),
            )
          ],
        ));
  }
}
