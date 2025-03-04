import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';

class PayPageTwo extends StatefulWidget {
  const PayPageTwo({super.key});

  @override
  State<PayPageTwo> createState() => _PayPageTwoState();
}

class _PayPageTwoState extends State<PayPageTwo> {
  final List<Map<String, String>> bankList = [
    {"name": "Bank of America", "details": "Checking Account - ****1234"},
    {"name": "Chase Bank", "details": "Savings Account - ****5678"},
    {"name": "Wells Fargo", "details": "Checking Account - ****9012"},
    {"name": "Citi Bank", "details": "Business Account - ****3456"},
    {"name": "HSBC", "details": "Personal Account - ****7890"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245),
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 245, 245, 245),
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
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
            Expanded(
              child: Align(
                alignment: Alignment.center,
                child: Text(
                  "To a Bank Account",
                  style: textTheme(context).bodyMedium?.copyWith(
                      color: colorScheme(context)
                          .outline
                          .withOpacity(0.7), // Contrast color
                      fontSize: 14,
                      fontWeight: FontWeight.w700),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: colorScheme(context).surface,
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [],
                  ),
                  child: 
                  Center(
                    child: 
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            textAlignVertical: TextAlignVertical
                                .center, // Ensures vertical alignment
                            decoration: InputDecoration(
                              isDense: true, // Removes extra vertical padding
                              hintText: "Find a bank or account",
                              hintStyle: TextStyle(
                                fontSize: 12,
                                color: colorScheme(context)
                                    .outline
                                    .withOpacity(0.3),
                                fontWeight: FontWeight.w400,
                              ),
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical:
                                    0, // Adjust vertical padding to center the text
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: 40,
                          width: 51,
                          decoration: BoxDecoration(
                            color: colorScheme(context).primary,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Center(
                            child: IconButton(
                              icon: Icon(Icons.search, color: Colors.white),
                              onPressed: () {},
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                Container(
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: colorScheme(context).surface, // Background color
                    borderRadius:
                        BorderRadius.circular(12.0), // Rounded corners
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      // Left Icon Container

                      SvgPicture.asset(AppIcons.bank),

                      const SizedBox(
                          width: 16.0), // Spacing between icon and text
                      // Text Section
                      Expanded(
                        flex: 2,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Transfer to a new account',
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.7), // Contrast color
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700),
                            ),
                            SizedBox(height: 4.0),
                            Text(
                              'Choose your destination bank',
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
               
               
                SizedBox(
                  height: 8,
                ),
              ],
            ),
          ),
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
            child: Container(
              color: colorScheme(context).surface,
              child: ListView.builder(
                itemCount: bankList.length,
                itemBuilder: (context, index) {
                  final bank = bankList[index];
                  return Padding(
                    padding:
                        const EdgeInsets.only(left: 16.0, right: 16, top: 6),
                    child: Column(
                      children: [
                        ListTile(
                          leading: Icon(
                            Icons.account_balance, // Icon to represent a bank
                            color: colorScheme(context).primary,
                            size: 30,
                          ),
                          title: Text(
                            bank['name']!,
                            style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.7),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          subtitle: Text(
                            bank['details']!,
                            style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context)
                                      .outline
                                      .withOpacity(0.5),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          trailing: Icon(
                            Icons.arrow_forward_ios,
                            color:
                                colorScheme(context).outline.withOpacity(0.7),
                            size: 16,
                          ),
                          onTap: () {
                            print("Tapped on ${bank['name']}");
                          },
                        ),
                        Divider(
                          color: AppColor.dividerClr,
                          thickness: 1,
                          height: 0,
                        ), // Adds a divider between list tiles
                      ],
                    ),
                  );
                },
              ),
            ),
          ))
        ],
      ),
    );
  }
}
