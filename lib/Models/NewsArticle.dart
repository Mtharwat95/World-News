import 'package:news_app/Utils/Constants.dart';

class NewsArticle {
  final String title;
  final String author;
  final String description;
  final String urlToImage;
  final String url;
  final String publishedAt;
  final String content;

  NewsArticle(
      {this.title,
      this.author,
      this.description,
      this.urlToImage,
      this.url,
      this.publishedAt,
      this.content});

  factory NewsArticle.fromJson(Map<String, dynamic> json) {
    return NewsArticle(
        title: json[Constants.ArticleTitle],
        author: json[Constants.ArticleAuthor],
        description: json[Constants.ArticleDescription],
        urlToImage: json[Constants.ArticleImageUrl],
        url: json[Constants.ArticleUrl],
        publishedAt: json[Constants.ArticlePublishedAt],
        content: json[Constants.ArticleContent]);
  }
}
