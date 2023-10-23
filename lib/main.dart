import 'package:flutter/material.dart';
import 'package:jewelry_3d_ecom_public/core/colors_ui.dart';
import 'package:jewelry_3d_ecom_public/core/strings.dart';
// import 'package:jewelry_3d_ecom_public/ui_samples.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: StringsUI.materialAppTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green).copyWith(
          // background: Color(ColorsUI.bg_grey)),
          // background: Colors.white),
            background: Colors.lightGreen),
      ),
      home: const MyHomePage(title: StringsUI.appBarName),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String model_ref = 'assets/png/26_1silver.png';
  String selectedColor = '';

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title,
          style: TextStyle(
            fontFamily: 'Dosis',
          ),),
      ),
      body: Stack(
        children: [
          Center(
            // Center is a layout widget. It takes a single child and positions it
            // in the middle of the parent.
            child: Column(
              // Column is also a layout widget. It takes a list of children and
              // arranges them vertically. By default, it sizes itself to fit its
              // children horizontally, and tries to be as tall as its parent.
              //
              // Column has various properties to control how it sizes itself and
              // how it positions its children. Here we use mainAxisAlignment to
              // center the children vertically; the main axis here is the vertical
              // axis because Columns are vertical (the cross axis would be
              // horizontal).
              //
              // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
              // action in the IDE, or press "p" in the console), to see the
              // wireframe for each widget.
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                AspectRatio(aspectRatio: 16.0/10.6,

                  child: Visibility(
                    visible: true,
                    child: Image.asset(
                      model_ref,// ?? 'assets/png/26_1silver.png',
                    ),
                  ),),
                Card(
                  margin: EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      MyInnerLabel(StringsUI.label1),
                      Row(
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
                      MyInnerCardSoon(StringsUI.label2),
                      MyInnerCardSoon(StringsUI.label3),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                  //Text(StringsUI.lable1),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 10,
            right: 10,
            child: Align(
              alignment: Alignment.bottomRight,
              child: Text(
                StringsUI.byiAnkit53,
                style: TextStyle(
                  fontFamily: 'Curly',
                  fontSize: 15,
                ),),
            ),
          ),
        ],
      ),
    );
  }

  void setSelectedColor(String color) {
    setState(() {
      selectedColor = color;
      if(color =='Rose Gold'){
        model_ref = 'assets/png/26_1rose.png';
      } else if(color =='Gold'){
        model_ref = 'assets/png/26_1gold.png';
      } else{
        model_ref = 'assets/png/26_1silver.png';
      }
    });
  }
}

class MyInnerLabel extends StatelessWidget {
  final String label;

  MyInnerLabel(this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            label,
            style: TextStyle(
              fontFamily: 'Dosis',
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}

class MyInnerCardSoon extends StatelessWidget {
  final String label;

  MyInnerCardSoon(this.label);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Text(
            label,
            style: TextStyle(
              fontFamily: 'Dosis',
              fontSize: 18,
            ),
          ),
        ),
        Text(
          StringsUI.comingSoon,
          style: TextStyle(
            fontFamily: 'Curly',
            fontSize: 18,
          ),),
      ],
    );
  }
}

class CircleIconSelector extends StatelessWidget {
  final int color_get;

  CircleIconSelector(this.color_get);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Color(color_get),
      radius: 20,
      child: Icon(
        Icons.check,
        color: Colors.white,
      ),
    );
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
            color: Colors.green,
            width: 2.0,
          )
              : null,
        ),
      ),
    );
  }
}
