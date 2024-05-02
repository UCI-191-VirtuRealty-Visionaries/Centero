import 'package:centero/pages/faceid_notice.dart';
import 'package:centero/widgets/debug_page_placeholder.dart';
import 'package:centero/widgets/page_frame.dart';
import 'package:flutter/material.dart';

class PageInfoRoleSelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget navigateToNextPage() {
      return ElevatedButton(
        child: Text('Go to face ID notice page',
            style: TextStyle(
              fontSize: 120,
            )),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FaceIDNotice()),
          );
        },
      );
    }

    return PageFrame(
      child: Center(
        child: Column(
          children: [
            Padding(
                padding: EdgeInsets.only(
              top: 1000,
            )),
            navigateToNextPage(),
          ],
        ),
      ),
    );
  }
}
