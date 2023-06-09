import 'package:flutter/cupertino.dart';
import 'package:instagram_clone/providers/user_provider.dart';
import 'package:instagram_clone/utils/global_veriable.dart';
import 'package:provider/provider.dart';

class ResponsiveLayoutScreen extends StatefulWidget {
  final Widget webScreenLayout;
  final Widget mobileScreenLayout;
  const ResponsiveLayoutScreen({Key? key, required this.webScreenLayout, required this.mobileScreenLayout}) : super(key: key);

  @override
  State<ResponsiveLayoutScreen> createState() => _ResponsiveLayoutScreenState();
}

class _ResponsiveLayoutScreenState extends State<ResponsiveLayoutScreen> {

  @override
  void initState() {
   addData();
    super.initState();
  }
  addData()async{
    UserProvider userProvider=Provider.of<UserProvider>(context,listen: false);
    await userProvider.refreshUser();
  }
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (context,constraints){
             if(constraints.maxWidth> webScreenSize){
              return widget.webScreenLayout;
             }
             return widget.mobileScreenLayout;
        }
    );
  }
}
