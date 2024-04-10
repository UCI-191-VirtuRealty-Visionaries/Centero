import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'age.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void showPopup(text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text)),
    );
  }

  // This is the asynchronous method that fetches data from your server
  Future<void> fetchHelloWorld() async {
    try {
      HttpsCallable func =
          FirebaseFunctions.instance.httpsCallable('helloWorld');
      final result = await func.call();
      final msg = result.data['message'];
      showPopup(msg);
    } on FirebaseFunctionsException catch (ferr) {
      showPopup('Firebase Functions Error: [${ferr.code}] ${ferr.message}');
    } catch (error) {
      showPopup('Generic Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/apartmentBuilding.jpg',
            fit: BoxFit.cover, // cover whole screen
            width: double.infinity, // image take up whole width
            height: double.infinity, // image take up whole height
          ),
          Center(
            child: Column (
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  'assets/centero_logo.png',
                  width: 150, // logcial pixels
                  height: 150 // logical pixels
                ),
                Text("Centero"),
                Text("Would you like to chat?"),
                Text("Touch screen to start")
              ]
            )
          ),
        ]
      )
    );
  }
}
