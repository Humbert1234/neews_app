import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:news_app/models/news_article.dart';

class NewsService {
  static const String baseUrl = 'https://newsapi.org/v2';
  static const String apiKey = '75cbce3d20d6457c96ac88be10c59c40';

  static Future<List<NewsArticle>> fetchTopHeadlines() async {
    final response = await http.get(
      Uri.parse('$baseUrl/top-headlines?country=us&apiKey=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final articles = data['articles'] as List;
      return articles.map((article) => NewsArticle.fromJson(article)).toList();
    } else {
      throw Exception('Failed to load news articles');
    }
  }
}
