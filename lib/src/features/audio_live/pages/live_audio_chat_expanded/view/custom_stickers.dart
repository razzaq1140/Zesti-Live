import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StickerBottomSheet extends StatefulWidget {
  const StickerBottomSheet({super.key});

  @override
  _StickerBottomSheetState createState() => _StickerBottomSheetState();
}

class _StickerBottomSheetState extends State<StickerBottomSheet> {
  final PageController _pageController = PageController();
  final int stickersPerPage = 8; // 4 stickers per row, 2 rows per page

  // List of all stickers
  final List<String> stickers = [
    AppIcons.sticker,
    AppIcons.fruteSticker,
    AppIcons.animalSticker,
    AppIcons.flowerSticker,
    AppIcons.iceCreamSticker,
    AppIcons.birdSticker,
    AppIcons.iceSticker,
    AppIcons.fishSticker,
    // Add more stickers or repeat as needed
    AppIcons.sticker,
    AppIcons.fruteSticker,
    AppIcons.animalSticker,
    AppIcons.flowerSticker,
    AppIcons.iceCreamSticker,
    AppIcons.birdSticker,
    AppIcons.iceSticker,
    AppIcons.fishSticker,
  ];

  @override
  Widget build(BuildContext context) {
    final int pageCount = (stickers.length / stickersPerPage).ceil();

    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).onSurface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
      ),
      height: 380,
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(
            "Stickers",
            style: textTheme(context).bodyLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme(context).surface),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: pageCount,
              itemBuilder: (context, pageIndex) {
                final start = pageIndex * stickersPerPage;
                final end = (start + stickersPerPage > stickers.length)
                    ? stickers.length
                    : start + stickersPerPage;
                final pageStickers = stickers.sublist(start, end);

                return GridView.builder(
                  padding: EdgeInsets.all(30),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    mainAxisSpacing: 20,
                    crossAxisSpacing: 20,
                    childAspectRatio: 1,
                  ),
                  itemCount: pageStickers.length,
                  itemBuilder: (context, index) {
                    return SvgPicture.asset(
                      pageStickers[index],
                      width: 40,
                      height: 40,
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          SmoothPageIndicator(
            controller: _pageController,
            count: pageCount,
            effect: WormEffect(
              dotHeight: 6,
              dotColor: colorScheme(context).surface.withOpacity(0.5),
              dotWidth: 6,
              activeDotColor: colorScheme(context).surface,
            ),
          ),
          const SizedBox(
            height: 12,
          )
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
