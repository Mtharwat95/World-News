import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/Constants.dart';
import 'package:news_app/View/ArticleDetails.dart';
import 'package:news_app/ViewModels/NewsVM.dart';
import 'package:news_app/Widgets/ImageUrlView.dart';

class CustomList extends StatelessWidget {
  final List<NewsVM> articles;
  CustomList(this.articles);

  void openArticleDetails(context, article) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return ArticleDetails(article);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: this.articles.length,
        itemBuilder: (_, index) {
          var article = this.articles[index];
          return GestureDetector(
            onTap: () {
              openArticleDetails(context, article);
            },
            child: Padding(
              padding: const EdgeInsets.only(top: 20, left: 8, right: 8),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Constants.tCartBackground,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Constants.tMainBackGround,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: ImageUrlView(article.imageUrl),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: Text(
                            article.author == null
                                ? 'UnDefined Author'
                                : article.author,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.tAuthorColor,
                                fontSize: 12),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            article.title,
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Constants.tWhite,
                                fontSize: 16),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 10, bottom: 10),
                          child: Text(
                            article.publishedAt,
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Constants.tGray,
                                fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        });
  }

/*  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: this.articles.length,
      gridDelegate:
      SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (_, index) {
        var article = this.articles[index];
        return GestureDetector(
          onTap: () {
            _showNewsArticleDetails(context, article);
          },
          child: GridTile(
            // child: Container(
            //   margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            //   child: CircleImage(article.imageUrl),
            // ),
            footer: Container(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                article.title,
                style: TextStyle(fontWeight: FontWeight.bold),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
        );
      },
    );
  }*/

}
