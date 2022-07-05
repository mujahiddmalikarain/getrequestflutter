import 'package:ApplicationName/swapresponse.dart';
import 'package:ApplicationName/swapresponsemodel.dart';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(title: 'ApplicationName', home: Splashscreen1());
  }
}

class Splashscreen1 extends StatefulWidget {
  const Splashscreen1({Key? key}) : super(key: key);

  @override
  State<Splashscreen1> createState() => _Splashscreen1State();
}

class _Splashscreen1State extends State<Splashscreen1> {
  late Future<SwapStatus> swapstaus;

  @override
  void initState() {
    super.initState();
    swapstaus = Swapresposnedata();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SwapStatus>(
      future: swapstaus,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Text(snapshot.data!.status.toString());
        } else if (snapshot.hasError) {
          return Text('${snapshot.error}');
        }

        // By default, show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
