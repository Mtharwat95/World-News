import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/Constants.dart';
import 'package:news_app/View/WholeArticle.dart';
import 'package:news_app/ViewModels/NewsVM.dart';
import 'package:news_app/Widgets/ImageUrlView.dart';

class ArticleDetails extends StatelessWidget {
  final NewsVM newsVM;
  ArticleDetails(this.newsVM);
  void openWholeArticle(context, url) {
    Navigator.push(context, MaterialPageRoute(builder: (_) {
      return WholeArticle(url);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.all(10),
            children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Author: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tAuthorColor,
                          fontSize: 18),
                    ),
                    Text(
                      newsVM.author == null ? 'Unknown Author' : newsVM.author,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Constants.tWhite,
                        fontSize: 20,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: ImageUrlView(newsVM.imageUrl),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Published At: ',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          color: Constants.tAuthorColor,
                          fontSize: 14),
                    ),
                    Text(
                      newsVM.publishedAt == null
                          ? 'Unknown Author'
                          : newsVM.publishedAt,
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        color: Constants.tGray,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tAuthorColor,
                          fontSize: 18),
                    ),
                    Text(
                      newsVM.title,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tWhite,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Description: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tAuthorColor,
                          fontSize: 18),
                    ),
                    Text(
                      newsVM.description,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tWhite,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Content: ',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tAuthorColor,
                          fontSize: 18),
                    ),
                    Text(
                      newsVM.content == null
                          ? 'Content Unavailable'
                          : newsVM.content,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Constants.tWhite,
                          fontSize: 20),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
                child: GestureDetector(
                  onTap: () {
                    openWholeArticle(context, newsVM.url);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Open Article: ',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Constants.tAuthorColor,
                              fontSize: 18),
                        ),
                      ),
                      Text(
                        newsVM.url == null ? '' : newsVM.url,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Constants.tWhite,
                            fontSize: 20),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// return SafeArea(
//   child: Scaffold(
//     body: Column(
//       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Author: ',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tAuthorColor,
//                     fontSize: 12),
//               ),
//               Text(
//                 newsVM.author,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tWhite,
//                     fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//         ClipRRect(
//           borderRadius: BorderRadius.circular(20),
//           child: ImageUrlView(newsVM.imageUrl),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Title: ',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tAuthorColor,
//                     fontSize: 12),
//               ),
//               Text(
//                 newsVM.title,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tWhite,
//                     fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Description: ',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tAuthorColor,
//                     fontSize: 12),
//               ),
//               Text(
//                 newsVM.description,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tWhite,
//                     fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Text(
//                 'Content: ',
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tAuthorColor,
//                     fontSize: 12),
//               ),
//               Text(
//                 newsVM.description,
//                 style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     color: Constants.tWhite,
//                     fontSize: 16),
//               ),
//             ],
//           ),
//         ),
//       ],
//     ),
//   ),
// );
