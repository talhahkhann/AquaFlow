import 'dart:async';

import 'package:ecomproject/controllers/GetUserData.Controller.dart';
import 'package:ecomproject/screens/admin-panel/AdminMain.Screen.dart';
import 'package:ecomproject/screens/auth-ui/WelcomeScreen.dart';
import 'package:ecomproject/screens/user-panel/MainScreen.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  User? user = FirebaseAuth.instance.currentUser;
  @override
  void initState() {
    Timer(Duration(seconds: 3), () {
loggedIn(context);
    });
    super.initState();
  }

  Future<void> loggedIn(BuildContext context) async{

    if(user != null){
            final GetUserDataController getUserDataController = Get.put(GetUserDataController());
      var userData =  await getUserDataController.getUserData(user!.uid);

      if(userData[0]['isAdmin'] == true){
          Get.offAll(()=>AdminMainScreen());
      }else{
        Get.offAll(()=>MainScreen());
      }
    }else{
      Get.to(()=>WelcomeScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
              child: Container(
                width: Get.width,
                alignment: Alignment.center,
                child: Lottie.asset('assets/images/SplashAnimation.json'),
              ),
            ),
            Container(
              margin: EdgeInsets.only(bottom: 20.0),
              width: Get.width,
              alignment: Alignment.center,
              child: Text(
                AppConstant.appPoweredBy,
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            )
          ],
        ),
      ),
    );
  }
}
