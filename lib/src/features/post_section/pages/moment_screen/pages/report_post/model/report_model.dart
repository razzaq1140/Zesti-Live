import 'package:flutter/material.dart';

class ReportModel {
  String? text;
  Icon? icon;
  ReportModel({required this.text, required this.icon});
}

List<ReportModel> reportList = [
  ReportModel(text: "I just don't like it", icon: Icon(Icons.chevron_right)),
  ReportModel(text: "Nudity or pornography", icon: Icon(Icons.chevron_right)),
  ReportModel(text: "Hate speech or symbols", icon: Icon(Icons.chevron_right)),
  ReportModel(
      text: "Violence or threat of violence", icon: Icon(Icons.chevron_right)),
  ReportModel(
      text: "Sale or promotion of firearms", icon: Icon(Icons.chevron_right)),
  ReportModel(
      text: "Sale or promotion of drugs", icon: Icon(Icons.chevron_right)),
  ReportModel(text: "Harassment or bullying", icon: Icon(Icons.chevron_right)),
  ReportModel(text: "Self injury", icon: Icon(Icons.chevron_right)),
];
