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
      appBar: AppBar(
        title: Text('Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min, // center the buttons vertically
          children: [
            ElevatedButton(
              onPressed: fetchHelloWorld,
              child: Text('Fetch Hello World'),
            ),
            SizedBox(height: 20), // Spacing between buttons
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AgePage()),
                );
              },
              child: Text('Go to age page'),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/admin'),
              child: Text('Exit to Admin Dashboard (test only)'),
            ),
            ElevatedButton(
              onPressed: () => GoRouter.of(context).go('/widgets'),
              child: Text('Show Preview Widgets'),
            ),
          ],
        ),
      ),
    );
  }
}
