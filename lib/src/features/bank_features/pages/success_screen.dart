import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../../../common/const/global_variables.dart';

class SuccessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
       appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () {
                context.pop();
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.all(
                    Radius.elliptical(10, 10),
                  ),
                ),
                child: Icon(Icons.keyboard_arrow_left),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Image.asset(
                  AppImages.greenChck,
                  height: 100,
                  width: 100,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'Your\nTransaction Success!',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14.0),
                  child: Stack(
                    children: [
                      Container(
                        height: 380,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(12),
                              child: Container(
                                height: 320,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                      color: Colors.grey.shade300),
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Colors.grey.shade300,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 20, vertical: 35),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Rp 1.200.000',
                                            style: textTheme.headlineMedium
                                                ?.copyWith(
                                                    fontWeight:
                                                        FontWeight.bold,
                                                    fontSize: 28),
                                          ),
                                          const SizedBox(height: 5),
                                          Text(
                                            'Success sent to Ibu Rete',
                                            style: textTheme.titleMedium
                                                ?.copyWith(
                                                    color: colorScheme(
                                                            context)
                                                        .outline
                                                        .withOpacity(0.6)),
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Text('Code:',
                                                  style:
                                                      textTheme.bodyMedium),
                                              Text('NVX1256SJKL0',
                                                  style:
                                                      textTheme.bodyMedium),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Text('Reference Code:',
                                                  style:
                                                      textTheme.bodyMedium),
                                              Text('-',
                                                  style:
                                                      textTheme.bodyMedium),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Text('Date:',
                                                  style:
                                                      textTheme.bodyMedium),
                                              Text("1 July 2021",
                                                  style:
                                                      textTheme.bodyMedium),
                                            ],
                                          ),
                                          const SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment
                                                    .spaceBetween,
                                            children: [
                                              Text('Time:',
                                                  style:
                                                      textTheme.bodyMedium),
                                              Text("9:03 pm",
                                                  style:
                                                      textTheme.bodyMedium),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                        left: 20,
                        right: 20,
                        bottom: 25,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.white,
                              child: SvgPicture.asset(AppIcons.bookMark),
                            ),
                            SizedBox(width: 20),
                            FloatingActionButton(
                              onPressed: () {},
                              backgroundColor: Colors.black,
                              child: SvgPicture.asset(AppIcons.sent),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
