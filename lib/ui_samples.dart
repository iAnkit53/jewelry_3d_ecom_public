import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:jewelry_3d_ecom_public/core/colors_ui.dart';

class UiSamples extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    throw UnimplementedError();
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Color Selection'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ColorSphere(
                color: Color(ColorsUI.gold),
                isSelected: selectedColor == 'Gold',
                onSelected: () {
                  setSelectedColor('Gold');
                },
              ),
              ColorSphere(
                color: Color(ColorsUI.silver),
                isSelected: selectedColor == 'Silver',
                onSelected: () {
                  setSelectedColor('Silver');
                },
              ),
              ColorSphere(
                color: Colors.pinkAccent,
                isSelected: selectedColor == 'Rose Gold',
                onSelected: () {
                  setSelectedColor('Rose Gold');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void setSelectedColor(String color) {
    setState(() {
      selectedColor = color;
    });
  }
}

class ColorSphere extends StatelessWidget {
  final Color color;
  final bool isSelected;
  final VoidCallback onSelected;

  ColorSphere({
    required this.color,
    required this.isSelected,
    required this.onSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelected,
      child: Container(
        width: 50,
        height: 50,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
          border: isSelected
              ? Border.all(
            color: Colors.black,
            width: 2.0,
          )
              : null,
        ),
      ),
    );
  }
}


