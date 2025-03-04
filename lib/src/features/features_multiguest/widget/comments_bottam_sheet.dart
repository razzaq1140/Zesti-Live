import 'package:flutter/material.dart';

void showCustomBottomSheet(BuildContext context) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: Colors.transparent,
    builder: (context) {
      return DraggableScrollableSheet(
        initialChildSize: 0.5,
        minChildSize: 0.3,
        maxChildSize: 0.8,
        builder: (_, controller) {
          return Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            child: Column(
              children: [
                // Chat Messages List
                Expanded(
                  child: ListView.builder(
                    controller: controller,
                    itemCount: 10, // Adjust the item count as needed
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return _buildRedChatMessage(
                            "The broadcaster invites you to join a PK",
                            context);
                      } else {
                        return _buildNormalChatMessage("User joined the LIVE",
                            "https://via.placeholder.com/40");
                      }
                    },
                  ),
                ),
                const SizedBox(height: 10),
                // Bottom Icon Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildBottomIcon(Icons.star, "Star"),
                    _buildBottomIcon(Icons.mic, "Mic"),
                    _buildBottomIcon(Icons.menu, "Menu"),
                    _buildBottomIcon(Icons.card_giftcard, "Gift"),
                  ],
                ),
              ],
            ),
          );
        },
      );
    },
  );
}

Widget _buildRedChatMessage(String text, BuildContext context) {
  return Container(
    margin: const EdgeInsets.symmetric(vertical: 4),
    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    decoration: BoxDecoration(
      color: Colors.redAccent,
      borderRadius: BorderRadius.circular(20),
    ),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        const CircleAvatar(
          backgroundImage: NetworkImage(
            'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
          ),
          radius: 12,
        ),
        const SizedBox(width: 8),
        Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 14),
        ),
        const SizedBox(width: 8),
        const Icon(Icons.close, color: Colors.white, size: 16),
      ],
    ),
  );
}

Widget _buildNormalChatMessage(String text, String avatarUrl) {
  return Row(
    children: [
      CircleAvatar(
        backgroundImage: NetworkImage(avatarUrl),
        radius: 14,
      ),
      const SizedBox(width: 8),
      Text(
        text,
        style: const TextStyle(color: Colors.black, fontSize: 14),
      ),
    ],
  );
}

Widget _buildBottomIcon(IconData icon, String label) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(icon, color: Colors.redAccent, size: 28),
      const SizedBox(height: 4),
      Text(
        label,
        style: const TextStyle(color: Colors.redAccent, fontSize: 12),
      ),
    ],
  );
}
