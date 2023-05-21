
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_veriable.dart';
import 'package:provider/provider.dart';

class MobileScreenLayout extends StatefulWidget {
  const MobileScreenLayout({Key? key}) : super(key: key);

  @override
  State<MobileScreenLayout> createState() => _MobileScreenLayoutState();
}

class _MobileScreenLayoutState extends State<MobileScreenLayout> {

  int _page=0;
late PageController pageController;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController=PageController();
  }

  @override
  void dispose() {
   pageController.dispose();
    super.dispose();
  }

  void navigationTapped(int page){
    pageController.jumpToPage(page);
  }


  onPageChange(int page){
  setState(() {
    _page=page;

  });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: PageView(
        controller: pageController,
        onPageChanged: onPageChange,
        children:homeScreenItem,
        physics: const NeverScrollableScrollPhysics(),
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: mobileBackgroundColor,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home,color: _page==0?primaryColor:secondaryColor,),
            label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.search,color: _page==1?primaryColor:secondaryColor,),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_circle,color: _page==2?primaryColor:secondaryColor,),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite,color: _page==3?primaryColor:secondaryColor,),
              label: ""
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person,color: _page==4?primaryColor:secondaryColor,),
              label: ""
          ),
        ],
        onTap: navigationTapped,
      ),
    );
  }
}
