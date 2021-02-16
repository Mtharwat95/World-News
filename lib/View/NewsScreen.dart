import 'package:flutter/material.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';
import 'package:news_app/Providers/ModalHud.dart';
import 'package:news_app/Utils/Constants.dart';
import 'package:news_app/ViewModels/NewsListVM.dart';
import 'package:news_app/ViewModels/NewsVM.dart';
import 'package:news_app/Widgets/CustomList.dart';
import 'package:provider/provider.dart';

class NewsScreen extends StatefulWidget {
  @override
  _NewsScreenState createState() => _NewsScreenState();
}

class _NewsScreenState extends State<NewsScreen> {
  var key = GlobalKey<ScaffoldState>();
  int currentBottomNavIndex = 0;
  var currentCategory = '';
  var currentCountry = 'EG';
  var myTitle = 'All Categories';
  // var listViewModel = NewsListVm();

  List<NewsVM> newArticle;

  @override
  void initState() {
    // // TODO: implement initState
    // super.initState();
    // listViewModel.loadingStatus = LoadingStatus.searching;
    // listViewModel.fetchAll();
    // setState(() {
    //
    // defaultCountry();
    print('Tharwat: intistate ${this.currentCountry}');
    Provider.of<NewsListVm>(context, listen: false).fetchAll();
    // });
  }

  // void defaultCountry() async {
  //   SharedPreferences preferences = await SharedPreferences.getInstance();
  //   if (preferences.getString(Constants.DefaultCountry) == null) {
  //     setState(() {
  //       // this.currentCountry = 'us';
  //       preferences.setString(Constants.DefaultCountry, 'us');
  //       print('Tharwat0: ${preferences.getString(Constants.DefaultCountry)}');
  //     });
  //   } else {
  //     setState(() {
  //       this.currentCountry = preferences.getString(Constants.DefaultCountry);
  //       print('Tharwat1: ${preferences.getString(Constants.DefaultCountry)}');
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    var listViewModel = Provider.of<NewsListVm>(context, listen: false);
    final modalHud = Provider.of<ModalHud>(context, listen: false);
    // defaultCountry();
    return DefaultTabController(
      length: 8,
      child: Scaffold(
        key: this.key,
        appBar: AppBar(
          title: Center(
            child: Text(
              myTitle,
              style: TextStyle(),
            ),
          ),
          actions: [
            PopupMenuButton<String>(
              child: Row(
                children: [
                  Text(this.currentCountry.toUpperCase()),
                  Icon(Icons.arrow_drop_down_sharp),
                ],
              ),
              onSelected: (value) {
                setState(() {
                  // defaultCountry();
                  this.currentCountry = Constants.Countries[value];
                  listViewModel.fetchByCategoryAndCountry(
                      this.currentCategory, Constants.Countries[value]);
                });
              },
              // icon: Icon(Icons.arrow_drop_down_sharp),
              itemBuilder: (context) {
                return Constants.Countries.keys
                    .map((v) => PopupMenuItem(
                          value: v,
                          child: Text(v),
                        ))
                    .toList();
              },
            ),
            // DropdownButton(
            //   items: temps.map((item) {
            //     return DropdownMenuItem(
            //       child: Text(item),
            //       value: item,
            //     );
            //   }).toList(),
            //   value: selectedTemp1,
            //   onChanged: (newValue){
            //     setState(() {
            //       selectedTemp1 = newValue;
            //     });
            //   },
            // ),
          ],
          bottom: TabBar(
            isScrollable: true,
            indicatorColor: Constants.tWhite,
            labelColor: Constants.tBlack,
            onTap: (value) {
              setState(() {
                currentBottomNavIndex = value;
                currentCountry = 'EG';
                fireUrl(listViewModel, value);
              });
            },
            tabs: [
              myTab("All", Icons.all_inbox, 0, currentBottomNavIndex),
              myTab('General', Icons.api_rounded, 1, currentBottomNavIndex),
              myTab(
                  'Business', Icons.business_rounded, 2, currentBottomNavIndex),
              myTab('Entertainment', Icons.sports_esports_outlined, 3,
                  currentBottomNavIndex),
              myTab('Health', Icons.healing, 4, currentBottomNavIndex),
              myTab('Science', Icons.science, 5, currentBottomNavIndex),
              myTab('Sports', Icons.sports_football, 6, currentBottomNavIndex),
              myTab('Technology', Icons.laptop_chromebook_rounded, 7,
                  currentBottomNavIndex),
            ],
          ),
        ),
        body: TabBarView(children: [
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
          Consumer<NewsListVm>(builder: (ctx, listVM, child) {
            if (listVM.loadingStatus != LoadingStatus.completed) {
              modalHud.changeisLoading(true);
              return ModalProgressHUD(
                  inAsyncCall: Provider.of<ModalHud>(context).isLoading,
                  child: Container());
            } else {
              modalHud.changeisLoading(false);
              return SafeArea(
                child: Expanded(child: CustomList(listVM.articles)),
              );
            }
          }),
        ]),
      ),
    );
  }

  Widget myTab(String title, var icon, int index, int currentIndex) {
    return Column(
      children: [
        Icon(
          icon,
          color: currentIndex == index ? Constants.tWhite : Constants.tBlack,
        ),
        Text(
          title,
          style: TextStyle(
              color:
                  currentIndex == index ? Constants.tWhite : Constants.tBlack,
              fontSize: currentIndex == index ? 16 : null),
        ),
      ],
    );
  }

  void fireUrl(listViewModel, value) {
    switch (value) {
      case 0:
        print('HomeScreen $value');
        myTitle = 'All News';
        this.currentCategory = '';
        // modalHud.changeisLoading(true);
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchAll();
        break;
      case 1:
        myTitle = 'General News';
        this.currentCategory = 'general';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
      case 2:
        myTitle = 'Business News';
        this.currentCategory = 'business';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
      case 3:
        myTitle = 'Entertainment News';
        this.currentCategory = 'entertainment';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
      case 4:
        myTitle = 'Health News';
        this.currentCategory = 'health';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
      case 5:
        myTitle = 'Science News';
        this.currentCategory = 'science';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
      case 6:
        myTitle = 'Sports News';
        this.currentCategory = 'sports';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
      case 7:
        myTitle = 'Technology News';
        this.currentCategory = 'technology';
        listViewModel.loadingStatus = LoadingStatus.searching;
        listViewModel.fetchByCategory(this.currentCategory);
        break;
    }
  }
}
