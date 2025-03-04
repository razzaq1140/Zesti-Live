import 'package:flutter/material.dart';
import 'package:country_picker/country_picker.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../../common/const/app_colors.dart';
import '../../../common/const/global_variables.dart';
import '../../../common/widgets/custom_button.dart';
import '../../../common/widgets/custom_textfield.dart';
import '../../../router/go_route.dart';
import '../provider/phone_number_provider.dart';

class LoginPhoneNumber extends StatefulWidget {
  const LoginPhoneNumber({super.key});

  @override
  State<LoginPhoneNumber> createState() => _LoginPhoneNumberState();
}

class _LoginPhoneNumberState extends State<LoginPhoneNumber> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PhoneNumberProvider>(context);
    return Scaffold(
      appBar: AppBar(
        surfaceTintColor: colorScheme(context).surface,
        backgroundColor: colorScheme(context).surface,
        title: Text(
          'Phone Number',
          style: textTheme(context).titleSmall?.copyWith(
              fontWeight: FontWeight.w700,
              color: colorScheme(context).onSurface),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: provider.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Text(
                'Country',
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context).onSurface.withOpacity(0.5)),
              ),
              const SizedBox(height: 5),
              GestureDetector(
                onTap: () {
                  showCountryPicker(
                    context: context,
                    onSelect: (Country country) {
                      provider.selectCountry(country);
                    },
                  );
                },
                child: InputDecorator(
                  decoration: InputDecoration(
                    hintText: 'Select Country',
                    hintStyle: textTheme(context)
                        .titleSmall
                        ?.copyWith(color: colorScheme(context).onSurface),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        width: 1,
                        color: colorScheme(context).outline.withOpacity(0.5),
                      ),
                    ),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          provider.selectedCountry?.name ?? 'Select Country',
                          style: textTheme(context)
                              .titleSmall
                              ?.copyWith(color: colorScheme(context).onSurface),
                        ),
                      ),
                      if (provider.selectedCountry != null)
                        Padding(
                          padding: const EdgeInsets.only(left: 8),
                          child: Text(
                            provider.selectedCountry!.flagEmoji,
                            style: const TextStyle(fontSize: 24),
                          ),
                        ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Phone Number',
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context).onSurface.withOpacity(0.5)),
              ),
              const SizedBox(height: 5),
              CustomTextFormField(
                validationType: ValidationType.phoneNumber,
                textStyle: textTheme(context).titleSmall,
                keyboardType: TextInputType.number,
                filled: false,
                controller: provider.phoneNumberController,
                customDecoration: InputDecoration(
                  prefixText: provider.selectedCountry != null
                      ? '+${provider.selectedCountry!.phoneCode} '
                      : '+',
                  hintText: 'Phone Number',
                  hintStyle: textTheme(context)
                      .titleSmall
                      ?.copyWith(color: colorScheme(context).onSurface),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      width: 1,
                      color: colorScheme(context).outline.withOpacity(0.5),
                    ),
                  ),
                  suffixIcon: Icon(
                    Icons.check_circle,
                    color: provider.hasValidInput
                        ? AppColor.appGreen
                        : Colors.grey,
                  ),
                  errorText: provider.validationMessage,
                ),
              ),
              const SizedBox(height: 100),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: const EdgeInsets.all(16),
        width: double.infinity,
        height: 80,
        color: Colors.transparent,
        child: CustomButton(
          buttonText: 'Next',
          onPressed: () {
            if (provider.hasValidInput) {
              context.pushNamed(AppRoute.otpPage);
            } else {}
          },
        ),
      ),
    );
  }
}
