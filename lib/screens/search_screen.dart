import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:instagram_clone/screens/profile_screen.dart';
import 'package:instagram_clone/utils/colors.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController=TextEditingController();

  bool isShowUser=false;


  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       backgroundColor: mobileBackgroundColor,
       title: TextFormField(
         controller: searchController,
         decoration: const InputDecoration(
           labelText: "Search for a users",
         ),
         onFieldSubmitted: (String _){
           setState(() {
             isShowUser=true;
           });
         },
       ),
     ),
      body:isShowUser? FutureBuilder(
        future: FirebaseFirestore.instance.collection('users')
            .where('username',isGreaterThanOrEqualTo: searchController.text)
            .get(),
        builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }
          return ListView.builder(
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context,index){
                return InkWell(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder:(_)=>ProfileScreen(uid: snapshot.data!.docs[index]['uid'])));
                  },
                  child: ListTile(
                    leading: CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data!.docs[index]['photoUrl']),),
                    title: Text(snapshot.data!.docs[index]['username']),
                  ),
                );
          });
        },
      ): FutureBuilder(
          future: FirebaseFirestore.instance.collection('posts').get(),
          builder: (context,snapshot){
          if(!snapshot.hasData){
            return const Center(child: CircularProgressIndicator(),);
          }
          return GridView.builder(
            itemCount: snapshot.data!.docs.length,
              gridDelegate:  const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 5,
              ),
              itemBuilder: (context,index){
                return  Image.network(snapshot.data!.docs[index]['postUrl']);
              }
          );
      }),
    );
  }
}


