import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UiSamples extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Bottom Right Text Example'),
        ),
        body: Stack(
          children: [
            // Your main content goes here
            Center(
              child: Text(
                'Your main content goes here',
                style: TextStyle(fontSize: 18),
              ),
            ),

            // Text positioned at bottom right
            Positioned(
              bottom: 10,
              right: 10,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Bottom Right',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
