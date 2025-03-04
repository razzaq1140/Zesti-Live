class CountryModel {
  final String countryName;
  final String? countryCode;
  final String imageAsset;
  final String? local;

  CountryModel(
      {required this.countryName,
      this.countryCode,
      required this.imageAsset,
      this.local});

  factory CountryModel.fromJson(Map<String, dynamic> json) {
    return CountryModel(
      countryName: json['countryName'],
      countryCode: json['countryCode'],
      imageAsset: json['imageAsset'],
      local: json['local'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'countryName': countryName,
      'countryCode': countryCode,
      'imageAsset': imageAsset,
      'local': local,
    };
  }
}
