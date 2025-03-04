import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';

class GroupVideoCalling extends StatefulWidget {
  const GroupVideoCalling({super.key});

  @override
  State<GroupVideoCalling> createState() => _GroupVideoCallingState();
}

class _GroupVideoCallingState extends State<GroupVideoCalling> {
  List<bool> isMacIcon = [true, true, true, true];
  bool mac = true;

  late Timer _timer;
  String _currentTime = '';

  @override
  void initState() {
    super.initState();
    _currentTime = _getCurrentTime();
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _currentTime = _getCurrentTime();
      });
    });
  }

  String _getCurrentTime() {
    return DateFormat('HH:mm:ss').format(DateTime.now()); // Formats to only show 'HH:mm:ss'
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }


  List<String> groupVideoCallingImage = [
    "https://images.pexels.com/photos/7956488/pexels-photo-7956488.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/415829/pexels-photo-415829.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2",
    "https://images.pexels.com/photos/774909/pexels-photo-774909.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.scaffoldBgColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Center(
                child: Container(
                  height: 32,
                  width: 72,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(300),
                    border: Border.all(color: colorScheme(context).secondary)
                  ),
                  child: Center(
                    child: Text(_currentTime,style: textTheme(context).labelMedium?.copyWith(color: colorScheme(context).secondary,letterSpacing: 0),),
                  ),
                ),
              ),
              SizedBox(height: 8,),
              Flexible(
                child: GridView.builder(
                  itemCount: 4,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.6,
                    mainAxisSpacing: 10.0, // vertical spacing
                    crossAxisSpacing: 15.0, // horizontal spacing
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: colorScheme(context).onPrimary,width: 4),
                        color: Color(0XFFD9D9D9),
                        borderRadius: BorderRadius.circular(16),
                        image: DecorationImage(image: CachedNetworkImageProvider(
                          groupVideoCallingImage[index],
                        ),
                        fit: BoxFit.cover
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0,left: 5),
                            child: GestureDetector(
                              onTap: (){
                                setState(() {
                                  isMacIcon[index] =! isMacIcon[index];
                                });
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: colorScheme(context).onPrimary,
                                  shape: BoxShape.circle
                                ),
                                child: Center(child: isMacIcon[index] ? SvgPicture.asset(AppIcons.macSVg,width: 15,height: 15,) : Icon(Icons.mic)),
                              ),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: (){
                      context.pushNamed(AppRoute.addUserToJoinCallPage);
                    },
                    child: CircleAvatar(
                      radius: 25,
                                  backgroundColor: colorScheme(context).onPrimary,
                      child: SvgPicture.asset(AppIcons.addUserSVg),
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      showLeaveCallBottomSheet(context);
                    },
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: colorScheme(context).primary.withOpacity(0.4),
                      child: CircleAvatar(
                        radius: 24,
                        backgroundColor: colorScheme(context).primary,
                        child: SvgPicture.asset(AppIcons.phonesSVg),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      if (mac) {
                        Fluttertoast.showToast(
                          msg: "🔇 You are muted, please unmute to talk.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM, 
                          timeInSecForIosWeb: 1,
                          backgroundColor: colorScheme(context).onPrimary,
                          textColor: colorScheme(context).secondary,
                          fontSize: 12.0,
                        );
                      }
                      setState(() {
                        mac = !mac;
                      });
                    },
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: mac ? colorScheme(context).onPrimary : colorScheme(context).secondary,
                      child: SvgPicture.asset(
                        AppIcons.macSVg,
                        color: mac ? colorScheme(context).secondary : colorScheme(context).onPrimary,
                      ),
                    ),
                  ),
        
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  void showLeaveCallBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 70,
              decoration: BoxDecoration(
                color: Colors.transparent,
              ),
              child: Padding(
                padding: const EdgeInsets.only(right: 15.0),
                child: GestureDetector(
                  onTap: (){
                    context.pop();
                  },
                  child: CircleAvatar(
                    backgroundColor: colorScheme(context).onPrimary,
                    child: Icon(Icons.close,color: colorScheme(context).onSurface,),
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(16.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(
                  top: Radius.circular(24.0),
                ),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: AssetImage(AppImages.bottamImage),
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Are You Sure?",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    "Hang up on group video call? Please make sure all goods before hanging up on video call.",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                      // Add your leave video call logic here
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme(context).primary,
                      minimumSize: Size(double.infinity, 48),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: Text(
                      "Leave Group Video Call",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  SizedBox(height: 8),
                  TextButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text(
                      "Cancel",
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
