import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/common/const/app_images.dart';
import 'package:flutter_application_zestilive/src/common/const/global_variables.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/custom_widget/meet_up.dart';
import 'package:flutter_application_zestilive/src/features/meet_love/meetup_model/meet_up_model.dart';

final List<MeetUpModel> swipItems = [
  MeetUpModel(
    meetUpName: 'Hania xyz',
    meetUpAddress: 'America',
    meetUpImage: _buildCachedImage(AppNetworkImages.networkSwipe1),
    verified: true,
  ),
  MeetUpModel(
    meetUpName: 'Claudia Agneta, 23',
    meetUpAddress: 'Paris, France',
    meetUpImage: _buildCachedImage(AppNetworkImages.networkSwipe2),
    verified: true,
  ),
  MeetUpModel(
    meetUpName: 'Bulma Corps',
    meetUpAddress: 'Japan, Tokyo',
    meetUpImage: _buildCachedImage(AppNetworkImages.networkSwipe3),
    verified: false, // Not verified
  ),
  MeetUpModel(
    meetUpName: 'Emma Holland',
    meetUpAddress: 'United Kingdom',
    meetUpImage: _buildCachedImage(AppNetworkImages.networkSwipe4),
    verified: true,
  ),
  MeetUpModel(
    meetUpName: 'Emily Potter',
    meetUpAddress: 'Paris, France',
    meetUpImage: _buildCachedImage(AppNetworkImages.networkSwipe5),
    verified: false, // Not verified
  ),
  MeetUpModel(
    meetUpName: 'Violet Evergarden',
    meetUpAddress: 'Germany',
    meetUpImage: _buildCachedImage(AppNetworkImages.networkSwipe6),
    verified: true,
  ),
];

CachedNetworkImage _buildCachedImage(String imageUrl) {
  return CachedNetworkImage(
    imageUrl: imageUrl,
    errorWidget: (context, url, error) =>
        Icon(Icons.image, size: 50, color: colorScheme(context).outlineVariant),
    fit: BoxFit.cover,
  );
}