import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:instagram_clone/models/user_model.dart';
import 'package:instagram_clone/sources/storage_methods.dart';

class AuthMethods {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<UserModel> getUserDetails()async{

    User currentUser=_auth.currentUser!;

    DocumentSnapshot snap=await FirebaseFirestore.instance.collection("users").doc(currentUser.uid).get();

    return UserModel.fromSnap(snap);


  }


  Future<String> signUpUser({
    required String email,
    required String password,
    required String username,
    required String bio,
     required Uint8List file,
  }) async {
    String res = "Some error occurred";





    try {
      if (email.isNotEmpty ||
          password.isNotEmpty ||
          username.isNotEmpty ||
          bio.isNotEmpty) {

        // register user

        UserCredential credential = await _auth.createUserWithEmailAndPassword(
            email: email, password: password);

       String photoUrl= await StorageMethods().uploadImage('profilePics', file, false);

        print(credential.user!.uid);

        UserModel userModel =UserModel(
            username: username,
            email: email,
            uid: credential.user!.uid,
            bio: bio,
            followers: [],
            following: [],
            photoUrl: photoUrl
        );


        await _firestore.collection('users').doc(credential.user!.uid).set(userModel.toJson());
        res = 'success';
      }
    } catch (error) {
      res = error.toString();
    }
    return res;
  }

  Future<String> loginUser({required String email,required String password})async{

    String res="Some error occurred";
    try{
      if(email.isNotEmpty|| password.isNotEmpty){
        await _auth.signInWithEmailAndPassword(email: email, password: password);
        res='success';
      }else{
        res='Please enter all the fields';
      }



    }catch(error){
      res = error.toString();
    }
    return res;

}
}
