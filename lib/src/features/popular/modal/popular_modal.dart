import 'package:flutter/material.dart';

class PopularItem {
  final String imageUrl;
  final String title;
  final String views;
  final String status;
  final VoidCallback ontap;

  PopularItem({
    required this.ontap,
    required this.imageUrl,
    required this.title,
    required this.views,
    required this.status,
  });
}

class CheckInData {
  final int checkedInDays;
  final List<GiftItem> gifts;

  CheckInData({
    required this.checkedInDays,
    required this.gifts,
  });
}

class GiftItem {
  final String image;
  final int count;

  GiftItem({
    required this.image,
    required this.count,
  });
}
