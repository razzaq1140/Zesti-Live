import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/common/widgets/custom_button.dart';
import 'package:flutter_application_zestilive/src/router/go_route.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../multi_guest_live/provider/multi_guest_create_room_provider.dart';

class MultiGuestCreateRoom extends StatelessWidget {


  const MultiGuestCreateRoom({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<MultiGuestCreateRoomProvider>(context);

    return Scaffold(
      backgroundColor: colorScheme(context).primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10),
                    child: _buildHeader(context),
                  ),
                  const SizedBox(height: 5),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: _buildContentCard(context, provider),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    color: colorScheme(context).surface,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _buildSlotsGrid(context),
                        const SizedBox(height: 20),
                        _buildSlotsSection(context, provider),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Row(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: colorScheme(context)
                                        .outline
                                        .withOpacity(0.3),
                                  ),
                                  shape: BoxShape.circle,
                                ),
                                child: Image.asset(AppImages.girlImage,
                                    height: 50),
                              ),
                              const SizedBox(width: 14),
                              Expanded(
                                child: CustomButton(
                                  width: double.infinity,
                                  buttonText: 'Go Live',
                                  onPressed: () {
                                    context.pushNamed(AppRoute.multiGuestLive);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 15),
                        _buildFooterNavigation(),
                        const SizedBox(height: 30),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
  Widget _buildHeader(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            color: colorScheme(context).outline.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(5.0),
          child: Row(
            children: [
              Text(
                'Set Room announcement',
                style: textTheme(context).bodySmall?.copyWith(
                      color: colorScheme(context).surface,
                      fontWeight: FontWeight.w600,
                    ),
              ),
              Icon(
                Icons.keyboard_arrow_right,
                color: colorScheme(context).surface,
              ),
            ],
          ),
        ),
        _buildCircleIcon(
          context,
          icon: Icons.close,
          onTap: () {
            context.pop();
          },
        ),
      ],
    );
  }

  Widget _buildContentCard(
      BuildContext context, MultiGuestCreateRoomProvider provider) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme(context).outline.withOpacity(0.3),
        borderRadius: BorderRadius.circular(16.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                _buildProfileImage(context),
                const SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Add a title to chat',
                        style: textTheme(context).titleMedium?.copyWith(
                            color: colorScheme(context).surface, fontSize: 15),
                      ),
                      Row(
                        children: [
                          Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            decoration: BoxDecoration(
                              color:
                                  colorScheme(context).outline.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: provider.visibilityStatus,
                                dropdownColor: colorScheme(context)
                                    .primary
                                    .withOpacity(0.9),
                                items: <String>['Public', 'Private']
                                    .map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Row(
                                      children: [
                                        Icon(
                                          value == 'Public'
                                              ? Icons.groups_2_outlined
                                              : Icons.lock_outline,
                                          color: colorScheme(context).surface,
                                          size: 15,
                                        ),
                                        const SizedBox(width: 2),
                                        Text(
                                          value,
                                          style: textTheme(context)
                                              .bodyMedium
                                              ?.copyWith(
                                                  color: colorScheme(context)
                                                      .surface,
                                                  fontSize: 11),
                                        ),
                                      ],
                                    ),
                                  );
                                }).toList(),
                                onChanged: provider.updateVisibilityStatus,
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: colorScheme(context).surface,
                                  size: 15,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 7),
                          GestureDetector(
                            onTap: provider.toggleCamera,
                            child: Container(
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                color: colorScheme(context)
                                    .outline
                                    .withOpacity(0.3),
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                provider.isCameraOn
                                    ? Icons.camera_alt_outlined
                                    : Icons.no_photography_outlined,
                                color: colorScheme(context).surface,
                                size: 18,
                              ),
                            ),
                          ),
                          Spacer(),
                          DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              value: provider.selectedTag,
                              hint: Text(
                                'Select tag',
                                style: textTheme(context).bodyMedium?.copyWith(
                                      color: colorScheme(context).surface,
                                    ),
                              ),
                              padding: EdgeInsets.only(right: 2),
                              dropdownColor:
                                  colorScheme(context).primary.withOpacity(0.9),
                              items: <String>['Tag 1', 'Tag 2', 'Tag 3']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: textTheme(context)
                                        .bodyMedium
                                        ?.copyWith(
                                          color: colorScheme(context).surface,
                                        ),
                                  ),
                                );
                              }).toList(),
                              onChanged: provider.updateSelectedTag,
                              icon: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  SizedBox(width: 8),
                                  Container(
                                    decoration: BoxDecoration(
                                      color: colorScheme(context)
                                          .outline
                                          .withOpacity(0.3),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Icon(
                                      Icons.keyboard_arrow_down,
                                      color: colorScheme(context).surface,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const Divider(),
            _buildShareRow(context),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileImage(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: colorScheme(context).outline.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12.0),
          image: const DecorationImage(
            image: CachedNetworkImageProvider(
              'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  Widget _buildCircleIcon(BuildContext context,
      {required IconData icon, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: colorScheme(context).outline.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        child: Icon(
          icon,
          color: colorScheme(context).surface,
          size: 18,
        ),
      ),
    );
  }

  Widget _buildShareRow(BuildContext context) {
    return Row(
      children: [
        Text(
          'Share to',
          style: textTheme(context).bodySmall?.copyWith(
              color: colorScheme(context).surface,
              fontWeight: FontWeight.w600,
              fontSize: 18),
        ),
        const SizedBox(width: 10),
        _buildSocialIcon(
          context,
          AppIcons.insta,
        ),
        _buildSocialIcon(context, AppIcons.fb),
        _buildSocialIcon(context, AppIcons.whtspp),
        _buildCircleIcon(
          context,
          icon: Icons.more_horiz_outlined,
          onTap: () {},
        ),
      ],
    );
  }

  Widget _buildSocialIcon(BuildContext context, String assetPath) {
    final double paddingValue = assetPath == AppIcons.fb ? 14.0 : 10.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Container(
        decoration: BoxDecoration(
          color: colorScheme(context).outline.withOpacity(0.3),
          shape: BoxShape.circle,
        ),
        padding: EdgeInsets.all(paddingValue),
        child: SvgPicture.asset(
          assetPath,
          height: 20,
        ),
      ),
    );
  }

  Widget _buildSlotsSection(
      BuildContext context, MultiGuestCreateRoomProvider provider) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [3, 4, 6, 9, 12].map((slot) {
            return GestureDetector(
              onTap: () => provider.updateSelectedSlots(slot),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                margin: const EdgeInsets.symmetric(horizontal: 4),
                decoration: BoxDecoration(
                  color: provider.selectedSlots == slot
                      ? colorScheme(context).onSurface
                      : colorScheme(context).outline.withOpacity(0.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.chair_rounded,
                      color: colorScheme(context).primary,
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      '${slot}P',
                      style: TextStyle(
                          color: provider.selectedSlots == slot
                              ? colorScheme(context).surface
                              : colorScheme(context).onSurface),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSlotsGrid(BuildContext context) {
    return SizedBox(
      height: 420,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Flexible(
            flex: 2,
            fit: FlexFit.loose,
            child: _buildMainImage(),
          ),
          const SizedBox(height: 5),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: Row(
              children: [
                Expanded(child: _buildEmptySlot()),
                const SizedBox(width: 5),
                Expanded(child: _buildEmptySlot()),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMainImage() {
    return Container(
      width: double.infinity,
      child: ClipRRect(
        child: CachedNetworkImage(
          imageUrl:
              'https://static.vecteezy.com/system/resources/previews/005/346/410/non_2x/close-up-portrait-of-smiling-handsome-young-caucasian-man-face-looking-at-camera-on-isolated-light-gray-studio-background-photo.jpg',
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildEmptySlot() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
      ),
      child: const Center(
        child: Icon(
          Icons.chair_outlined,
          color: Colors.grey,
          size: 40,
        ),
      ),
    );
  }

  Widget _buildFooterNavigation() {
    String selectedItem = "Multi-guest Live";

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          for (var item in [
            "Multi-guest Live",
            "Live",
            "Audio Live",
            "Game Live"
          ])
            GestureDetector(
              onTap: () {
                // setState(() {
                //   selectedItem = item;
                // });
              },
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 8.0),
                    child: Text(
                      item,
                      style: TextStyle(
                        color: selectedItem == item
                            ? Colors.black
                            : AppColor.greyText,
                        fontWeight: selectedItem == item
                            ? FontWeight.bold
                            : FontWeight.normal,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  if (selectedItem == item)
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: 5,
                        height: 5,
                        decoration: const BoxDecoration(
                          color: Colors.red,
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),
                ],
              ),
            ),
        ],
      ),
    );
  }

