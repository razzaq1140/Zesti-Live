import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/svg.dart';


class MenuItem extends StatelessWidget {
  final String title;
  final String svgIconPath;

  const MenuItem({
    Key? key,
    required this.title,
    required this.svgIconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          svgIconPath,
          height: 24,
          width: 24,
        ),
        SizedBox(height: 8),
        Text(
          title,
          style: textTheme(context).bodySmall?.copyWith(
                fontSize: 10,
                color: colorScheme(context).primary,
                fontWeight: FontWeight.w700,
              ),
        ),
      ],
    );
  }
}
