import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/create_profile/provider/create_user_page_provider.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

class CreateUserPage extends StatelessWidget {
  const CreateUserPage({super.key});

  Future<void> _pickImage(CreateUserProvider provider) async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      provider.setImage(File(pickedFile.path));
    }
  }

  @override
  Widget build(BuildContext context) {
    final createUserProvider = Provider.of<CreateUserProvider>(context);

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 50),
          child: Form(
            key: createUserProvider.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create User',
                  style: textTheme(context)
                      .headlineMedium
                      ?.copyWith(fontSize: 24, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 5),
                Text(
                  'Improve the profile to win more attention',
                  style: textTheme(context).titleSmall?.copyWith(
                      fontWeight: FontWeight.w400,
                      color: colorScheme(context).onSurface.withOpacity(0.5)),
                ),
                const SizedBox(height: 15),
                GestureDetector(
                  onTap: () => _pickImage(createUserProvider),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.grey.shade300,
                    backgroundImage: createUserProvider.image != null
                        ? FileImage(createUserProvider.image!)
                        : const AssetImage('assets/images/placeholder.png')
                            as ImageProvider,
                    child: createUserProvider.image == null
                        ? Icon(
                            Icons.person,
                            color:
                                colorScheme(context).onSurface.withOpacity(0.7),
                            size: 40,
                          )
                        : null,
                  ),
                ),
                const SizedBox(height: 15),

                // Name Field (Optional, Not Required for Validation)
                _buildLabel(context, 'Name'),
                CustomTextFormField(
                  // validationType: ValidationType.name,
                  textStyle: textTheme(context).titleSmall,
                  filled: false,
                  customDecoration: InputDecoration(
                    hintText: 'Name',
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
                 // onChanged: (value) => createUserProvider.setName(value),
                ),
                const SizedBox(height: 10),

                // Country Picker (Required)
                // _buildLabel(context, 'Home Country'),
                // GestureDetector(
                //   onTap: () => showCountryPicker(
                //     context: context,
                //     showPhoneCode: false,
                //     onSelect: (Country country) {
                //       createUserProvider.selectCountry(country);
                //     },
                //   ),
                //   child: InputDecorator(
                //     decoration: InputDecoration(
                //       hintText: 'Select Country',
                //       errorText: createUserProvider.showErrors &&
                //               !createUserProvider.validateCountry()
                //           ? 'Country is required'
                //           : null,
                //       hintStyle: textTheme(context)
                //           .titleSmall
                //           ?.copyWith(color: colorScheme(context).onSurface),
                //       enabledBorder: UnderlineInputBorder(
                //         borderSide: BorderSide(
                //           width: 1,
                //           color: colorScheme(context).outline.withOpacity(0.5),
                //         ),
                //       ),
                //     ),
                //     child: Text(
                //       createUserProvider.selectedCountry?.name ??
                //           'Select Country',
                //       style: textTheme(context)
                //           .titleSmall
                //           ?.copyWith(color: colorScheme(context).onSurface),
                //     ),
                //   ),
                // ),
                // const SizedBox(height: 10),

                // Gender Picker (Required)
                _buildLabel(context, 'Gender'),
                GestureDetector(
                  onTap: () => showModalBottomSheet(
                    context: context,
                    builder: (_) => Column(
                      mainAxisSize: MainAxisSize.min,
                      children:
                          ['Male', 'Female', 'Other'].map((String choice) {
                        return RadioListTile<String>(
                          title: Text(choice),
                          value: choice,
                          groupValue: createUserProvider.gender,
                          onChanged: (String? value) {
                            if (value != null) {
                              createUserProvider.selectGender(value);
                              Navigator.pop(context);
                            }
                          },
                        );
                      }).toList(),
                    ),
                  ),
                  child: InputDecorator(
                    decoration: InputDecoration(
                      hintText: 'Select Gender',
                      errorText: createUserProvider.showErrors &&
                              !createUserProvider.validateGender()
                          ? 'Gender is required'
                          : null,
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
                    child: Text(
                      createUserProvider.gender.isNotEmpty
                          ? createUserProvider.gender
                          : 'Select Gender',
                      style: textTheme(context)
                          .titleSmall
                          ?.copyWith(color: colorScheme(context).onSurface),
                    ),
                  ),
                ),
                const SizedBox(height: 10),

                // DOB Picker (Required)
                _buildLabel(context, 'DOB'),
                GestureDetector(
                  onTap: () async {
                    final pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime(2000),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );
                    if (pickedDate != null) {
                      createUserProvider.setDob(
                          '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}');
                    }
                  },
                  child: InputDecorator(
                    decoration: InputDecoration(
                      hintText: '**/**/****',
                      errorText: createUserProvider.showErrors &&
                              !createUserProvider.validateDob()
                          ? 'DOB is required'
                          : null,
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
                    child: Text(
                      createUserProvider.dob.isNotEmpty
                          ? createUserProvider.dob
                          : '**/**/****',
                      style: textTheme(context)
                          .titleSmall
                          ?.copyWith(color: colorScheme(context).onSurface),
                    ),
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
              if (createUserProvider.validateForm()) {
                context.pushNamed(AppRoute.broadcasterPage);
              }
            },
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(BuildContext context, String label) {
    return Text(
      label,
      style: textTheme(context).bodyMedium?.copyWith(
            color: colorScheme(context).onSurface.withOpacity(0.5),
          ),
    );
  }
}
