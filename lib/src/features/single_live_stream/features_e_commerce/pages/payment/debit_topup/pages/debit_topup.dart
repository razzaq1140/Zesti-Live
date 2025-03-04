import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/add_user_to_join_call/pages/add_user_to_join_call.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class DebitTopup extends StatefulWidget {
  const DebitTopup({super.key});

  @override
  State<DebitTopup> createState() => _DebitTopupState();
}

class _DebitTopupState extends State<DebitTopup> {
  final TextEditingController _nominalController = TextEditingController();
  int? selectedValue;

  // List of nominal amounts with associated icons
  final List<Map<String, dynamic>> amounts = [
    {'value': 10, 'icon': Icons.monetization_on_outlined},
    {'value': 50, 'icon': Icons.monetization_on_outlined},
    {'value': 100, 'icon': Icons.monetization_on_outlined},
    {'value': 200, 'icon': Icons.monetization_on_outlined},
  ];

  @override
  void dispose() {
    _nominalController.dispose();
    super.dispose();
  }

  void _onAmountSelected(int value) {
    setState(() {
      selectedValue = value;
      _nominalController.text = "\$${value.toString()}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                  height: 35,
                  width: 35,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: colorScheme(context).primary,
                  ),
                  child: Center(
                    child: Icon(
                      Icons.arrow_back_outlined,
                      color: colorScheme(context).surface,
                      size: 14, // Adjust icon size to fit
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 100),
              Text(
                "Top Up",
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context)
                        .outline
                        .withOpacity(0.7), // Contrast color
                    fontSize: 14,
                    fontWeight: FontWeight.w700),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Container(
                  height: 226, // Adjusted height
                  width: double.infinity, // Full width of the screen
                  padding: const EdgeInsets.all(16.0),
                  decoration: BoxDecoration(
                    color: colorScheme(context).outline.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Nominal input',
                        style: textTheme(context).bodyMedium?.copyWith(
                            color: colorScheme(context)
                                .outline
                                .withOpacity(0.7), // Contrast color
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        controller: _nominalController,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          hintText: '\$0',
                          hintStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: colorScheme(context)
                                  .outline
                                  .withOpacity(0.3)),
                          filled: true,
                          fillColor: Colors.white,
                          contentPadding: const EdgeInsets.symmetric(
                            vertical: 16.0,
                            horizontal: 12.0,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      const SizedBox(height: 18),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: amounts.map((amount) {
                          final int value = amount['value'];
                          final IconData icon = amount['icon'];

                          return GestureDetector(
                            onTap: () => _onAmountSelected(value),
                            child: Column(
                              children: [
                                // Nominal container
                                Container(
                                    width: 55, // Increased width
                                    height: 55, // Increased height
                                    decoration: BoxDecoration(
                                      color: colorScheme(context)
                                          .surface, // Light grey color
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(12.0),
                                      child: SvgPicture.asset(
                                        AppIcons.coinone,
                                        height: 24,
                                        width: 24,
                                      ),
                                    )),
                                const SizedBox(height: 5),
                                // Text below the container, color changes on selection
                                Text(
                                  '\$$value',
                                  style: TextStyle(
                                    color: selectedValue == value
                                        ? Colors.red // Red when selected
                                        : Colors.black, // Default black color
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 28),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: colorScheme(context)
                        .outline
                        .withOpacity(0.1), // Background color
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Icon Container

                      SvgPicture.asset(AppIcons.payment),

                      const SizedBox(
                          width: 16.0), // Spacing between icon and text
                      // Text Section
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Add a debit card',
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.7), // Contrast color
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Can this balance directly from here',
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.5), // Contrast color
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      // Right Arrow Icon

                      InkWell(
                        onTap: () {},
                        child: Container(
                          width: 19,
                          height: 19,
                          decoration: BoxDecoration(
                            color: colorScheme(context)
                                .primary, // Background color for arrow container
                            shape: BoxShape.circle, // Circular shape
                          ),
                          child: Center(
                            child: const Icon(
                              Icons.arrow_forward_ios, // Forward arrow icon
                              color: Colors.white, // White icon color
                              size: 14,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 200,
                ),
                CustomButton(buttonText: "Continue", onPressed: () {})
              ],
            ),
          ),
        ),
      ),
    );
  }
}
