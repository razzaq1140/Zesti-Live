import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberProvider extends ChangeNotifier {
  final TextEditingController phoneNumberController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Country? selectedCountry;
  bool hasValidInput = false;
  String? validationMessage;

  PhoneNumberProvider() {
    phoneNumberController.addListener(() {
      validatePhoneNumber(phoneNumberController.text);
    });
  }

  void selectCountry(Country country) {
    selectedCountry = country;
    notifyListeners();
  }

  Future<void> validatePhoneNumber(String phoneNumber) async {
    if (selectedCountry == null) {
      hasValidInput = false;
      validationMessage = 'Please select a country first.';
      notifyListeners();
      return;
    }

    final isoCode = selectedCountry!.countryCode;

    try {
      final parsedNumber = await PhoneNumber.getRegionInfoFromPhoneNumber(
        phoneNumber,
        isoCode,
      );

      hasValidInput = parsedNumber.phoneNumber != null &&
          parsedNumber.phoneNumber!.isNotEmpty;
      validationMessage = hasValidInput ? null : 'Invalid phone number format.';
    } catch (e) {
      hasValidInput = _basicPhoneNumberValidation(phoneNumber);
      validationMessage = hasValidInput ? null : 'Invalid phone number format.';
    }

    notifyListeners();
  }

  // Fallback validation function for basic length and numeric checks
  bool _basicPhoneNumberValidation(String phoneNumber) {
    final phoneRegex = RegExp(r'^[0-9]+$');
    return phoneNumber.length >= 10 && phoneRegex.hasMatch(phoneNumber);
  }

  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }
}
