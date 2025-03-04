import 'package:flutter/material.dart';
import 'package:ffmpeg_kit_flutter/ffmpeg_kit.dart';
import 'package:path_provider/path_provider.dart';

class SoundVideoProvider with ChangeNotifier {
  String? selectedVideoUrl;
  String? extractedAudioPath;

  // Select video (to extract sound from)
  void selectVideo(String videoUrl) {
    selectedVideoUrl = videoUrl;
    notifyListeners();
  }

  // Method to extract audio from the video
  Future<String?> extractAudioFromVideo() async {
    if (selectedVideoUrl == null) return null;

    // Get the temporary directory to store the output file
    final directory = await getTemporaryDirectory();
    final outputPath = '${directory.path}/extracted_audio.mp3'; // Store audio as MP3

    // FFmpeg command to extract audio
    String command = "-i $selectedVideoUrl -q:a 0 -map a $outputPath"; // Extract audio

    await FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();
      final sessionLog = await session.getOutput(); // Retrieve FFmpeg log
      final failStackTrace = await session.getFailStackTrace();

      if (returnCode!.isValueSuccess()) {
        print("Audio extraction successful.");
        extractedAudioPath = outputPath;
        notifyListeners();
        return outputPath;
      } else {
        // Log detailed error information
        print("Audio extraction failed.");
        print("Return Code: $returnCode");
        print("FFmpeg Log: $sessionLog");
        if (failStackTrace != null) {
          print("Error StackTrace: $failStackTrace");
        }
        return null;
      }
    });

    return null;
  }

  // Method to replace audio in a video (you can use this if needed)
  Future<String?> replaceSoundInVideo(String newVideoUrl) async {
    if (extractedAudioPath == null || newVideoUrl.isEmpty) return null;

    final directory = await getTemporaryDirectory();
    final outputVideoPath = '${directory.path}/output_with_audio.mp4'; // Output video file

    String command =
        "-i $newVideoUrl -i $extractedAudioPath -map 0:v -map 1:a -c:v copy -shortest $outputVideoPath"; // Combine video with extracted audio

    await FFmpegKit.execute(command).then((session) async {
      final returnCode = await session.getReturnCode();
      final sessionLog = await session.getOutput(); // Retrieve FFmpeg log
      final failStackTrace = await session.getFailStackTrace();

      if (returnCode!.isValueSuccess()) {
        print("Audio replacement successful.");
        return outputVideoPath;
      } else {
        // Log detailed error information
        print("Audio replacement failed.");
        print("Return Code: $returnCode");
        print("FFmpeg Log: $sessionLog");
        if (failStackTrace != null) {
          print("Error StackTrace: $failStackTrace");
        }
        return null;
      }
    });

    return null;
  }
}
