import 'package:camera/camera.dart';

class CameraService {
  static List<CameraDescription> cameras = [];

  static Future<void> initialize() async {
    cameras = await availableCameras();
  }

  static CameraDescription? get mainCamera {
    if (cameras.isEmpty) {
      return null;
    }

    return cameras.first;
  }
}