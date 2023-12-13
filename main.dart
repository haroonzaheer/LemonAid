import 'package:camera/camera.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:projects/dashboard.dart';
import 'package:projects/logoscreen.dart';
//import 'package:projects/model.dart';
//import "package:projects/dashboard.dart"

List<CameraDescription>? cameras;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  //WidgetsFlutterBinding.ensureInitialized()
  List<CameraDescription> cameras = await availableCameras();
  cameras = await availableCameras();

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  //cameras = await availableCameras();

  //List<CameraDescription> cameras = await availableCameras();

  runApp(const MyApp());
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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: const logoscreen(),
    );
  }
}
