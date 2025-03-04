import 'package:flutter/material.dart';
import 'package:flutter_application_zestilive/src/features/youtube_bottom_sheet/model/youtube_post_model.dart';

class YoutubeSheetProvider with ChangeNotifier {
  int _tapBarIndex = 1;

  int get tapBarIndex => _tapBarIndex;
  void tapBarIndexSelected(index) {
    _tapBarIndex = index;
    notifyListeners();
  }

  // List<YoutubePostModel> _filterPostList = [];
  // List<YoutubePostModel> get filterPostList => _filterPostList;

  // void searchPost(p0) {
  //   List<YoutubePostModel> results = [];
  //   if (p0.isEmpty) {
  //     results = postList;
  //   } else {
  //     results = postList
  //         .where((e) => e.imageTitle.toLowerCase().contains(p0.toLowerCase()))
  //         .toList();
  //   }

  //   _filterPostList = results;
  //   notifyListeners();
  // }
  void initializePostList() {
    _filterPostList = postList;
    notifyListeners();
  }

  List<YoutubePostModel> _filterPostList = [];
  List<YoutubePostModel> get filterPostList => _filterPostList;
  void searchPost(String query) {
    List<YoutubePostModel> results = [];
    if (query.isEmpty) {
      // If the query is empty, show the full list
      results = postList;
    } else {
      // Otherwise, filter the list based on the query
      results = postList
          .where(
              (e) => e.imageTitle.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    _filterPostList = results;
    notifyListeners();
  }
}
