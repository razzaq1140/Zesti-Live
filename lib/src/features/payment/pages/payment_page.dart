import 'package:flutter/material.dart' ;
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';

void main(){
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: PaymentPage(),
  ));
}

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key});

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.paymentPageBg,
      appBar: AppBar(
        backgroundColor: colorScheme(context).surface,
        toolbarHeight: 60,
        leading: CircleAvatar(
          backgroundColor: AppColor.leadingIcon,
          child: Icon(Icons.arrow_back_rounded,color: colorScheme(context).surface,),
        ),
        title: Text('Payment',style: textTheme(context).headlineLarge?.copyWith(
          fontWeight: FontWeight.w700 , color: AppColor.appBarTitle , fontSize: 14,
        ),),
        centerTitle: true,
      ),
      body: Column(
        children: [

        ],
      ),
    );
  }
}
