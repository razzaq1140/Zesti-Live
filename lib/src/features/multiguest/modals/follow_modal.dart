
class MultiguestGridFollow {

  final String views;
  final String imageUrl;
  final String tag;
  final String trendcaption;

  MultiguestGridFollow({
    required this.trendcaption,

    required this.imageUrl,
    required this.views,
    required this.tag,
  });
}

class MultiguestFollowList {
  final String profiletitle;
  final String profilecaption;
  final String profilephoto;  final String timestamp;


  MultiguestFollowList({
    required this.profiletitle,
    required this.profilecaption,
    required this.profilephoto,  required this.timestamp,

  });
}
class MultiguestHeader{  final List<String> avatarUrls;
  final String onlineUsersText;MultiguestHeader( {required this.avatarUrls,required this.onlineUsersText,});}