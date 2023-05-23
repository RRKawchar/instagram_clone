import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone/models/post_model.dart';
import 'package:instagram_clone/sources/storage_methods.dart';
import 'package:uuid/uuid.dart';

class FireStoreMethods{

final FirebaseFirestore firestore=FirebaseFirestore.instance;

Future<String> uploadPost(
    String caption,
    Uint8List file,
    String uid,
    String username,
    String profileImage,
    )async{

  String res="Some error occurred";

  try{

    String photoUrl=await StorageMethods().uploadImage('posts', file, true);
    String postId= const Uuid().v1();
    PostModel postModel=PostModel(
        caption: caption,
        uid: uid,
        username: username,
        postId: postId,
        datePublished: DateTime.now(),
        postUrl: photoUrl,
        profileImage: profileImage,
        likes: []
    );

    firestore.collection('posts').doc(postId).set(postModel.toJson());

    res="success";

  }catch(error){
     res=error.toString();
  }
return res;
}


 Future<void> likePost(String postId,String uid,List likes)async{
  try{
    if(likes.contains(uid)){
      await firestore.collection("posts").doc(postId).update({
       'likes':FieldValue.arrayRemove([uid]),
      });
    }else{
      await firestore.collection("posts").doc(postId).update({
        'likes':FieldValue.arrayUnion([uid]),
      });
    }

  }catch(error){
    print(error.toString());
  }
 }

 Future<void> postComment(String postId,String text,String uid,String name,String profilePic)async{
   try{
   String commentId=Uuid().v1();
     if(text.isNotEmpty){
       await firestore.collection('posts').doc(postId).collection('comments').doc(commentId).set({
        "profilePic":profilePic,
         'postId':postId,
          'text':text,
         'uid':uid,
         'username':name,
         'commentId':commentId,
         'datePublished':DateTime.now(),
       });
     }else{
       print("Text is empty");
     }

   }catch(e){
     print(e.toString());
   }

 }

  
}