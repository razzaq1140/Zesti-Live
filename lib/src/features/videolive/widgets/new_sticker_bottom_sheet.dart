import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

class NewStickerBottomSheet extends StatefulWidget {
  const NewStickerBottomSheet({super.key});

  @override
  NewStickerBottomSheetState createState() => NewStickerBottomSheetState();
}

class NewStickerBottomSheetState extends State<NewStickerBottomSheet> {
  final List<String> newstickers = [
    AppImages.st1,
    AppImages.st2,
    AppImages.st3,
    AppImages.st4,
    AppImages.st4,
    AppImages.st5,
  ];
  final List<String> newsticker = [
    AppImages.st9,
    AppImages.st10,
    AppImages.st11,
    AppImages.st12,
    AppImages.st13,
    AppImages.st14,
    AppImages.st15,
    AppImages.st16,
    AppImages.st17,
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.9,
      decoration: BoxDecoration(
        color: colorScheme(context).onSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: SingleChildScrollView(
        // Make content scrollable if needed
        child: Column(
          mainAxisSize:
              MainAxisSize.min, // Allows content to take up more height
          children: [
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: colorScheme(context).onPrimary,
                  ),
                ),
                Text("Graphic Stickers",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(color: colorScheme(context).onPrimary)),
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: colorScheme(context).onPrimary,
                  ),
                )
              ],
            ),
            const SizedBox(height: 20),
            GridView.builder(
              padding: const EdgeInsets.all(30),
              shrinkWrap: true, // Allows GridView to take only necessary space
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: newstickers.length,
              itemBuilder: (context, index) {
                return Image(
                  image: AssetImage(
                    newstickers[index],
                  ),
                  height: 40,
                  width: 40,
                );
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: colorScheme(context).onPrimary,
                  ),
                ),
                Text("Word Stickers",
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(color: colorScheme(context).onPrimary)),
                SizedBox(
                  width: 100,
                  child: Divider(
                    color: colorScheme(context).onPrimary,
                  ),
                )
              ],
            ),
            GridView.builder(
              padding: const EdgeInsets.all(30),
              shrinkWrap: true, // Allows GridView to take only necessary space
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 20,
                crossAxisSpacing: 20,
                childAspectRatio: 1,
              ),
              itemCount: newsticker.length,
              itemBuilder: (context, index) {
                return Image(
                  image: AssetImage(
                    newsticker[index],
                  ),
                  height: 40,
                  width: 40,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
