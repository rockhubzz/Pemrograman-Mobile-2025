import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'displaypicture_screen.dart';

class TakePictureScreen extends StatefulWidget {
  const TakePictureScreen({super.key, required this.camera});

  final CameraDescription camera;

  @override
  TakePictureScreenState createState() => TakePictureScreenState();
}

class TakePictureScreenState extends State<TakePictureScreen> {
  late CameraController _controller;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    super.initState();

    // buat controller kamera
    _controller = CameraController(widget.camera, ResolutionPreset.medium);

    // inisialisasi kamera
    _initializeControllerFuture = _controller.initialize();
  }

  @override
  void dispose() {
    // bebaskan kamera ketika widget dihancurkan
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Take a picture - 2341720197')),
      body: FutureBuilder<void>(
        future: _initializeControllerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return CameraPreview(_controller);
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            // pastikan kamera selesai diinisialisasi
            await _initializeControllerFuture;

            // ambil gambar
            final image = await _controller.takePicture();

            if (!context.mounted) return;

            // tampilkan halaman hasil foto
            await Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) =>
                    DisplayPictureScreen(imagePath: image.path),
              ),
            );
          } catch (e) {
            print("Error saat mengambil gambar: $e");
          }
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }
}
