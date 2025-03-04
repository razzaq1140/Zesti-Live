import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/get_started/provider/lang_selection_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import '../../create_profile/models/language_model.dart';

class LanguageSelectionPage extends StatelessWidget {
  final List<CountryModel> countries = [
    CountryModel(countryName: 'English', imageAsset: AppImages.english),
    CountryModel(countryName: 'Español', imageAsset: AppImages.espanol),
    CountryModel(countryName: 'Français', imageAsset: AppImages.france),
    CountryModel(countryName: 'Japanese', imageAsset: AppImages.japanese),
    CountryModel(countryName: 'Hindi', imageAsset: AppImages.hindi),
    CountryModel(countryName: 'Bangla', imageAsset: AppImages.bangladesh),
    CountryModel(countryName: 'Indonesia', imageAsset: AppImages.indonesia),
    CountryModel(countryName: 'Russian', imageAsset: AppImages.russian),
    CountryModel(countryName: 'Chinese', imageAsset: AppImages.viet),
    CountryModel(countryName: 'Portugese', imageAsset: AppImages.japanese),
    CountryModel(countryName: 'Bahasa', imageAsset: AppImages.france),
    CountryModel(countryName: 'Tiếng Việt', imageAsset: AppImages.indonesia),
  ];

  LanguageSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: AppColor.lightTeal,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              width: width,
              height: height * 0.5,
              AppImages.object,
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.6,
            minChildSize: 0.6,
            maxChildSize: 0.95,
            expand: true,
            builder: (context, scrollController) {
              return Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      children: [
                        _buildDragHandle(context),
                        _buildTitle(context),
                        Expanded(
                          child: ListView.builder(
                            controller: scrollController,
                            itemCount: countries.length,
                            itemBuilder: (context, index) {
                              return Consumer<LanguageSelectionProvider>(
                                builder: (context, provider, _) {
                                  final country = countries[index];
                                  return ListTile(
                                    leading: Image.asset(
                                      country.imageAsset,
                                      height: 22,
                                      width: 16,
                                    ),
                                    title: Text(
                                      country.countryName,
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleSmall,
                                    ),
                                    trailing: provider.selectedCountry ==
                                            country.countryName
                                        ? Icon(
                                            Icons.check_circle,
                                            color: AppColor.appGreen,
                                          )
                                        : null,
                                    onTap: () {
                                      provider
                                          .selectCountry(country.countryName);
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Consumer<LanguageSelectionProvider>(
                    builder: (context, provider, _) {
                      return Visibility(
                        visible: provider.isSubmitVisible,
                        child: Positioned(
                          bottom: 20,
                          right: 20,
                          child: CustomButton(
                            width: 100,
                            height: 34,
                            buttonText: 'Submit',
                            textStyle: textTheme(context).bodyMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: colorScheme(context).onPrimary),
                            onPressed: () {
                              context.pushNamed(AppRoute.onboardingPage);
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDragHandle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Container(
        height: 7,
        width: 100,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.onSurface.withOpacity(0.7),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "Select Language",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
              fontWeight: FontWeight.w500,
            ),
      ),
    );
  }
}
