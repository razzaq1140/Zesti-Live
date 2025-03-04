import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:go_router/go_router.dart';
import '../../../common/const/app_images.dart';

class FirstDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('1 Ruby to kiss Broadcaster',
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text('You may receive premium rewards as follows',
                    textAlign: TextAlign.center,
                    style: textTheme(context).bodySmall?.copyWith(
                        color:
                            colorScheme(context).onSurface.withOpacity(0.5))),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(AppImages.teddy),
                    Image.asset(AppImages.teddy),
                    Image.asset(AppImages.teddy),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme(context).primary,
                    ),
                    onPressed: () {
                      context.pop();
                      SecondDialog.show(context);
                    },
                    child: Text('Recharge to Get',
                        style: textTheme(context).bodyMedium?.copyWith(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 40),
                Text('The minimum amount is 41 Ruby for every Ruby recharge',
                    textAlign: TextAlign.center,
                    style: textTheme(context).labelMedium?.copyWith(
                        color:
                            colorScheme(context).onSurface.withOpacity(0.5))),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SecondDialog {
  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Insufficient Balance',
                    style: textTheme(context)
                        .titleSmall
                        ?.copyWith(fontWeight: FontWeight.w700)),
                const SizedBox(height: 8),
                Text(
                    'To recharge for the first time you will have the chance to get extraordinary gift package worth 10000 diamonds.Only one chance!',
                    textAlign: TextAlign.center,
                    style: textTheme(context).bodySmall?.copyWith(
                        color:
                            colorScheme(context).onSurface.withOpacity(0.5))),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Image.asset(AppImages.teddy),
                    Image.asset(AppImages.teddy),
                    Image.asset(AppImages.teddy),
                  ],
                ),
                const SizedBox(height: 40),
                SizedBox(
                  width: 300,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorScheme(context).primary,
                    ),
                    onPressed: () {
                      context.pop();
                    },
                    child: Text('Recharge to Get Rewards',
                        style: textTheme(context).bodySmall?.copyWith(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.w600)),
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: 300,
                  child: OutlinedButton(
                      style: OutlinedButton.styleFrom(
                          side:
                              BorderSide(color: colorScheme(context).primary)),
                      onPressed: () {},
                      child: Text('More Details >>',
                          style: textTheme(context).bodyMedium?.copyWith(
                              color: colorScheme(context).primary,
                              fontWeight: FontWeight.w600))),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
