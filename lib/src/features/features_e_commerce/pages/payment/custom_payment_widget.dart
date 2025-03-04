import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

import '../../../../common/const/app_colors.dart';

class CustomDetails extends StatelessWidget {
  final String name ;
  final String address ;
  final String city ;
  final String country ;
  final int contact ;
  const CustomDetails({super.key, required this.name, required this.city, required this.country, required this.contact, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 185,width: 375,
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.location_on_outlined,size: 15,),
            title: Text('Shipping Address',style: textTheme(context).headlineLarge?.copyWith(
              fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 12,
            ),),
            trailing: TextButton(
              onPressed: (){},
              child: Text("Edit",style: textTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 12,
              ),),
            ),
          ),
          SizedBox(height:20),
          Divider(
            color: AppColor.appBarTitle,

          ),
          Row(
            children : [
              SizedBox(width: 25),
              Text(name,style: textTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 18,
              )),
              SizedBox(height:10),
              Text(address,style: textTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 12,
              ),),
              SizedBox(height: 10,),
              Text(city,style: textTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 12,
              ),),
              SizedBox(height:10),
              Text(country,style: textTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 12,
              ),),
              SizedBox(height:10),
              Text(contact as String,style: textTheme(context).headlineLarge?.copyWith(
                fontWeight: FontWeight.w400 , color: AppColor.appBarTitle , fontSize: 12,
              ),),

            ]
          ),



        ],
      )
    );
  }
}
