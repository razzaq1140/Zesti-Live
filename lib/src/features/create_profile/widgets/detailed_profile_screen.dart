import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_colors.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/profile_modal.dart';

class DetailedProfileScreen extends StatelessWidget {
  final UserProfile userProfile;

  const DetailedProfileScreen({super.key, required this.userProfile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Date of Birth',
              style: textTheme(context)
                  .bodySmall
                  ?.copyWith(color: AppColor.textGrey),
            ),
            const SizedBox(height: 8),
            Text(
              userProfile.dateOfBirth,
              style: Theme.of(context).textTheme.titleSmall,
            ),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Known languages'),
            const SizedBox(height: 8),
            CustomChipSection(items: userProfile.knownLanguages),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Interests'),
            const SizedBox(height: 8),
            CustomChipSection(items: userProfile.interests),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Skills'),
            const SizedBox(height: 8),
            CustomChipSection(items: userProfile.skills),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Education'),
            const SizedBox(height: 8),
            for (var edu in userProfile.education)
              EducationCareerItem(title: edu.title, dateRange: edu.dateRange),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Career'),
            const SizedBox(height: 8),
            for (var career in userProfile.career)
              EducationCareerItem(
                  title: career.title, dateRange: career.dateRange),
            const SizedBox(height: 24),
            const SectionTitle(title: 'Social Profiles'),
            const SizedBox(height: 8),
            SocialProfilesRow(profiles: userProfile.socialProfiles),
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  final String title;

  const SectionTitle({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleSmall?.copyWith(
            fontWeight: FontWeight.w600,
          ),
    );
  }
}

class CustomChipSection extends StatelessWidget {
  final List<String> items;

  const CustomChipSection({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,
      runSpacing: 8.0,
      children: items.map((item) {
        return Chip(
          backgroundColor: AppColor.surfaceGrey,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
            side: BorderSide(
              color: Theme.of(context).colorScheme.outlineVariant,
            ),
          ),
          label: Text(item),
        );
      }).toList(),
    );
  }
}

class EducationCareerItem extends StatelessWidget {
  final String title;
  final String dateRange;

  const EducationCareerItem(
      {super.key, required this.title, required this.dateRange});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.bodyLarge),
          Text(
            dateRange,
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}

class SocialProfilesRow extends StatelessWidget {
  final List<SocialProfile> profiles;

  const SocialProfilesRow({super.key, required this.profiles});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: profiles.map((profile) {
        return CustomSocialIcon(imagePath: profile.imageUrl);
      }).toList(),
    );
  }
}

class CustomSocialIcon extends StatelessWidget {
  final String imagePath;

  const CustomSocialIcon({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: 20,
      backgroundImage: AssetImage(imagePath),
    );
  }
}
