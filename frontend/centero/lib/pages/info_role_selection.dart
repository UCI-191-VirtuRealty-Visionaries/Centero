import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:centero/styles/app_theme.dart';

class PageInfoRoleSelection extends StatelessWidget {
  // Work Orders Button
  Widget WorkOrderButton() {
    return OutlinedButton(onPressed: () {}, 
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(600.0, 150.0), // Button width and height
        ),
      ),
      child: Text('Work Orders', style: TextStyle(fontSize: 60)));
  }

  // Amenity Info Button
  Widget AmenityInfoButton () {
    return OutlinedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(600.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Amenity Info', style: TextStyle(fontSize: 60)));
  }

  // Local Events Button
  Widget LocalEventsButton () {
    return OutlinedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(600.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Local Events', style: TextStyle(fontSize: 60)));
  }

  // Your Lease Button
  Widget YourLeaseButton () {
    return OutlinedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(600.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Your Lease', style: TextStyle(fontSize: 60)));
  }

  // Other Button
  Widget OtherButton () {
    return OutlinedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(600.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Other', style: TextStyle(fontSize: 60)));
  }

  // Build column of buttons
  Widget buildButtonColumn() {
    return Column(children: [WorkOrderButton(), AmenityInfoButton(), LocalEventsButton(), YourLeaseButton(), OtherButton()]);
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(children: [
      Text("Hello, Resident!", style: TextStyle(fontSize: 200, color: Colors.white)),
      Text("What would you like to chat about?", style: TextStyle(fontSize: 80, color: Colors.white)),
      buildButtonColumn()
    ]);

    return PageFrame(
      child: content,
    );
  }
}
