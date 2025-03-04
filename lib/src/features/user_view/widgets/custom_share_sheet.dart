// import 'package:flutter/material.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
// import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
// import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
// import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
// import 'package:flutter_application_zestilive/src/features/audio_live/pages/audio_live.dart';
// import 'package:flutter_application_zestilive/src/router/go_route.dart';
// import 'package:go_router/go_router.dart';

// class ShareScreenRecordSheet extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 432,
//       width: double.infinity,
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: const BorderRadius.only(
//             topLeft: Radius.circular(16), topRight: Radius.circular(16)),
//         border: Border.all(
//           color: AppColor.dividerClr,
//           width: 1,
//         ),
//       ),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Center(
//               child: Column(
//                 children: [
//                   Text(
//                     'Share',
//                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                           fontSize: 24,
//                           fontWeight: FontWeight.w700,
//                         ),
//                   ),
//                   const SizedBox(
//                     height: 4,
//                   ),
//                   Container(
//                     height: 6,
//                     width: 6,
//                     decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(5),
//                         color: colorScheme(context).primary),
//                   )
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 12,
//             ),
//             Divider(
//               thickness: 1,
//               color: AppColor.dividerClr,
//             ),
//             const SizedBox(
//               height: 16,
//             ),
//             Container(
//               height: 236,
//               width: double.infinity,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(16),
//                 color: colorScheme(context).outline.withOpacity(0.5),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.start,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.symmetric(vertical: 10.0),
//                     child: Container(
//                       height: 120,
//                       width: 170,
//                       decoration: const BoxDecoration(
//                         image: DecorationImage(
//                           image: AssetImage(AppImages.streamer),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   Padding(
//                     padding: const EdgeInsets.symmetric(horizontal: 16.0),
//                     child: RichText(
//                       textAlign: TextAlign.center,
//                       text: TextSpan(
//                         children: [
//                           TextSpan(
//                             text: "Putri•AriinyL x's   ",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleLarge
//                                 ?.copyWith(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w700,
//                                   color: colorScheme(context).primary,
//                                 ),
//                           ),
//                           TextSpan(
//                             text:
//                                 "Highlight. Come and follow them and watch their live broadcast together",
//                             style: Theme.of(context)
//                                 .textTheme
//                                 .titleLarge
//                                 ?.copyWith(
//                                   fontSize: 12,
//                                   fontWeight: FontWeight.w700,
//                                   color: colorScheme(context).surface,
//                                 ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   const SizedBox(height: 12),
//                   CustomButton(
//                     height: 40,
//                     width: 180,
//                     buttonText: "Post a reel",
//                     onPressed: () {
//                       context.pushNamed(AppRoute.reelPage);
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(
//               height: 24,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 SocialIcon(
//                   imagePath: AppImages.newwtsapp,
//                   text: "Whatsapp",
//                   onTap: () {},
//                 ),
//                 SocialIcon(
//                   imagePath: AppImages.facebook,
//                   text: "Facebook",
//                   onTap: () {},
//                 ),
//                 SocialIcon(
//                   imagePath: AppImages.download,
//                   text: "Download",
//                   onTap: () {},
//                 ),
//                 SocialIcon(
//                   imagePath: AppImages.other,
//                   text: "Others",
//                   onTap: () {},
//                 ),
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class SocialIcon extends StatelessWidget {
//   final String imagePath;
//   final String text;
//   final VoidCallback onTap;

//   const SocialIcon({
//     Key? key,
//     required this.imagePath,
//     required this.text,
//     required this.onTap,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Column(
//         children: [
//           Image.asset(
//             imagePath, // Display the icon image
//             height: 32,
//             width: 32,
//           ),
//           const SizedBox(height: 4), // Space between image and text
//           Text(
//             text,
//             style: Theme.of(context).textTheme.titleLarge?.copyWith(
//                   fontSize: 12,
//                   fontWeight: FontWeight.w700,
//                   color: Theme.of(context).colorScheme.outline,
//                 ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:go_router/go_router.dart';

class ShareScreenRecordSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 432,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
        border: Border.all(
          color: AppColor.dividerClr,
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Center(
                child: Column(
                  children: [
                    Text(
                      'Share',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                          ),
                    ),
                    const SizedBox(height: 4),
                    Container(
                      height: 6,
                      width: 6,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Theme.of(context).colorScheme.primary,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              Divider(
                thickness: 1,
                color: AppColor.dividerClr,
              ),
              const SizedBox(height: 16),
              Container(
                height: 236,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.5),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        height: 120,
                        width: 170,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(AppImages.streamer),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          children: [
                            TextSpan(
                              text: "Putri•AriinyL x's   ",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.primary,
                                  ),
                            ),
                            TextSpan(
                              text:
                                  "Highlight. Come and follow them and watch their live broadcast together",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleLarge
                                  ?.copyWith(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w700,
                                    color:
                                        Theme.of(context).colorScheme.surface,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 12),
                    CustomButton(
                      height: 40,
                      width: 180,
                      buttonText: "Post a reel",
                      onPressed: () {
                        // context.pushNamed(
                        //   AppRoute.reelPage, // Use the exact name from GoRoute
                        //   extra: {
                        //     'imagePath': AppImages.streamer,
                        //     'text':
                        //         "Highlight. Come and follow them and watch their live broadcast together",
                        //   },
                        // );
                        context.pushNamed(AppRoute.reelPage);
                      },
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 24,
                runSpacing: 18,
                alignment: WrapAlignment.start,
                children: [
                  SocialIcon(
                    imagePath: AppImages.newwtsapp,
                    text: "WhatsApp",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.facebook,
                    text: "Facebook",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.twitter,
                    text: "Twitter",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.messenger,
                    text: "Messenger",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.instagram,
                    text: "Instagram",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.telegram,
                    text: "Telegram",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.contact,
                    text: "Contacts",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.other,
                    text: "Others",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.download,
                    text: "Download",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.disliketwo,
                    text: "Dislike",
                    onTap: () {},
                  ),
                  SocialIcon(
                    imagePath: AppImages.report,
                    text: "Report",
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SocialIcon extends StatelessWidget {
  final String imagePath;
  final String text;
  final VoidCallback onTap;

  const SocialIcon({
    Key? key,
    required this.imagePath,
    required this.text,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Image.asset(
            imagePath,
            height: 32,
            width: 32,
          ),
          const SizedBox(height: 4),
          Text(
            text,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Theme.of(context).colorScheme.outline,
                ),
          ),
        ],
      ),
    );
  }
}
