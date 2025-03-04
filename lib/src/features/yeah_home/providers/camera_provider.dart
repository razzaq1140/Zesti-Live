import 'package:camera/camera.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:chewie/chewie.dart';
import 'dart:io';

class CameraProvider extends ChangeNotifier {
  CameraController? _cameraController;
  ChewieController? _chewieController;
  VideoPlayerController? _videoPlayerController;
  dynamic _selectedMedia;
  bool _isFrontCamera = false;
  bool _isFlashOn = false;
  String? _mediaError;

  CameraController? get cameraController => _cameraController;
  bool get isFrontCamera => _isFrontCamera;
  bool get isFlashOn => _isFlashOn;
  dynamic get selectedMedia => _selectedMedia;
  ChewieController? get chewieController => _chewieController;
  String? get mediaError => _mediaError;

  Future<void> initializeCamera() async {
    final cameras = await availableCameras();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    await _cameraController!.initialize();
    notifyListeners();
  }

  Future<void> flipCamera() async {
    _isFrontCamera = !_isFrontCamera;
    if (_cameraController != null) {
      await _cameraController!.dispose();
    }
    final cameras = await availableCameras();
    _cameraController = CameraController(
      _isFrontCamera ? cameras[1] : cameras[0],
      ResolutionPreset.high,
    );
    await _cameraController!.initialize();
    notifyListeners();
  }

  Future<void> toggleFlash() async {
    if (_cameraController == null || !_cameraController!.value.isInitialized) return;
    _isFlashOn = !_isFlashOn;
    await _cameraController!.setFlashMode(
      _isFlashOn ? FlashMode.torch : FlashMode.off,
    );
    notifyListeners();
  }

  Future<void> takePicture() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      final image = await _cameraController!.takePicture();
      _selectedMedia = File(image.path);
      _mediaError = null;
      notifyListeners();
    }
  }

  Future<void> startVideoRecording() async {
    if (_cameraController != null && _cameraController!.value.isInitialized) {
      await _cameraController!.startVideoRecording();
      notifyListeners();
    }
  }

  Future<void> stopVideoRecording() async {
    if (_cameraController != null && _cameraController!.value.isRecordingVideo) {
      final video = await _cameraController!.stopVideoRecording();
      _selectedMedia = File(video.path);
      _setupVideoPlayer();
    }
  }

  Future<void> _setupVideoPlayer() async {
    _videoPlayerController = VideoPlayerController.file(_selectedMedia);
    await _videoPlayerController!.initialize().catchError((error) {
      _mediaError = 'Failed to load video: $error';
      notifyListeners();
    });
    _chewieController = ChewieController(
      videoPlayerController: _videoPlayerController!,
      autoPlay: true,
      looping: false,
      errorBuilder: (context, errorMessage) {
        return Center(child: Text(errorMessage));
      },
    );
    notifyListeners();
  }
  Future<void> pickMedia(BuildContext context) async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.media,
        allowMultiple: false,
      );

      if (result != null && result.files.single.path != null) {
        File file = File(result.files.single.path!);
        if (file.path.endsWith('.mp4')) {
          _videoPlayerController = VideoPlayerController.file(file);
          await _videoPlayerController!.initialize().then((_) {
            _chewieController = ChewieController(
              videoPlayerController: _videoPlayerController!,
              autoPlay: true,
              looping: false,
              errorBuilder: (context, errorMessage) {
                return Text(
                  "Error loading video: $errorMessage",
                  style: TextStyle(color: Colors.white),
                );
              },
            );
            _selectedMedia = _chewieController;
            notifyListeners();
          }).catchError((error) {
            _mediaError = "Error loading video: $error";
            notifyListeners();
          });
        } else {
          // Handle image files
          _selectedMedia = file;
          _mediaError = null;
          notifyListeners();
        }
      }
    } catch (e) {
      _mediaError = "Failed to pick media: $e";
      notifyListeners();
    }
  }
  void clearSelectedMedia() {
    _selectedMedia = null;
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    _videoPlayerController = null;
    _chewieController = null;
    _mediaError = null;
    notifyListeners();
  }

  @override
  void dispose() {
    _cameraController?.dispose();
    _videoPlayerController?.dispose();
    _chewieController?.dispose();
    super.dispose();
  }
}
