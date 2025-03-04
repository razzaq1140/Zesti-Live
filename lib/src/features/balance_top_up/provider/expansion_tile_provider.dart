import 'package:flutter/material.dart';

class ExpansionTileProvider with ChangeNotifier {
  bool _isCreditCardExpanded = false;
  bool _isWalletExpanded = false;
  bool _isPayplusExpanded = false;

  // Set a default payment method
  String _selectedPaymentMethod = "Bank One - 4958";

  bool get isCreditCardExpanded => _isCreditCardExpanded;
  bool get isWalletExpanded => _isWalletExpanded;
  bool get isPayplusExpanded => _isPayplusExpanded;
  String get selectedPaymentMethod => _selectedPaymentMethod;

  void toggleCreditCard(bool value) {
    _isCreditCardExpanded = value;
    notifyListeners();
  }

  void toggleWallet(bool value) {
    _isWalletExpanded = value;
    notifyListeners();
  }

  void togglePayplus(bool value) {
    _isPayplusExpanded = value;
    notifyListeners();
  }

  void selectPaymentMethod(String method) {
    _selectedPaymentMethod = method;
    notifyListeners();
  }
}
