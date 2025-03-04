import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';

class StickerSheet extends StatelessWidget {
  const StickerSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 300,
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Text(
            "Stickers",
            style: textTheme(context)
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 30),
          SizedBox(
            width: 400,
            child: Align(
              alignment: Alignment.center,
              child: Wrap(
                spacing: 30,
                runSpacing: 20,
                children: [
                  SvgPicture.asset(AppIcons.sticker),
                  SvgPicture.asset(AppIcons.fruteSticker),
                  SvgPicture.asset(AppIcons.animalSticker),
                  SvgPicture.asset(AppIcons.flowerSticker),
                  SvgPicture.asset(
                    AppIcons.iceCreamSticker,
                  ),
                  SvgPicture.asset(
                    AppIcons.birdSticker,
                  ),
                  SvgPicture.asset(AppIcons.iceSticker),
                  SvgPicture.asset(AppIcons.fishSticker),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
