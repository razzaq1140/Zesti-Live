import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

import '../custom_widget/meet_up_row.dart';

import 'package:provider/provider.dart';

import '../image_provider/image_provider.dart';

class MeetUpFavrt extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl = Provider.of<SelectedImageProvider>(context).selectedImage;

    return Scaffold(
      backgroundColor: colorScheme(context).primary,
      appBar:   AppBar(
        toolbarHeight: 50,
        backgroundColor: colorScheme(context).primary,
        leading:IconButton(
            onPressed: (){
              context.pop() ;
            },
            icon: Icon(Icons.arrow_back_ios_rounded,size: 25,color: colorScheme(context).surface,)) ,
      ),
      body: Center(
        child: Stack(
                     //   alignment: Alignment.center,
          children: [

            SvgPicture.asset(AppImages.meetupBg),
            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  children: [
                    Spacer(),
                    Text(
                      "It’s match🎉",
                      style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 28,
                        color: colorScheme(context).surface,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "You and Claudia have liked each other.",
                      style: textTheme(context).bodySmall?.copyWith(
                        fontSize: 14,
                        color: colorScheme(context).surface,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    SizedBox(height: 30),
                    Stack(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                        Container(
                        height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColor.meetupContainer,
                            border: Border.all(
                              color: colorScheme(context).surface,
                              width: 7,
                            ),
                          ),
                          child: Consumer<SelectedImageProvider>(
                            builder: (context, provider, child) {
                              final imageUrl = provider.pfpImageUrl; // Access the image URL from the provider
                              if (imageUrl == null || imageUrl.isEmpty) {
                                // Show fallback icon if URL is null or empty
                                return Icon(
                                  Icons.image,
                                  size: 50,
                                  color: Colors.grey,
                                );
                              } else {
                                // Load the image using CachedNetworkImage
                                return ClipOval(
                                  child: CachedNetworkImage(
                                    imageUrl: imageUrl,
                                    fit: BoxFit.cover,
                                    errorWidget: (context, url, error) => Icon(
                                      Icons.image,
                                      size: 35,
                                      color:colorScheme(context).outlineVariant,
                                    ),
                                  ),
                                );
                              }
                            },
                          ),
                        ),

                        SizedBox(width: 30),
                            Container(
                              height: 120,
                              width: 120,
                              child: ClipOval(
                                child: imageUrl != null
                                    ? CachedNetworkImage(
                                  imageUrl: imageUrl,
                                  errorWidget: (context, url, error) => Icon(Icons.image,size: 35,color: colorScheme(context).outlineVariant,),
                                  fit: BoxFit.cover,
                                )
                                    : SizedBox(), // Handle null case
                              ),
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: colorScheme(context).surface,
                                    width: 7),
                                color: AppColor.meetupContainer,
                              ),
                            ),
                          ],
                        ),
                        Align(
                          alignment: Alignment.center,
                          child: Padding(
                            padding: const EdgeInsets.only(top:20.0),
                            child: Container(
                              decoration: BoxDecoration(
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(.2),
                                      blurRadius: 45,)
                                  ]
                              ),
                              child: MeetUpRow(
                                centerWidget:
                                Icon(Icons.favorite,color: colorScheme(context).surface,size: 30,),onTap: (){},
                                width: 75,height: 75,boxShadow: [],containerColor: colorScheme(context).primary,
                              ),
                            ),
                          ),
                        ),
                      ]
                    ),
                                        SizedBox(
                      height: 100,
                    ),
                    Container(width: 298,height: 58,
                        child: CustomButton(buttonText: 'Message Her!', onPressed: (){
                          context.pushNamed(AppRoute.chatting);
                        },
                          backgroundColor: colorScheme(context).surface,
                          textStyle: textTheme(context).bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,fontSize: 20,
                            color: colorScheme(context).primary,
                          ),
                        )),
                    SizedBox(height: 15,),
                    Container(width: 298,height: 58,
                        child: CustomButton(buttonText: 'Call Her!', onPressed: (){},
                          backgroundColor: colorScheme(context).surface,
                          textStyle: textTheme(context).bodySmall?.copyWith(
                            fontWeight: FontWeight.w600,fontSize: 20,
                            color: colorScheme(context).primary,
                          ),
                        )),
                    SizedBox(height: 15,),
                    TextButton(
                      child: Text("Keep Swiping", style: textTheme(context).bodySmall!.copyWith(
                          fontSize: 13,color: colorScheme(context).surface,
                          fontWeight: FontWeight.w400),),
                      onPressed:(){
                        context.pop();
                        context.pop();
                      } ,

                     ),
                    Spacer()
                ]),
              ),

            )],
        ),
      ),
    );
  }
}

