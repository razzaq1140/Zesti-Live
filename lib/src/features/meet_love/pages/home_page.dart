import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/custom_widget/meet_up.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/custom_widget/meet_up_row.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import '../image_provider/image_provider.dart';
import 'swipe_images.dart';


class MeetUpHomePage extends StatelessWidget {
  final Widget? child;


  const MeetUpHomePage({super.key,  this.child});

  @override
  Widget build(BuildContext context) {
    final pfpImageUrl = context.watch<SelectedImageProvider>().pfpImageUrl;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: colorScheme(context).surface,
        scrolledUnderElevation: 0,
        toolbarHeight: 45,
        leadingWidth: 110, // Set the desired width for the leading widget
        leading:Padding(
          padding: const EdgeInsets.only(left: 20.0),
          child: Image.asset(AppImages.meetLove, ),
        ),

        actions: [

          Icon(Icons.notifications,size: 24),
          SizedBox(width: 10,),
          Stack(
            alignment: Alignment.topRight,
            children: [
              CircleAvatar(
                backgroundColor: AppColor.meetupContainer,
                radius: 15,
                backgroundImage:NetworkImage(pfpImageUrl),
              ),

              CircleAvatar(
                backgroundColor: colorScheme(context).primary,
                radius: 6,
                child: Center(
                  child: Text('4',style: textTheme(context).bodySmall?.copyWith(
                    fontSize: 10,color: colorScheme(context).surface
                  ),),
                ),

              ),

            ],
          ),
          SizedBox(width: 20,)
        ],
      ),
      body : Column(
        children: [
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: SizedBox(
              height:MediaQuery.of(context).size.height * 0.57,
              child: MeetUpWidget()
            ),
          ),
          SizedBox(height: 10,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MeetUpRow(centerWidget: SvgPicture.asset(AppIcons.clearIcon,color: colorScheme(context).primary,),onTap: (){},),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: MeetUpRow(
                  centerWidget:
                Icon(Icons.favorite,color: colorScheme(context).surface,size: 30,),onTap: (){

                },
                  width: 75,height: 75,boxShadow: [],containerColor: colorScheme(context).primary,
                ),
              ),
              MeetUpRow(centerWidget: Icon(Icons.star,color: AppColor.starIcon,size: 30,),onTap: (){},),
            ],
          ),
          SizedBox(height: 20,),
        ],

      )
    );
  }
}