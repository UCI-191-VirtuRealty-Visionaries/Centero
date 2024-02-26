import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'age.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // This is the asynchronous method that fetches data from your server
  Future<void> fetchHelloWorld() async {
    final uri = Uri.parse('http://127.0.0.1:5001/centerobackend-14820/us-central1/helloWorld');
    try {
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        // If server returns an OK response, show the response body in a Snackbar
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Response: ${response.body}')),
        );
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load data from the server');
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error: $e')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
          ],
        ),
      ),
    );
  }
}