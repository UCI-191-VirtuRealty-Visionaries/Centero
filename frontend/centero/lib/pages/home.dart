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
      body: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AgePage()),
          );
        },
        child:
        Stack(
          children: [
            Image.asset(
              'assets/apt_building_bg.jpg', // background image of apartment buildings
              fit: BoxFit.cover, // cover whole screen
              width: double.infinity, // image take up whole width
              height: double.infinity, // image take up whole height
            ),
            Center(
              child: Column (
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 1000), // add padding above the Opacity widget
                    child: Container(
                      width: double.infinity, // card take up whole width
                      height: 2000,
                      color: Colors.white.withOpacity(0.6),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/centero_logo.png',
                            width: 500, // logical pixels
                            height: 500 // logical pixels
                          ),
                          Text("CENTERO",
                            style: TextStyle(fontSize: 300)),
                          Text("WOULD YOU LIKE TO CHAT?",
                            style: TextStyle(fontSize: 160)),
                          SizedBox(height: 90),
                          Text("Touch screen to start", 
                            style: TextStyle(fontSize: 85))
                        ]
                      )
                    ),
                  ),
                ]
              )
            ),
          ]
        )
      )
    );
  }
}
