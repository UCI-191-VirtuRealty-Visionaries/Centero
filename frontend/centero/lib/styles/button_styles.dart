import 'package:flutter/material.dart';

// A custom class to hold our reusable button styles
class CustomButtonStyles {
  // A static method to get a specific button style
  static ButtonStyle myButtonStyle() {
    return ElevatedButton.styleFrom(
      backgroundColor: Color.fromARGB(255, 235, 0, 207), // Background color
      foregroundColor: Colors.white, // Text color
      padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      textStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      // Other styling parameters...
    );
  }
}