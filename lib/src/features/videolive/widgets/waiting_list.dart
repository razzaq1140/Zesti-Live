import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/audio_live/pages/live_audio_chat_expanded/model/bottom_sheet_model.dart';
import 'package:flutter_application_zestilive/src/features/videolive/widgets/accept_bottom_sheet.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

// ignore: must_be_immutable
class WaitingListsBottom extends StatelessWidget {
  final List<ViewerS1> waitingList = [
    ViewerS1(
      name: "Bang Dreams",
      status: "Love me or hate me but...",
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rings: SvgPicture.asset(AppIcons.rings),
    ),
    ViewerS1(
      name: "What to do",
      status: "Love me or hate me but...",
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rings: SvgPicture.asset(AppIcons.rings),
    ),
    ViewerS1(
      name: "Future will soon",
      status: "Love me or hate me but...",
      ic1: SvgPicture.asset(AppIcons.like),
      ic2: SvgPicture.asset(AppIcons.love),
      ic3: SvgPicture.asset(AppIcons.behaviour),
      rings: SvgPicture.asset(AppIcons.rings),
    ),
  ];
  VoidCallback onTap;
  WaitingListsBottom({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: colorScheme(context).onPrimary,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(25)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Waiting list (${waitingList.length})",
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              IconButton(
                icon: const Icon(
                  Icons.settings_outlined,
                  size: 20,
                ),
                onPressed: () {},
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (waitingList.isEmpty)
            SizedBox(
              height: 170,
              child: Center(
                child: Text(
                    'No request, call on viewers to \n request for guests',
                    textAlign: TextAlign.center,
                    style: textTheme(context)
                        .bodyMedium
                        ?.copyWith(color: AppColor.textGrey)),
              ),
            )
          else
            Flexible(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: waitingList.length,
                itemBuilder: (context, index) {
                  final ViewerS1 = waitingList[index];
                  return Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(AppImages.profileDp),
                          ),
                          title: Row(
                            children: [
                              Text(
                                ViewerS1.name,
                                style: textTheme(context)
                                    .bodyMedium
                                    ?.copyWith(fontWeight: FontWeight.bold),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: index == 0 || index == 1 || index == 3
                                    ? ViewerS1.ic1
                                    : null,
                              ),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: index == 0 || index == 3
                                    ? ViewerS1.ic2
                                    : null,
                              ),
                              SizedBox(
                                height: 15,
                                width: 15,
                                child: ViewerS1.ic3,
                              ),
                            ],
                          ),
                          subtitle: Row(
                            children: [
                              Text(
                                ViewerS1.status,
                                style: textTheme(context).bodySmall?.copyWith(
                                    fontSize: 10, color: AppColor.textGrey),
                              ),
                              SizedBox(
                                height: 10,
                                width: 10,
                                child: ViewerS1.rings,
                              ),
                            ],
                          ),
                          trailing: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: colorScheme(context)
                                                  .primary))),
                                  icon: Icon(
                                    Icons.close,
                                    color: colorScheme(context).primary,
                                    size: 15,
                                  ),
                                  onPressed: () {},
                                ),
                              ),
                              const SizedBox(
                                width: 14,
                              ),
                              SizedBox(
                                height: 30,
                                width: 30,
                                child: IconButton(
                                  style: IconButton.styleFrom(
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                          side: BorderSide(
                                              color: AppColor.appGreen))),
                                  icon: Icon(
                                    Icons.check,
                                    color: AppColor.appGreen,
                                    size: 15,
                                  ),
                                  onPressed: () {
                                    context.pop();
                                    showModalBottomSheet(
                                      context: context,
                                      builder: (context) {
                                        return AcceptBottomSheet(
                                          onTap: onTap,
                                        );
                                      },
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Divider(color: Colors.grey.shade300),
                      ],
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
