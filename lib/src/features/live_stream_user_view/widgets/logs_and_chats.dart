import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../common/const/app_colors.dart';
import '../../../common/const/app_images.dart';
import '../../../common/const/global_variables.dart';
import '../../audio_live/pages/live_audio_chat_expanded/model/model.dart';

class LogsAndChat extends StatelessWidget {
  const LogsAndChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: messages.length,
        itemBuilder: (context, index) {
          final message = messages[index];
          return Align(
            alignment: Alignment.centerLeft,
            child: Container(
              padding: const EdgeInsets.all(4),
              margin: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                  color: message.isSpecialEvent
                      ? colorScheme(context).primary
                      : AppColor.surfaceGrey.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(8)),
              child: Wrap(children: [
                SvgPicture.asset(
                  message.isSpecialEvent ? AppIcons.gift : AppIcons.starBlue,
                ),
                const SizedBox(width: 4),
                if (!message.isSpecialEvent)
                  Text(message.username,
                      style: textTheme(context).labelSmall?.copyWith(
                          color: AppColor.appYellow,
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          letterSpacing: 0)),
                const SizedBox(width: 4),
                Text(
                  message.message,
                  style: textTheme(context).labelSmall?.copyWith(
                      fontSize: 10,
                      letterSpacing: 0,
                      color: colorScheme(context).onPrimary),
                ),
                const SizedBox(
                  width: 2,
                ),
                if (message.isSpecialEvent)
                  Icon(
                    Icons.arrow_forward_ios_rounded,
                    size: 16,
                    color: colorScheme(context).onPrimary,
                  )
              ]),
            ),
          );
        },
      ),
    );
  }
}
