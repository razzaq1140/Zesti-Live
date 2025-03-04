import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/features/my_profile/model/profile_modal.dart';

// You can define a function to return a default user profile
UserProfile getDefaultUserProfile() {
  return UserProfile(
    locationtag: 20,
    levelTag: 30,
    marsTag: 40,
    id: '01251421',
    name: 'Akshay Syal',
    profilePhoto: AppImages.profilePhoto,
    fans: '130M',
    following: '260k',
    zircons: '450',
    rubies: '230',
    description:
        'One day I woke up and realized I was not made for anyone. I was made for me.',
    contributions: [
      Contribution(type: 'Platinum', imageUrl: AppImages.profilePlatinum),
      Contribution(type: 'Gold', imageUrl: AppImages.profileGold),
    ],
    shorts: [
      ShortVideo(thumbnail: AppImages.videoCard, views: '1.2K'),
    ],
    dateOfBirth: '11 Oct 1988',
    knownLanguages: ['Hindi', 'English'],
    interests: ['Singing', 'Traveling', 'Dancing'],
    skills: ['UX Research', 'Prototyping', 'Coding'],
    education: [
      EducationCareer(
          title: 'Institute of Engineering, Delhi', dateRange: '2004-2008'),
    ],
    career: [
      EducationCareer(
          title: 'CEO, Bams Technologies', dateRange: 'Feb 2019 - Present'),
    ],
    socialProfiles: [
      SocialProfile(platformName: 'Facebook', imageUrl: AppImages.facebook),
      SocialProfile(platformName: 'Instagram', imageUrl: AppImages.insta),
      SocialProfile(platformName: 'Linkedin', imageUrl: AppImages.linkedin),
      SocialProfile(platformName: 'Pinterest', imageUrl: AppImages.pintrest),
    ],
  );
}
