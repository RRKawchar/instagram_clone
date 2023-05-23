import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram_clone/utils/colors.dart';
import 'package:instagram_clone/utils/global_veriable.dart';

class WebScreenLayout extends StatefulWidget {
  const WebScreenLayout({Key? key}) : super(key: key);

  @override
  State<WebScreenLayout> createState() => _WebScreenLayoutState();
}

class _WebScreenLayoutState extends State<WebScreenLayout> {

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
    setState(() {
      _page=page;

    });
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
      appBar: AppBar(
        backgroundColor: mobileBackgroundColor,
        title: SvgPicture.asset(
          'assets/ic_instagram.svg',
          height: 32,
          color: primaryColor,
        ),
        actions: [
          IconButton(
            onPressed: () =>navigationTapped(0),
            icon:  Icon(
              Icons.home,
              color: _page==0?primaryColor:secondaryColor,
            ),
          ),
          IconButton(
            onPressed:() =>navigationTapped(1),
            icon:  Icon(
              Icons.search,
              color: _page==1?primaryColor:secondaryColor,
            ),
          ),
          IconButton(
            onPressed:() =>navigationTapped(2),
            icon: Icon(
              Icons.add_photo_alternate,
              color: _page==2?primaryColor:secondaryColor,
            ),
          ),
          IconButton(
            onPressed: () =>navigationTapped(3),
            icon: Icon(
              Icons.favorite,
              color: _page==3?primaryColor:secondaryColor,
            ),
          ),
          IconButton(
            onPressed: () =>navigationTapped(4),
            icon: Icon(
              Icons.person,
              color: _page==4?primaryColor:secondaryColor,
            ),
          ),
        ],
      ),
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: pageController,
        onPageChanged: onPageChange,
        children: homeScreenItem,
      ),
    );
  }
}
