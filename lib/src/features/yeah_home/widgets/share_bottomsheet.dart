import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/yeah_home/providers/share_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../../common/const/global_variables.dart';

class ShareButton extends StatelessWidget {
  const ShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ShareProvider>(
      builder: (context, shareProvider, child) {
        return GestureDetector(
          onTap: () => shareProvider.shareVideo("https://youtu.be/VYUPMFu4fR8"),
          child: Column(
            children: [
              SvgPicture.asset(AppIcons.shareIcon, height: 34),
              Text('Share',
                  style: textTheme(context)
                      .bodyMedium
                      ?.copyWith(color: colorScheme(context).onPrimary)),
            ],
          ),
        );
      },
    );
  }
}
