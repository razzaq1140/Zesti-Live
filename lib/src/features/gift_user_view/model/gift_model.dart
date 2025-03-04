import 'package:flutter_application_zestilive/src/common/const/app_images.dart';

class GiftModel {
  final String image;
  final String name;
  final String coin;
  GiftModel({
    required this.image,
    required this.name,
    required this.coin,
  });
}

List<GiftModel> giftList = [
  GiftModel(image: AppImages.giftBag, name: 'Dark fantasy', coin: '720'),
  GiftModel(
      image: AppImages.giftAlimeicStone, name: 'Almeic Stone', coin: '200'),
  GiftModel(image: AppImages.giftShaphire, name: 'shaphire', coin: '10'),
  GiftModel(image: AppImages.giftBlade, name: 'Blade', coin: '500'),
  GiftModel(image: AppImages.giftCoin, name: 'Coin', coin: '100'),
  GiftModel(image: AppImages.giftScroll, name: 'Scroll', coin: '999'),
  GiftModel(image: AppImages.giftRing, name: 'Ring', coin: '120'),
  GiftModel(image: AppImages.giftBeer, name: 'Beer', coin: '690'),
];
