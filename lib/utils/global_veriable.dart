import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/screens/add_post_screen.dart';
import 'package:instagram_clone/screens/feedScreen.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/screens/search_screen.dart';

const webScreenSize = 600;

var homeScreenItem = [
  FeedScreen(),
  SearchScreen(),
  AddPostScreen(),
  Center(child: Text("favorite")),
  ProfileScreen(uid: FirebaseAuth.instance.currentUser!.uid),
];
