import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/profile_modal.dart';

class ShortsScreen extends StatelessWidget {
  final List<ShortVideo> shorts; 

  const ShortsScreen({super.key, required this.shorts});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 9 / 16,
        ),
        itemCount: shorts.length, 
        itemBuilder: (context, index) {
          final short = shorts[index]; 
          return GestureDetector(
            onTap: () {},
            child: Stack(
              children: [
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Theme.of(context).colorScheme.outlineVariant),
                    image: DecorationImage(
                      image: AssetImage(short
                          .thumbnail), 
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Icon(Icons.play_arrow_rounded,
                            color: Theme.of(context).colorScheme.surface),
                        const SizedBox(width: 4),
                        Text(short.views,
                            style: TextStyle(
                                color: Theme.of(context).colorScheme.surface,
                                fontSize: 12)),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
