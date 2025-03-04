import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/features_e_commerce/pages/all_item_detail_page.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/custom_widget/meet_up_hobbies.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/meetup_model/meet_up_model.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/pages/swipe_images.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common/const/app_images.dart';
import '../custom_widget/meet_up_row.dart';
import 'meet_up_favrt.dart';

class MeetUpDetail extends StatelessWidget {
  final String? name;
  final String? address;
  final Widget? child;
  final bool? verified;

  const MeetUpDetail({super.key,  this.name,  this.address, this.child, this.verified, });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 375,width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColor.meetupContainer,
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(40),
                      bottomLeft: Radius.circular(40),
                    )
                  ),
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(bottomRight: Radius.circular(40),bottomLeft: Radius.circular(40)),
                      child: child ),
                ),
                Positioned(
                  top: 45,left: 28,
                  child: GestureDetector(
                    onTap: (){
                      Navigator.pop(context) ;
                      },
                      child: Container(
                      width: 37,height: 37,
                      child: Icon(Icons.arrow_back_ios_rounded,size: 20,),
                      decoration: BoxDecoration(
                        color: colorScheme(context).surface,
                        shape: BoxShape.circle
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 328),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MeetUpRow(centerWidget: SvgPicture.asset(AppIcons.clearIcon,color: colorScheme(context).primary,),onTap: (){},),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 25.0),
                        child: MeetUpRow(

                          centerWidget:
                          Icon(
                            Icons.favorite,
                            color: colorScheme(context).surface,
                            size: 30,
                          ),
                          onTap: () {
                            if (child is CachedNetworkImage) {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MeetUpFavrt(),
                                ),
                              );
                            }
                          },

                          width: 75,height: 75,boxShadow: [],containerColor: colorScheme(context).primary,
                        ),
                      ),
                      MeetUpRow(centerWidget: Icon(Icons.star,color: AppColor.starIcon,size: 30,),onTap: (){},),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 15,),
            Row(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        SizedBox(width: 15,),
                        Text(
                          name!,
                          style: textTheme(context).bodySmall?.copyWith(
                            fontSize: 20,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        verified == true ?
                        Icon(
                          Icons.check_circle,
                          color: AppColor.checkIcon,
                        ): SizedBox(),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.location_on_sharp,
                          color: colorScheme(context).primary,
                        ),
                        Text(
                          address!,
                          style: textTheme(context).bodySmall?.copyWith(
                            fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          width: 40,
                        )
                      ],
                    ),
                  ],
                ),

                SizedBox(
                  width: 15,
                )
              ],
            ),
            SizedBox(height: 15,),
            Align(alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text('About',style: textTheme(context).bodySmall?.copyWith(
                      fontSize: 14 , fontWeight: FontWeight.w600
                  ),),
                )),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0,right: 15),
              child: Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit. Curabitur tempus lacus in quam laoreet, eget finibus orci pharetra. Sed molestie leo eget urna egestas tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Donec nec luctus tortor, at sagittis orci.',
              style: textTheme(context).bodySmall?.copyWith(
                fontSize: 10,fontWeight: FontWeight.w400
              ),
              ),
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(left: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Interest',style: textTheme(context).bodySmall?.copyWith(
                    fontSize: 14 , fontWeight: FontWeight.w600
                  ),),
                  SizedBox(height: 10,),
                  Row(
                    children: [
                     MeetUpHobbies(meetupModel: MeetUpModel(interestName: 'Movie',interestColor: AppColor.hobby1Bg,)),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MeetUpHobbies(
                          meetupModel: MeetUpModel(interestName: 'Photography',interestColor:  AppColor.hobby2Bg,),
                          width: 106,
                        ),
                      ),
                      MeetUpHobbies(
                        meetupModel: MeetUpModel(interestColor: AppColor.hobby3Bg, interestName: 'Design'),
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      MeetUpHobbies(
                        meetupModel: MeetUpModel(interestColor: AppColor.hobby4Bg, interestName: 'Book Reading'),
                        width: 106,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: MeetUpHobbies(
                          meetupModel: MeetUpModel(interestColor: AppColor.hobby5Bg, interestName: 'Singing'),
                        ),
                      ),
                      MeetUpHobbies(
                        meetupModel: MeetUpModel(interestColor: AppColor.hobby6Bg,interestName:  'Music'),
                      ),
                    ],
                  ),

                  SizedBox(height: 10,)
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
