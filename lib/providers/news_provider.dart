import 'package:flutter/material.dart';
import 'package:news_app/models/news_article.dart';
import 'package:news_app/services/news_service.dart';

class NewsProvider extends ChangeNotifier {
  List<NewsArticle> articles = [];
  bool isLoading = false;
  String? error;

  Future<void> fetchNews() async {
    try {
      isLoading = true;
      notifyListeners();

      articles = await NewsService.fetchTopHeadlines();
      error = null;
    } catch (e) {
      error = e.toString();
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
