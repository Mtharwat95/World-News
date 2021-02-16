import 'package:flutter/material.dart';
import 'package:news_app/ViewModels/NewsListVM.dart';
import 'package:provider/provider.dart';

import 'Providers/ModalHud.dart';
import 'Utils/Constants.dart';
import 'View/NewsScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Constants.tMainBackGround,
        appBarTheme: AppBarTheme(
          color: Constants.tMainBackGround,
          elevation: 10,
          textTheme: TextTheme(
            headline6: TextStyle(
              color: Constants.tWhite,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          iconTheme: IconThemeData(
            color: Constants.tAuthorColor,
          ),
          actionsIconTheme: IconThemeData(
            color: Constants.tAuthorColor,
          ),
          centerTitle: true,
        ),
      ),
      home: MultiProvider(providers: [
        ChangeNotifierProvider(
          create: (_) => NewsListVm(),
        ),
        ChangeNotifierProvider(create: (context) => ModalHud()),
      ], child: NewsScreen()),
    );
  }
}
