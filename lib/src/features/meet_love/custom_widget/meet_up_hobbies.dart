import 'package:flutter/material.dart' ;
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/meetup_model/meet_up_model.dart';



class MeetUpHobbies extends StatelessWidget {
  final MeetUpModel meetupModel ;
  final double? width ;
  const MeetUpHobbies({super.key, this.width, required this.meetupModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: width?? 71,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20) ,  color: meetupModel.interestColor,
      ),
      child: Center(
        child: Text(meetupModel.interestName??'',style: textTheme(context).bodySmall?.copyWith(
          fontSize: 10,fontWeight: FontWeight.w600,color: colorScheme(context).surface
        ),),
      ),
    );
  }
}
