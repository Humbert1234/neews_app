import 'package:flutter/material.dart';

class NewsProvider extends ChangeNotifier {
  List<String> newsItems = ['News 1', 'News 2', 'News 3'];

  void addNews(String news) {
    newsItems.add(news);
    notifyListeners();
  }
}
