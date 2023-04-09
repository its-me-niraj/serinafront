import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Window.initialize();
  await Window.hideWindowControls();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TransparentBackgroundApp(),
    );
  }
}

class TransparentBackgroundApp extends StatefulWidget {
  @override
  _TransparentBackgroundAppState createState() =>
      _TransparentBackgroundAppState();
}

class _TransparentBackgroundAppState extends State<TransparentBackgroundApp> {
  @override
  void initState() {
    super.initState();
    setAcrylicEffect();
  }

  Future<void> setAcrylicEffect() async {
    await Window.setEffect(effect: WindowEffect.aero);
    Window.enterFullscreen();
    // Window.hideWindowControls();
  }

  minimizeScreen() async {
    await Window.exitFullscreen();
    // Window.
  }

  @override
  Widget build(BuildContext context) {
    // Your app's UI goes here
    return Scaffold(
      backgroundColor: Colors.transparent,
      // Set the container's background color to transparent
      body: Center(
        child: DefaultTextStyle(
          style: TextStyle(color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.max,
            children: [
              IconButton(
                  onPressed: () {
                    Window.enterFullscreen();
                  },
                  icon: Icon(Icons.minimize)),
              Text(
                'Transparent Background',
                style: TextStyle(fontSize: 24),
              ),
              Text(
                'Transparent Background',
                style: TextStyle(fontSize: 24, color: Colors.black),
              ),
              IconButton(
                  onPressed: () {
                    minimizeScreen();
                    // Window.
                  },
                  icon: Icon(Icons.minimize))
            ],
          ),
        ),
      ),
    );
  }
}
