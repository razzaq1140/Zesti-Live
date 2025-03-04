import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/post_section/pages/moment_screen/pages/report_post/model/report_model.dart';
import 'package:go_router/go_router.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colorScheme(context).primary,
        iconTheme: IconThemeData(color: colorScheme(context).onPrimary),
        title: Text(
          "Report",
          style: textTheme(context).titleSmall?.copyWith(
              fontWeight: FontWeight.bold,
              color: colorScheme(context).onPrimary),
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                "Choose a reason for reporting this post:",
                style: textTheme(context)
                    .titleSmall
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
            ),
            Expanded(
                child: ListView.builder(
              itemCount: reportList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    context.pop();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: AppColor.textGrey.withOpacity(0.15))),
                    height: 80,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(reportList[index].text!),
                        reportList[index].icon!
                      ],
                    ),
                  ),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}
