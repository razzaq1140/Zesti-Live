import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/view/custom_Container.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/view/custom_circle.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/view/custom_search_container.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';

class AudioLive extends StatefulWidget {
  const AudioLive({super.key});

  @override
  State<AudioLive> createState() => _AudioLiveState();
}

class _AudioLiveState extends State<AudioLive> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColor.textGrey,
      body: SingleChildScrollView(
        child: Container(
          width: width,
          padding: const EdgeInsets.fromLTRB(20, 20, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  height: height * 0.06,
                  width: width * 0.08,
                  decoration: BoxDecoration(
                      color: colorScheme(context).onSurface.withOpacity(0.3),
                      shape: BoxShape.circle),
                  child: Center(
                    child: IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const Icon(Icons.close_outlined,
                            color: Colors.white, size: 15)),
                  ),
                ),
              ),
              Row(
                children: [
                  CustomContainer(
                      height: height * 0.13,
                      width: width * 0.2,
                      color: colorScheme(context).onSecondary,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Container(
                            height: height * 0.03,
                            width: width,
                            decoration: BoxDecoration(
                                color: colorScheme(context)
                                    .onSurface
                                    .withOpacity(0.3),
                                borderRadius: const BorderRadius.only(
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10))),
                            child: Center(
                                child: Text(
                              "Edit",
                              style: textTheme(context).bodySmall,
                            )),
                          ),
                        ],
                      )),
                  SizedBox(
                    width: width * 0.03,
                  ),
                  Column(
                    children: [
                      Text(
                        "Add a title to chat",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: height * 0.04),
                      CustomContainer(
                          height: height * 0.03,
                          width: width * 0.25,
                          color:
                              colorScheme(context).onSurface.withOpacity(0.3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Select tag",
                                style: textTheme(context)
                                    .bodySmall
                                    ?.copyWith(fontWeight: FontWeight.w600),
                              ),
                              Icon(
                                Icons.chevron_right,
                                size: width * 0.05,
                              )
                            ],
                          )),
                    ],
                  )
                ],
              ),
              SizedBox(height: height * 0.03),
              Row(
                children: [
                  SizedBox(
                    height: height * 0.08,
                    width: width * 0.8,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Share to",
                          style: textTheme(context).bodyMedium?.copyWith(
                              color: colorScheme(context).onSecondary),
                        ),
                        CustomCircle(
                            ontap: () {},
                            child: SvgPicture.asset(AppIcons.twitter)),
                        CustomCircle(
                            ontap: () {},
                            child: SvgPicture.asset(AppIcons.insta)),
                        CustomCircle(
                            ontap: () {}, child: SvgPicture.asset(AppIcons.fb)),
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
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Center(
                          child: Text("Best friends on Yeah live!",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary)),
                        )),
                    SizedBox(width: width * 0.03),
                    CustomSearchContainer(
                        height: height * 0.03,
                        width: width * 0.5,
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Center(
                            child: Text("Stay single or get married?",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary))))
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
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Center(
                          child: Text("Happy moment or sad moment",
                              style: textTheme(context).bodySmall?.copyWith(
                                  color: colorScheme(context).onPrimary)),
                        )),
                    SizedBox(width: width * 0.03),
                    CustomSearchContainer(
                        height: height * 0.03,
                        width: width * 0.4,
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Center(
                            child: Text("old music lover",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary))))
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
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Love Story",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary)),
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
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Center(
                            child: Text("who has the moments",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary)))),
                    SizedBox(width: width * 0.03),
                    CustomSearchContainer(
                        height: height * 0.03,
                        width: width * 0.4,
                        color: colorScheme(context).onSurface.withOpacity(0.3),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: height * 0.03,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: colorScheme(context).primary)),
                              child: Icon(
                                Icons.done,
                                color: colorScheme(context).primary,
                                size: width * 0.03,
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text("Yes",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary)),
                            SizedBox(width: width * 0.02),
                            Container(
                              height: height * 0.03,
                              width: width * 0.04,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      color: colorScheme(context).primary)),
                              child: Icon(
                                Icons.close,
                                color: colorScheme(context).primary,
                                size: width * 0.03,
                              ),
                            ),
                            SizedBox(width: width * 0.01),
                            Text("No",
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary)),
                          ],
                        ))
                  ],
                ),
              ),
              SizedBox(height: height * 0.23),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    height: height * 0.07,
                    width: width * 0.5,
                    child: CustomButton(
                        buttonText: "Go LIVE",
                        onPressed: () {
                          context.pushNamed(AppRoute.audioLiveCount);
                        })),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: SizedBox(
                  height: height * 0.05,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        "Explore the world",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(color: colorScheme(context).onPrimary),
                      )),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
