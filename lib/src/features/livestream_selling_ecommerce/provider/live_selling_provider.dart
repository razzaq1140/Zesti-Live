import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/livestream_selling_ecommerce/modal/ecommerce_products_modal.dart';

class LiveSellingProvider with ChangeNotifier {
  bool _isProductPromoVisible = true;
  int activeIndex = 0;

  final product = Product(
    name: 'RUFFLED SATIN SHIRT',
    description: 'Satin shirt with long sleeves...',
    images: [
      AppNetworkImages.networkTwo,
      AppNetworkImages.networkFour,
      AppNetworkImages.networkThree,
    ],
    price: 23.50,
    originalPrice: 30.0,
  );

  void updateIndex(int index) {
    activeIndex = index;
    notifyListeners();
  }

  List<String> get carouselImages => product.images;
  bool get isProductPromoVisible => _isProductPromoVisible;

  void toggleProductPromoVisibility() {
    _isProductPromoVisible = !_isProductPromoVisible;
    notifyListeners();
  }

  void hideProductPromo() {
    _isProductPromoVisible = false;
    notifyListeners();
  }
}
