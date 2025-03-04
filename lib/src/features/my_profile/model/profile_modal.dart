class UserProfile {
  final String id;
  final String name;
  final String profilePhoto;
  final int locationtag;
  final int marsTag;
  final int levelTag;

  final String fans;
  final String following;

  final String zircons;
  final String rubies;
  final String description;
  final List<Contribution> contributions;
  final List<ShortVideo> shorts;

  final String dateOfBirth;
  final List<String> knownLanguages;
  final List<String> interests;
  final List<String> skills;
  final List<EducationCareer> education;
  final List<EducationCareer> career;
  final List<SocialProfile> socialProfiles;

  UserProfile({
    required this.locationtag,
    required this.marsTag,
    required this.levelTag,
    required this.id,
    required this.name,
    required this.profilePhoto,
    required this.fans,
    required this.following,
    required this.zircons,
    required this.rubies,
    required this.description,
    required this.contributions,
    // required this.moments,
    required this.shorts,
    required this.dateOfBirth,
    required this.knownLanguages,
    required this.interests,
    required this.skills,
    required this.education,
    required this.career,
    required this.socialProfiles,
  });
}

class Contribution {
  final String type;
  final String imageUrl;

  Contribution({
    required this.type,
    required this.imageUrl,
  });
}



class ShortVideo {
  final String thumbnail;
  final String views;

  ShortVideo({
    required this.thumbnail,
    required this.views,
  });
}

class EducationCareer {
  final String title;
  final String dateRange;

  EducationCareer({
    required this.title,
    required this.dateRange,
  });
}

class SocialProfile {
  final String platformName;
  final String imageUrl;

  SocialProfile({
    required this.platformName,
    required this.imageUrl,
  });
}
