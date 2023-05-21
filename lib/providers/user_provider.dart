import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/sources/auth_methods.dart';

class UserProvider with ChangeNotifier {
  UserModel? _userModel;
  final AuthMethods _authMethods=AuthMethods();
  UserModel get getUser => _userModel!;

  Future<void> refreshUser()async{
    UserModel user=await _authMethods.getUserDetails();
    _userModel=user;
    notifyListeners();
  }
}
