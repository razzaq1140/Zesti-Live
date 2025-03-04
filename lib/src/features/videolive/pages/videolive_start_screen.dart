import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/view/custom_circle.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/view/custom_search_container.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/social_share_dailog.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/tags_bottomsheet.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class VideoLiveStartScreen extends StatefulWidget {
  const VideoLiveStartScreen({super.key});

  @override
  State<VideoLiveStartScreen> createState() => _VideoLiveStartScreenState();
}

class _VideoLiveStartScreenState extends State<VideoLiveStartScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
            backgroundColor: AppColor.textGrey,
            body: Container(
                width: width,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(AppNetworkImages.networkOne),
                    fit: BoxFit.fitHeight,
                  ),
                ),
                padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Row(
                              children: [
                                Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: colorScheme(context).onSecondary,
                                      image: const DecorationImage(
                                          image: NetworkImage(
                                              AppNetworkImages.networkEight),
                                          fit: BoxFit.cover),
                                    ),
                                    height: 82,
                                    width: 82,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Container(
                                          height: 20,
                                          width: width,
                                          decoration: BoxDecoration(
                                              color: colorScheme(context)
                                                  .onSurface
                                                  .withOpacity(0.3),
                                              borderRadius:
                                                  const BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(10),
                                                      bottomLeft:
                                                          Radius.circular(10))),
                                          child: Center(
                                              child: Text(
                                            "Edit",
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .onPrimary),
                                          )),
                                        ),
                                      ],
                                    )),
                                SizedBox(
                                  width: width * 0.03,
                                ),
                                SizedBox(
                                  height: 82,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        "Add a title to chat",
                                        style: textTheme(context)
                                            .titleMedium
                                            ?.copyWith(
                                                fontWeight: FontWeight.w700,
                                                color: colorScheme(context)
                                                    .onPrimary),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          showModalBottomSheet(
                                              context: context,
                                              builder: (context) =>
                                                  TagsBottomSheet());
                                        },
                                        child: Container(
                                            height: height * 0.03,
                                            width: width * 0.25,
                                            decoration: BoxDecoration(
                                                color: colorScheme(context)
                                                    .onSurface
                                                    .withOpacity(0.2),
                                                borderRadius:
                                                    BorderRadius.circular(20)),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  "Select tag",
                                                  style: textTheme(context)
                                                      .bodySmall
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w500,
                                                        color:
                                                            colorScheme(context)
                                                                .onPrimary,
                                                      ),
                                                ),
                                                Icon(
                                                  Icons.chevron_right,
                                                  size: 20,
                                                  color: colorScheme(context)
                                                      .onPrimary,
                                                )
                                              ],
                                            )),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const Spacer(),
                          SizedBox(
                            height: 26,
                            width: 26,
                            child: IconButton.filled(
                                style: IconButton.styleFrom(
                                  padding: const EdgeInsets.all(0),
                                  backgroundColor: colorScheme(context)
                                      .onSurface
                                      .withOpacity(0.3),
                                ),
                                onPressed: () {
                                  context.pop();
                                },
                                icon: const Icon(Icons.close_outlined,
                                    color: Colors.white, size: 24)),
                          ),
                        ],
                      ),
                      SizedBox(height: height * 0.03),
                      Row(
                        children: [
                          SizedBox(
                            width: width * 0.8,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Text(
                                  "Share to",
                                  style: textTheme(context)
                                      .bodyMedium
                                      ?.copyWith(
                                          color:
                                              colorScheme(context).onSecondary),
                                ),
                                CustomCircle(
                                    ontap: () {
                                      showSocialShareDialog(
                                          context: context,
                                          platformName: 'Twitter',
                                          onConfirm: () {});
                                    },
                                    child: SvgPicture.asset(AppIcons.twitter)),
                                CustomCircle(
                                    ontap: () {
                                      showSocialShareDialog(
                                          context: context,
                                          platformName: 'Instagram',
                                          onConfirm: () {});
                                    },
                                    child: SvgPicture.asset(AppIcons.insta)),
                                CustomCircle(
                                    ontap: () {
                                      showSocialShareDialog(
                                          context: context,
                                          platformName: 'Facebook',
                                          onConfirm: () {});
                                    },
                                    child: SvgPicture.asset(AppIcons.fb)),
                                Text(
                                  "|",
                                  style: textTheme(context).bodyLarge?.copyWith(
                                      fontWeight: FontWeight.bold,
                                      color: colorScheme(context).onPrimary,
                                      fontSize: height * 0.03),
                                ),
                                CustomCircle(
                                    ontap: () {},
                                    child: SvgPicture.asset(AppIcons.lock)),
                                CustomCircle(
                                    ontap: () {},
                                    child: Icon(Icons.no_photography_outlined,
                                        color: colorScheme(context).onPrimary,
                                        size: width * 0.045)),
                                CustomCircle(
                                    ontap: () {},
                                    child: SvgPicture.asset(AppIcons.diamond)),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "Everyone is chatting....",
                        style: textTheme(context)
                            .bodySmall
                            ?.copyWith(color: colorScheme(context).onPrimary),
                      ),
                      SizedBox(height: height * 0.03),
                      SizedBox(
                        height: height * 0.05,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.5,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Center(
                                  child: Text("Best friends on Yeah live!",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onPrimary)),
                                )),
                            SizedBox(width: width * 0.03),
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.5,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Center(
                                    child: Text("Stay single or get married?",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary))))
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      SizedBox(
                        height: height * 0.05,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.6,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Center(
                                  child: Text("Happy moment or sad moment",
                                      style: textTheme(context)
                                          .bodySmall
                                          ?.copyWith(
                                              color: colorScheme(context)
                                                  .onPrimary)),
                                )),
                            SizedBox(width: width * 0.03),
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.4,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Center(
                                    child: Text("old music lover",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary))))
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.03),
                      SizedBox(
                        height: height * 0.05,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.4,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Love Story",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary)),
                                    SizedBox(width: width * 0.01),
                                    Icon(
                                      Icons.heart_broken,
                                      size: width * 0.04,
                                      color: colorScheme(context).primary,
                                    )
                                  ],
                                )),
                            SizedBox(width: width * 0.03),
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.5,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Center(
                                    child: Text("who has the moments",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary)))),
                            SizedBox(width: width * 0.03),
                            CustomSearchContainer(
                                height: height * 0.03,
                                width: width * 0.4,
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: height * 0.03,
                                      width: width * 0.04,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: colorScheme(context)
                                                  .primary)),
                                      child: Icon(
                                        Icons.done,
                                        color: colorScheme(context).primary,
                                        size: width * 0.03,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    Text("Yes",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary)),
                                    SizedBox(width: width * 0.02),
                                    Container(
                                      height: height * 0.03,
                                      width: width * 0.04,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                              color: colorScheme(context)
                                                  .primary)),
                                      child: Icon(
                                        Icons.close,
                                        color: colorScheme(context).primary,
                                        size: width * 0.03,
                                      ),
                                    ),
                                    SizedBox(width: width * 0.01),
                                    Text("No",
                                        style: textTheme(context)
                                            .bodySmall
                                            ?.copyWith(
                                                color: colorScheme(context)
                                                    .onPrimary)),
                                  ],
                                ))
                          ],
                        ),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: SvgPicture.asset(AppIcons.makeupIcon),
                          ),
                          Expanded(
                            child: ElevatedButton(
                              onPressed: () {
                                context
                                    .pushNamed(AppRoute.videolivecountscreen);
                              },
                              style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.all(0),
                                backgroundColor: colorScheme(context).primary,
                              ),
                              child: Text(
                                "Go LIVE",
                                style: textTheme(context).titleSmall?.copyWith(
                                      color: colorScheme(context).onPrimary,
                                      fontWeight: FontWeight.w700,
                                    ),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.emoji_emotions,
                              color: colorScheme(context).onPrimary,
                              size: 30,
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: TextButton(
                            onPressed: () {},
                            child: Text(
                              "Explore the world",
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context).onPrimary),
                            )),
                      )
                    ]))));
  }
}
