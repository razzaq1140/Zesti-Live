import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class LiveEnd extends StatelessWidget {
  const LiveEnd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: colorScheme(context).onSurface,
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // const SizedBox(height: 90),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Live Quality:",
                    style: textTheme(context).bodyMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: colorScheme(context).onPrimary)),
                const SizedBox(width: 10),
                Icon(
                  Icons.help_outline,
                  size: 20,
                  color: colorScheme(context).onPrimary,
                ),
              ],
            ),
            const SizedBox(height: 10),

            CircleAvatar(
              radius: 40,
              backgroundImage:
                  AssetImage(AppImages.profileDp), // Your profile image path
            ),
            const SizedBox(height: 10),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey.shade800,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: () {},
              child: Text(
                "About Live Quality >",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).onPrimary),
              ),
            ),
            const SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Text("5482",
                        style: textTheme(context).bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary)),
                    Text("Viewers",
                        style: textTheme(context).bodySmall?.copyWith(
                              color: colorScheme(context).onPrimary,
                            )),
                  ],
                ),
                Column(
                  children: [
                    Text("45",
                        style: textTheme(context).bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme(context).onPrimary)),
                    Text("New Fans",
                        style: textTheme(context).bodySmall?.copyWith(
                              color: colorScheme(context).onPrimary,
                            )),
                  ],
                ),
                Column(
                  children: [
                    Text("345",
                        style: textTheme(context).bodyLarge?.copyWith(
                            color: colorScheme(context).onPrimary,
                            fontWeight: FontWeight.bold)),
                    Text("New Jeera",
                        style: textTheme(context).bodySmall?.copyWith(
                              color: colorScheme(context).onPrimary,
                            )),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Progress Card
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: colorScheme(context).surface.withOpacity(0.3),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          SvgPicture.asset(AppIcons.arc),
                          const SizedBox(width: 10),
                          Text("Rookie",
                              style: textTheme(context).bodyMedium?.copyWith(
                                  color: colorScheme(context).onPrimary)),
                        ],
                      ),
                      Text(
                        "About Rules",
                        style: textTheme(context)
                            .bodyMedium
                            ?.copyWith(color: colorScheme(context).onPrimary),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  _buildProgressItem("Daily Task", Colors.grey, "+0", context),
                  const SizedBox(height: 10),
                  _buildProgressItem("Live Time", Colors.orange, "+0", context),
                  const SizedBox(height: 10),
                  _buildProgressItem("Fans Amount", Colors.pink, "+0", context),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Text("Share Achievement to",
                style: textTheme(context)
                    .bodyMedium
                    ?.copyWith(color: colorScheme(context).onPrimary)),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSocialIcon(AppIcons.twc),
                const SizedBox(width: 20),
                _buildSocialIcon(AppIcons.instagramcolor),
                const SizedBox(width: 20),
                _buildSocialIcon(AppIcons.user1),
              ],
            ),
            const SizedBox(height: 40),
            // Back Button
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                  side: BorderSide(color: colorScheme(context).onPrimary),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
              ),
              onPressed: () {
                context.pop();
              },
              child: Text("Back",
                  style: textTheme(context)
                      .bodyLarge
                      ?.copyWith(color: colorScheme(context).onPrimary)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSocialIcon(String assetPath) {
    return SvgPicture.asset(
      assetPath,
      height: 25,
      width: 25,
    );
  }

  Widget _buildProgressItem(
      String label, Color color, String value, BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(label,
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context).onPrimary,
                    fontWeight: FontWeight.bold)),
            Text(value,
                style: textTheme(context).bodyMedium?.copyWith(
                    color: colorScheme(context).onPrimary,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        const SizedBox(height: 8),
        LinearProgressIndicator(
          value: 0.5,
          backgroundColor: colorScheme(context).onPrimary,
          color: color,
        ),
      ],
    );
  }
}
