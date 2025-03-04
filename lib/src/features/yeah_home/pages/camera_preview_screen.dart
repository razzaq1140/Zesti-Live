import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/camera_provider.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/time_selection_peovider.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'dart:io';
import 'package:chewie/chewie.dart';

class CameraPreviewScreen extends StatefulWidget {
  const CameraPreviewScreen({super.key});

  @override
  State<CameraPreviewScreen> createState() => _CameraPreviewScreenState();
}

class _CameraPreviewScreenState extends State<CameraPreviewScreen> {
  @override
  void initState() {
    super.initState();
    Provider.of<CameraProvider>(context, listen: false).initializeCamera();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final times = ['60s', '45s', '30s', '20s', '10s'];
    final selectedIndex = context.watch<TimeSelectionProvider>().selectedIndex;
    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme(context).onSurface,
        body: Column(
          children: [
            Stack(
              children: [
                Consumer<CameraProvider>(
                    builder: (context, cameraProvider, child) {
                  if (cameraProvider.mediaError != null) {
                    return Container(
                      height: height * 0.85,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: colorScheme(context).primary,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Center(
                        child: Text(
                          cameraProvider.mediaError!,
                          style: const TextStyle(color: Colors.white, fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }

                  if (cameraProvider.selectedMedia != null) {
                    if (cameraProvider.chewieController != null) {
                      // For video files, use Chewie player
                      return Container(
                        height: height * 0.85,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Chewie(
                          controller: cameraProvider.chewieController!,
                        ),
                      );
                    } else if (cameraProvider.selectedMedia is File) {
                      // For image files
                      return Container(
                        height: height * 0.85,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.pink,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.file(
                            cameraProvider.selectedMedia,
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }
                  }

                  // Show camera preview if no media selected
                  if (cameraProvider.cameraController == null ||
                      !cameraProvider.cameraController!.value.isInitialized) {
                    return Container(
                      height: height * 0.85,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Center(child: CircularProgressIndicator()),
                    );
                  }

                  // Camera preview with horizontal flip
                  return Container(
                    height: height * 0.85,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: Colors.pink,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Transform(
                        alignment: Alignment.center,
                        transform: cameraProvider.isFrontCamera
                            ? Matrix4.rotationY(3.1416)
                            : Matrix4.identity(),
                        child: CameraPreview(cameraProvider.cameraController!),
                      ),
                    ),
                  );
                }),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.pop();
                        },
                        child: SvgPicture.asset(AppIcons.clearIcon),
                      ),
                      Wrap(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: SvgPicture.asset(AppIcons.soundsIcon),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            "Sounds",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Provider.of<CameraProvider>(context,
                                      listen: false)
                                  .flipCamera();
                            },
                            child: SvgPicture.asset(AppIcons.flipIcon),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Flip",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.speedIcon),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Speed",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.beautyIcon),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Beauty",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.filtersIcon),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Filters",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 10),
                          GestureDetector(
                            onTap: () {},
                            child: SvgPicture.asset(AppIcons.timerIcon),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            "Timer",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                          const SizedBox(height: 10),
                          // Flash toggle button
                          GestureDetector(
                            onTap: () {
                              Provider.of<CameraProvider>(context,
                                      listen: false)
                                  .toggleFlash();
                            },
                            child: SvgPicture.asset(AppIcons.flashIcon),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            Provider.of<CameraProvider>(context).isFlashOn
                                ? "Flash On"
                                : "Flash Off",
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: colorScheme(context).surface,
                                  fontWeight: FontWeight.w700,
                                ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<CameraProvider>(context,
                                        listen: false)
                                    .pickMedia(context);
                              },
                              child: SvgPicture.asset(AppIcons.uploadFIcon),
                            ),
                            Text(
                              "Upload",
                              style: textTheme(context).labelMedium?.copyWith(
                                    color: colorScheme(context).surface,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () async {
                            // Capture picture on tap
                            await Provider.of<CameraProvider>(context,
                                    listen: false)
                                .takePicture();
                          },
                          onLongPressStart: (_) async {
                            // Start recording video on long press
                            await Provider.of<CameraProvider>(context,
                                    listen: false)
                                .startVideoRecording();
                          },
                          onLongPressEnd: (_) async {
                            // Stop recording video when long press ends
                            await Provider.of<CameraProvider>(context,
                                    listen: false)
                                .stopVideoRecording();
                          },
                          child: Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: colorScheme(context)
                                    .onPrimary
                                    .withOpacity(0.3),
                                width: 6,
                              ),
                              shape: BoxShape.circle,
                              color: colorScheme(context).primary,
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Provider.of<CameraProvider>(context,
                                        listen: false)
                                    .pickMedia(context);
                              },
                              child: SvgPicture.asset(AppIcons.uploadIcon),
                            ),
                            Text(
                              "Upload",
                              style: textTheme(context).labelMedium?.copyWith(
                                    color: colorScheme(context).surface,
                                    fontWeight: FontWeight.w700,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Container(
                color: colorScheme(context).onSurface,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(times.length, (index) {
                    final isSelected = selectedIndex == index;

                    return GestureDetector(
                      onTap: () {
                        context
                            .read<TimeSelectionProvider>()
                            .selectIndex(index);
                      },
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            times[index],
                            style: textTheme(context).labelMedium?.copyWith(
                                  color: isSelected
                                      ? colorScheme(context).surface
                                      : colorScheme(context).outlineVariant,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: isSelected ? 18 : 14,
                                ),
                          ),
                          if (isSelected)
                            Icon(
                              Icons.circle,
                              size: 10,
                              color: colorScheme(context).surface,
                            ),
                        ],
                      ),
                    );
                  }),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
