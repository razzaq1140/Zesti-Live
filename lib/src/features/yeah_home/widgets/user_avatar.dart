import 'package:flutter/material.dart';

class UserAvatar extends StatelessWidget {
  final bool isforyou;
  final String profileUrl;

  const UserAvatar(
      {super.key, required this.profileUrl, required this.isforyou});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6),
          child: CircleAvatar(
            radius: 25,
            backgroundImage: NetworkImage(profileUrl),
          ),
        ),
        if (isforyou == true)
          Positioned(
            bottom: 0,
            height: 18,
            width: 18,
            child: IconButton.filled(
              style: IconButton.styleFrom(padding: const EdgeInsets.all(0)),
              onPressed: () {},
              icon: const Icon(
                Icons.add,
                size: 15,
              ),
            ),
          ),
      ],
    );
  }
}
