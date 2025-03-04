import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/widgets/logs_and_chats.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/const/app_images.dart';

class ChatandcirclesWidgets extends StatelessWidget {
  const ChatandcirclesWidgets({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
            children: List.generate(12, (index) {
              return SizedBox(
                height: height * 0.05,
                width: width * 0.08,
                child: SvgPicture.asset(AppIcons.smallCircle),
              );
            }),
          ),
          const Spacer(),
          const LogsAndChat(),
          const SizedBox(
            height: 70,
          )
        ],
      ),
    );
  }
}
