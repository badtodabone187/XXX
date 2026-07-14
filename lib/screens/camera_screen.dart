import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../services/camera_service.dart';

class CameraScreen extends StatefulWidget {
  const CameraScreen({super.key});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {

  CameraController? controller;

  @override
  void initState() {
    super.initState();
    startCamera();
  }

  Future<void> startCamera() async {

    await CameraService.initialize();

    final camera = CameraService.mainCamera;

    if (camera == null) {
      return;
    }

    controller = CameraController(
      camera,
      ResolutionPreset.medium,
    );

    await controller!.initialize();

    if (mounted) {
      setState(() {});
    }
  }


  @override
  Widget build(BuildContext context) {

    if (controller == null ||
        !controller!.value.isInitialized) {

      return const Scaffold(
        body: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }


    return Scaffold(
      appBar: AppBar(
        title: const Text('Nodify Camera'),
      ),

      body: CameraPreview(controller!),
    );
  }


  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}