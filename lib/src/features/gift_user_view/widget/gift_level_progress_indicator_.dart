import 'package:flutter/material.dart';

class GiftProgressIndicator extends StatelessWidget {
  final int currentLevel = 1;
  final int currentExp = 3350;
  final int maxExp = 5000;

  @override
  Widget build(BuildContext context) {
    double progress = currentExp / maxExp;

    return Scaffold(
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [
                // Experience Progress Bar
                ClipRRect(
                  borderRadius: BorderRadius.horizontal(
                      left: Radius.circular(30)), //BorderRadius.circular(20),
                  child: LinearProgressIndicator(
                    value: progress,
                    minHeight: 10,
                    backgroundColor: Colors.grey[300],
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.amber),
                  ),
                ),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text(
                //       "Lv.$currentLevel",
                //       style: TextStyle(color: Colors.grey),
                //     ),
                //     Text(
                //       "EXP $currentExp/$maxExp",
                //       style: TextStyle(color: Colors.grey),
                //     ),
                //   ],
                // ),
              ],
            ),
            // Icon Circle on the right side
            // Positioned(
            //   right: 0,
            //   child: Container(
            //     padding: EdgeInsets.all(6),
            //     decoration: BoxDecoration(
            //       shape: BoxShape.circle,
            //       border:
            //           Border.all(color: Colors.yellowAccent, width: 2),
            //     ),
            //     child: Icon(
            //       Icons.card_giftcard,
            //       color: Colors.purple,
            //       size: 24,
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
