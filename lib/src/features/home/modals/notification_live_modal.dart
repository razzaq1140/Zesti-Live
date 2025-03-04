

class LiveUser {
  final String image;
  final String imagetwo;

  final String name;
  final String location;
  // final String? recommendedByImage; // Null if not recommended
  final String? recommendedByName; // Null if not recommended
  final bool isRecommended; // Whether user is recommended
  final bool isWaveVisible; // Whether wave (activity) icon is visible
  final String time;

  LiveUser({
    required this.time,
    required this.image,
    required this.imagetwo,
    required this.name,
    required this.location,
    // this.recommendedByImage,
    this.recommendedByName,
    required this.isRecommended,
    required this.isWaveVisible,
  });
}

List<LiveUser> liveUsers = [
  LiveUser(
      image:
          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
      imagetwo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s",
      name: "Cute Angel",
      location: "In Space",
      recommendedByName: "Aarohi",
      isRecommended: true,
      isWaveVisible: false,
      time: "1h14m"),
  LiveUser(
      image:
          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
      imagetwo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s",
      name: "Rocky Rock",
      location: "In Space",
      recommendedByName: null,
      isRecommended: false,
      isWaveVisible: true,
      time: "1h14m"),
  LiveUser(
      image:
          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
      imagetwo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s",
      name: "Sweet Smile",
      location: "In Space",
      recommendedByName: "Rahul",
      isRecommended: true,
      isWaveVisible: false,
      time: "1h14m"),
  LiveUser(
      image:
          "https://media.sproutsocial.com/uploads/2022/06/profile-picture.jpeg",
      imagetwo:
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRvPjv1lHEIpzgDk_e3Sm-e4EVOzggYdb5aHA&s",
      name: "Golden Heart",
      location: "In Space",
      recommendedByName: null,
      isRecommended: false,
      isWaveVisible: true,
      time: "1h14m"),
];
