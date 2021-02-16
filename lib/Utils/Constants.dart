import 'dart:ui';

class Constants {
  static const Api_Key = '77b93379c62f4a6984b4ac0420f44064';
  static const End_Point = 'https://newsapi.org/v2/top-headlines?';
  static const Main_News =
      'https://newsapi.org/v2/top-headlines?country=eg&apiKey=77b93379c62f4a6984b4ac0420f44064';

  static const ArticleTitle = 'title';
  static const ArticleDescription = 'description';
  static const ArticleImageUrl = 'urlToImage';
  static const ArticlePublishedAt = 'publishedAt';
  static const ArticleContent = 'content';
  static const ArticleUrl = 'url';
  static const ArticleAuthor = 'author';
  static const Articles = 'articles';

  static const tMainBackGround = Color(0xFF49233C);
  static const tCartBackground = Color(0xFF41162F);
  static const tAuthorColor = Color(0xFFE1A57E);
  static const tWhite = Color(0xFFFFFFFF);
  static const tGray = Color(0xFF71495F);
  static const tBlack = Color(0xFF000000);

  static const Category = [
    'business',
    'entertainment',
    'general',
    'health',
    'science',
    'sports',
    'technology'
  ];

  static const DefaultCountry = 'defaultCountry';

  static const Map<String, String> Countries = {
    'United Arab Emirates': 'ae',
    'Argentina': 'ar',
    'Austria': 'at',
    'Australia': 'au',
    'Belgium': 'be',
    'Bulgaria': 'bg',
    'Brazil': 'br',
    'Canada': 'ca',
    'Switzerland': 'ch',
    'China': 'cn',
    'Colombia': 'co',
    'Cuba': 'cu',
    'Czech Republic': 'cz',
    'Germany': 'de',
    'Egypt': 'eg',
    'France': 'fr',
    'United Kingdom': 'gb',
    'Greece': 'gr',
    'Hong Kong': 'hk',
    'Hungary': 'hu',
    'Indonesia': 'id',
    'Ireland': 'ie',
    'Phalistine': 'il',
    'India': 'in',
    'Italy': 'it',
    'Japan': 'jp',
    'South Korea': 'kr',
    'Lithuania': 'lt',
    'Latvia': 'lv',
    'Morocco': 'ma',
    'Mexico': 'mx',
    'Malaysia': 'my',
    'Nigeria': 'ng',
    'Netherlands': 'nl',
    'Norway': 'no',
    'New Zealand': 'nz',
    'Philippines': 'ph',
    'Poland': 'pl',
    'Portugal': 'pt',
    'Romania': 'ro',
    'Serbia': 'rs',
    'Russia': 'ru',
    'Saudi Arabia': 'sa',
    'Sweden': 'se',
    'Singapore': 'sg',
    'Slovenia': 'si',
    'Slovakia': 'sk',
    'Thailand': 'th',
    'Turkey': 'tr',
    'Taiwan': 'tw',
    'Ukraine': 'ua',
    'United States': 'us',
    'Venezuela': 've',
    'South Africa': 'za',
  };
}
