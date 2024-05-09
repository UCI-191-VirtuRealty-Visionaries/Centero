import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';
import 'package:centero/styles/app_theme.dart';

class PageInfoRoleSelection extends StatelessWidget {
  // Work Orders Button
  Widget WorkOrderButton() {
    return ElevatedButton(onPressed: () {}, 
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(650.0, 150.0), // Button width and height
        ),
      ),
      child: Text('Work Orders', style: TextStyle(fontSize: 90)));
  }

  // Amenity Info Button
  Widget AmenityInfoButton () {
    return ElevatedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(650.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Amenity Info', style: TextStyle(fontSize: 90)));
  }

  // Local Events Button
  Widget LocalEventsButton () {
    return ElevatedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(650.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Local Events', style: TextStyle(fontSize: 90)));
  }

  // Your Lease Button
  Widget YourLeaseButton () {
    return ElevatedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(650.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Your Lease', style: TextStyle(fontSize: 90)));
  }

  // Other Button
  Widget OtherButton () {
    return ElevatedButton(onPressed: () {}, 
    style: ButtonStyle(
        fixedSize: MaterialStateProperty.all<Size>(
          Size(650.0, 150.0), // Button width and height
        ),
      ),
    child: Text('Other', style: TextStyle(fontSize: 90)));
  }

  // Exit Button
  Widget ExitButton () {
    return Container(
      width: 1800,
      child: Row(
        children: [ElevatedButton(onPressed: () {}, 
          style: ButtonStyle(
              fixedSize: MaterialStateProperty.all<Size>(
                Size(260.0, 100.0), // Button width and height
              ),
            ),
          child: Text('Exit', style: TextStyle(fontSize: 45))),
        Expanded(child: Container())]
      )
    );
  }

  // Build column of buttons
  Widget buildButtonColumn() {
    return Column(children: [WorkOrderButton(), SizedBox(height: 60), AmenityInfoButton(), SizedBox(height: 60), LocalEventsButton(), SizedBox(height: 60), YourLeaseButton(), SizedBox(height: 60), OtherButton(), SizedBox(height: 60), ExitButton()]);
  }

  @override
  Widget build(BuildContext context) {
    final content = Column(children: [
      SizedBox(height: 350),
      Text("Hello, Resident!", style: TextStyle(fontSize: 200, color: Colors.white)),
      Text("What would you like to chat about?", style: TextStyle(fontSize: 80, color: Colors.white)),
      SizedBox(height: 150),
      buildButtonColumn()
    ]);

    return PageFrame(
      child: content,
    );
  }
}
