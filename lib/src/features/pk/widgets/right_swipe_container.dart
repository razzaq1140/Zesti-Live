import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/features/pk/modals/right_drawer_modal.dart';
import 'package:flutter_svg/svg.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';

class RightSwipeDrawer extends StatelessWidget {
  const RightSwipeDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 150, bottom: 100),
      child: Drawer(
        surfaceTintColor: null,
        backgroundColor: colorScheme(context).outline.withOpacity(0.4),
        width: 150,
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8),
          child: Column(
            children: <Widget>[
              Container(
                height: 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: AppColor.tagRed,
                ),
                child: Center(
                  child: Text(
                    'Suggested',
                    style: textTheme(context).bodyMedium?.copyWith(
                          color: colorScheme(context).onPrimary,
                          fontSize: 13,
                        ),
                  ),
                ),
              ),
              SizedBox(
                child: ListView.builder(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  itemCount: rightdrawer.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.symmetric(vertical: 4),
                      height: 110,
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface.withOpacity(0.2),
                        image: DecorationImage(
                          image:
                              NetworkImage(rightdrawer[index].profileImageUrl),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SvgPicture.asset(AppIcons.fireIcon),
                            const SizedBox(width: 4),
                            Text(rightdrawer[index].profileText,
                                style: textTheme(context).bodySmall?.copyWith(
                                    color: colorScheme(context).onPrimary,
                                    fontWeight: FontWeight.w600)),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
