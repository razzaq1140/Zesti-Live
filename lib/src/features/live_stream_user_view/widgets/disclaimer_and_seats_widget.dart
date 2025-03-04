import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/live_stream_user_view/provider/invitefriendsprovider.dart';
import 'package:provider/provider.dart';
import 'add_person_bottomsheet.dart';

class DisclaimerAndSeatsWidget extends StatelessWidget {
  const DisclaimerAndSeatsWidget({
    super.key,
    required this.height,
    required this.width,
  });
  final double height;
  final double width;
  @override
  Widget build(BuildContext context) {
    final avatarImages =
        Provider.of<Invitefriendsprovider>(context).avatarImages;
    return Column(
      children: [
        const SizedBox(height: 8),
        SizedBox(
          height: height * 0.3,
          width: width,
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 30.0,
              mainAxisSpacing: 20.0,
            ),
            itemCount: avatarImages.length,
            itemBuilder: (context, index) {
              final imageUrl = avatarImages[index];
              return Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      if (imageUrl == null) {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) => const AddPersonBottomSheet(),
                        );
                      }
                    },
                    child: Container(
                      height: height * 0.07,
                      width: width * 0.1,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: imageUrl != null
                            ? DecorationImage(
                                image: NetworkImage(imageUrl),
                                fit: BoxFit.cover,
                              )
                            : null,
                        border: Border.all(
                            color: Theme.of(context).colorScheme.surface),
                      ),
                      child: imageUrl == null
                          ? Center(
                              child: Icon(Icons.add,
                                  color: Theme.of(context).colorScheme.surface),
                            )
                          : null,
                    ),
                  ),
                  Text(
                    "${index + 1}",
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: Theme.of(context).colorScheme.onPrimary),
                  ),
                ],
              );
            },
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Text(
            'We moderate Live Broadcasts. Smoking, Vulgarity, Porn, indecent exposure, or '
            'Any copyright infringement is NOT allowed and will be banned. Live broadcasts '
            'are monitored 24 hours a day.\n'
            'Warning: Third-party Top-UP or Recharge is subject to account closure, suspension, '
            'or permanent ban.',
            textAlign: TextAlign.start,
            style: textTheme(context).bodySmall?.copyWith(
                  color: colorScheme(context).onPrimary,
                ),
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
