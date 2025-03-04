import 'package:flutter/material.dart';

class MeetUpModel {
  final String? meetUpName;
  final String? meetUpAddress;
  final Widget? meetUpImage;
  final Color? interestColor;
  final String? interestName;
  final bool? verified ;
  MeetUpModel({ this.meetUpName, this.verified,
    this.meetUpAddress, this.meetUpImage,this.interestColor, this.interestName, }); // Image or other widget

}