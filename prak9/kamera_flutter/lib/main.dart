import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'widget/takepicture_screen.dart';

Future<void> main() async {
  // Pastikan plugin siap sebelum runApp()
  WidgetsFlutterBinding.ensureInitialized();

  // Ambil semua kamera yang tersedia
  final cameras = await availableCameras();

  // Ambil kamera pertama
  final firstCamera = cameras.first;

  runApp(
    MaterialApp(
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: TakePictureScreen(camera: firstCamera),
    ),
  );
}
