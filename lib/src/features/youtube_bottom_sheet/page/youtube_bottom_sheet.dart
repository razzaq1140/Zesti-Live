import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_textfield.dart';
import 'package:flutter_application_zestilive/src/features/gift_user_view/widget/gift_custom_container.dart';
import 'package:flutter_application_zestilive/src/features/youtube_bottom_sheet/provider/youtube_sheet_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class YoutubeBottomSheet extends StatefulWidget {
  YoutubeBottomSheet({super.key});

  @override
  State<YoutubeBottomSheet> createState() => _YoutubeBottomSheetState();
}

class _YoutubeBottomSheetState extends State<YoutubeBottomSheet> {
  @override
  void initState() {
    super.initState();
    // Initialize the filtered list when the screen opens
    Future.microtask(() {
      Provider.of<YoutubeSheetProvider>(context, listen: false)
          .initializePostList();
    });
  }


  @override
  // ignore: override_on_non_overriding_member

  List<String> tapBarListName = ['', 'New to you', 'Trailer', 'Songs', 'Figma'];

  Widget build(BuildContext context) {
    var m = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton(onPressed: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => 
          
          
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SvgPicture.asset(
                      AppIcons.youtubeIcon,
                      height: 25,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: SvgPicture.asset(
                        AppIcons.clearIcon,
                        color: colorScheme(context).onSurface,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Consumer<YoutubeSheetProvider>(
                  builder: (context, value, child) => CustomTextFormField(
                    borderRadius: 100,
                    fillColor: AppColor.textFieldColor,
                    prefixIcon: Icon(
                      Icons.search,
                      color: colorScheme(context).onSurface.withOpacity(.6),
                    ),
                    onChanged: (val) {
                      value.searchPost(val);
                    },
                    hint: 'Search keywords or video link',
                    hintColor: colorScheme(context).onSurface.withOpacity(.6),
                    hintSize: 11,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(tapBarListName.length, (index) {
                      return index == 0
                          ? Padding(
                              padding: const EdgeInsets.only(left: 5.0),
                              child: GiftCustomContainer(
                                color: colorScheme(context).onSurface,
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 5),
                                borderRadius: 8,
                                child: SvgPicture.asset(
                                  AppIcons.youtubeExploreIcon,
                                  color: colorScheme(context).surface,
                                  height: 18,
                                ),
                              ),
                            )
                          : Consumer<YoutubeSheetProvider>(
                              builder: (context, value, child) => Padding(
                                padding: EdgeInsets.symmetric(horizontal: 4.50),
                                child: GestureDetector(
                                  onTap: () {
                                    value.tapBarIndexSelected(index);
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(8),
                                        gradient: value.tapBarIndex == index
                                            ? LinearGradient(
                                                colors: [
                                                  AppColor.youToubeGradientOne,
                                                  AppColor.youToubeGradientTwo,
                                                  AppColor.youToubeGradientThree
                                                ],
                                              )
                                            : null),
                                    child: Padding(
                                      padding: const EdgeInsets.all(1.0),
                                      child: GiftCustomContainer(
                                        borderRadius: 8,
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 10, vertical: 5),
                                        color: AppColor.textFieldColor,
                                        child: Text(
                                          tapBarListName[index],
                                          style: textTheme(context)
                                              .bodySmall
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .onSurface,
                                                  fontSize: 12),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            );
                    }),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: m.height * 0.32,
                  width: m.width,
                  child: SingleChildScrollView(
                    child: Consumer<YoutubeSheetProvider>(
                      builder: (context, value, child) => Column(
                        children:
                            List.generate(value.filterPostList.length, (index) {
                          return Padding(
                            padding: EdgeInsets.symmetric(vertical: 4.0),
                            child: Column(
                              children: [
                                SizedBox(
                                  height: m.height * 0.25,
                                  width: m.width,
                                  child: Image.asset(
                                    value.filterPostList[index].image,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    CircleAvatar(
                                      backgroundColor:
                                          colorScheme(context).surface,
                                      radius: 18,
                                      child: Image.asset(value
                                          .filterPostList[index].userProfile),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: m.width * 0.8,
                                          child: Text(
                                            value.filterPostList[index]
                                                .description,
                                            style: textTheme(context)
                                                .bodySmall
                                                ?.copyWith(
                                                    color: colorScheme(context)
                                                        .onSurface,
                                                    fontWeight: FontWeight.w600,
                                                    fontSize: 12),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 5,
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              value.filterPostList[index]
                                                  .imageTitle,
                                              style: textTheme(context)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color:
                                                          colorScheme(context)
                                                              .onSurface
                                                              .withOpacity(.5),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 9),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            CircleAvatar(
                                              radius: 6,
                                              backgroundColor:
                                                  colorScheme(context)
                                                      .onSurface
                                                      .withOpacity(.5),
                                              child: Icon(
                                                Icons.check,
                                                size: 10,
                                                color: colorScheme(context)
                                                    .surface,
                                              ),
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(
                                              value.filterPostList[index].views,
                                              style: textTheme(context)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color:
                                                          colorScheme(context)
                                                              .onSurface
                                                              .withOpacity(.5),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 9),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            CircleAvatar(
                                              radius: 2,
                                              backgroundColor:
                                                  colorScheme(context)
                                                      .onSurface
                                                      .withOpacity(.5),
                                            ),
                                            SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              value.filterPostList[index].time,
                                              style: textTheme(context)
                                                  .bodySmall
                                                  ?.copyWith(
                                                      color:
                                                          colorScheme(context)
                                                              .onSurface
                                                              .withOpacity(.5),
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      fontSize: 9),
                                            ),
                                          ],
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          );
                        }),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }),
    );
  }
}
