import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/Constants.dart';

class MyTabs extends StatelessWidget {
  int currentBottomNavIndex = 0;

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

  @override
  Widget build(BuildContext context) {
    return TabBar(
      isScrollable: true,
      indicatorColor: Constants.tWhite,
      labelColor: Constants.tBlack,
      onTap: (value) {
/*        setState(() {
          print('HomeScreen $value');
          currentBottomNavIndex = value;
        });*/
      },
      tabs: [
        myTab('General', Icons.api_rounded, 0, currentBottomNavIndex),
        myTab('Business', Icons.business_rounded, 1, currentBottomNavIndex),
        myTab('Entertainment', Icons.sports_esports_outlined, 2,
            currentBottomNavIndex),
        myTab('Health', Icons.healing, 3, currentBottomNavIndex),
        myTab('Science', Icons.science, 4, currentBottomNavIndex),
        myTab('Sports', Icons.sports_football, 5, currentBottomNavIndex),
        myTab('Technology', Icons.laptop_chromebook_rounded, 6,
            currentBottomNavIndex),
      ],
    );
  }
}
