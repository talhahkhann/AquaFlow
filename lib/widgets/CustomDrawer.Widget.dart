import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../screens/auth-ui/WelcomeScreen.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.only(top: Get.height/25 , ),
    child: Drawer(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20.0),
          bottomRight: Radius.circular(20.0),
          )),
          child: Wrap(
            runSpacing: 10,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Talha Khan'),
                  subtitle: Text('Version 1.0.1'),
                  leading:CircleAvatar(
                    radius: 22.0,
                    backgroundColor: AppConstant.appbarColor,
                    child: Text('T'),
                  ) ,
                ),
              ),
              Divider(
                indent: 10.0,
                endIndent: 10.0,
                thickness: 1.5,
                color: Colors.grey,
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Home'),
                  
                  leading:Icon(Icons.home),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
                 Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Products'),
                  
                  leading:Icon(Icons.production_quantity_limits),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Orders'),
                  
                  leading:Icon(Icons.shopping_bag),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
               Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Contacts'),
                  
                  leading:Icon(Icons.production_quantity_limits),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
                Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: ListTile(
                  onTap: ()async{
                     GoogleSignIn googleSignIn = GoogleSignIn();
              FirebaseAuth _auth = FirebaseAuth.instance;
              await _auth.signOut();
              await googleSignIn.signOut();
              Get.offAll(()=>WelcomeScreen());
                  },
                  titleAlignment: ListTileTitleAlignment.center,
                  title: Text('Logout'),
                  
                  leading:Icon(Icons.logout),
                  trailing: Icon(Icons.arrow_forward),
                ),
              ),
            ],
          ),
    ),
    );
  }
}