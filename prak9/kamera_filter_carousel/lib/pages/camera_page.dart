import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'filter_page.dart';

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;

  Future<void> takePhoto() async {
    final picker = ImagePicker();
    final picked = await picker.pickImage(source: ImageSource.camera);

    if (picked != null) {
      setState(() {
        _image = File(picked.path);
      });

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => FilterPage(imageFile: File(picked.path)),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Praktikum Kamera")),
      body: Center(
        child: ElevatedButton(
          onPressed: takePhoto,
          child: const Text("Ambil Foto"),
        ),
      ),
    );
  }
}
