import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class FaceFiltersBottomSheet extends StatefulWidget {
  const FaceFiltersBottomSheet({super.key});

  @override
  FaceFiltersBottomSheetState createState() => FaceFiltersBottomSheetState();
}

class FaceFiltersBottomSheetState extends State<FaceFiltersBottomSheet> {
  final List<String> stickers = [
    AppImages.disable,
    AppImages.li,
    AppImages.li1,
    AppImages.li2,
    AppImages.li3,
    AppImages.li4,
    AppImages.li4,
    AppImages.li5,
    AppImages.li6,
    AppImages.li7,
    AppImages.li8,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: colorScheme(context).onSurface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        ),
        height: 380,
        child: Column(children: [
          const SizedBox(height: 20),
          const SizedBox(height: 20),
          Expanded(
            child: GridView.builder(
              padding: const EdgeInsets.all(30),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: stickers.length,
              itemBuilder: (context, index) {
                return Image(
                  image: AssetImage(
                    stickers[index],
                  ),
                  height: 40,
                  width: 40,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
        ]));
  }
}
