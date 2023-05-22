import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feedScreen.dart';

const webScreenSize=600;

const homeScreenItem=[

  FeedScreen(),
  Center(child: Text("search"),),
 AddPostScreen(),
  Center(child: Text("favorite"),),
  Center(child: Text("setting"),),

];