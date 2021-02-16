import 'package:intl/intl.dart';
import 'package:news_app/Models/NewsArticle.dart';

class NewsVM {
  NewsArticle _newsArticle;

  NewsVM({NewsArticle article}) : _newsArticle = article;

  String get title {
    return _newsArticle.title;
  }

  String get author {
    return _newsArticle.author;
  }

  String get url {
    return _newsArticle.url;
  }

  String get imageUrl {
    return _newsArticle.urlToImage;
  }

  String get description {
    return _newsArticle.description;
  }

  String get content {
    return _newsArticle.content;
  }

  String get publishedAt {
    final dateTime = DateFormat('yyyy-MM-ddTHH:mm:ssZ')
        .parse(_newsArticle.publishedAt, true);
    return DateFormat.yMMMMEEEEd('en-us').format(dateTime).toString();
  }
}
