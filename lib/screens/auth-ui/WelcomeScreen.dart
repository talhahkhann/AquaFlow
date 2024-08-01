import 'package:ecomproject/controllers/GoogleSingIn.controller.dart';
import 'package:ecomproject/screens/auth-ui/SinginScreen.dart';
import 'package:ecomproject/screens/auth-ui/SingupScreen.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/extensions/export.dart';
import 'package:lottie/lottie.dart';

class WelcomeScreen extends StatelessWidget {
  WelcomeScreen({super.key});
  final GoogleSignInController _googleSignInController =
      GoogleSignInController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppConstant.appbarColor,
        centerTitle: true,
        title: Text('Aqua Flow'),
        titleTextStyle: TextStyle(
            color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
        elevation: 0,
        // backgroundColor: AppConstant.appbarColor,
      ),
      backgroundColor: AppConstant.appMainColor,
      body: Column(
        children: [
          Container(
            child: Lottie.asset('assets/images/SplashAnimation.json', height: Get.height / 2.8,),
          ),
          Container(
            child: Text(
              'Happy Drinking',
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
            ),
          ),
          SizedBox(
            height: Get.height / 12,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Material(
              
              child: Container(
              
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                ),
                width: Get.width / 1.2,
                height: Get.height / 12,
                child: TextButton.icon(
                    onPressed: () {
                      _googleSignInController.signInWithGoogle();
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.google,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Sign in with google',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 30,
          ),
          Padding(
            padding: EdgeInsets.all(8),
            child: Material(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  color: Colors.blue,
                ),
                width: Get.width / 1.2,
                height: Get.height / 12,
                child: TextButton.icon(
                    onPressed: () {
                      Get.offAll(SingupScreen());
                    },
                    icon: FaIcon(
                      FontAwesomeIcons.mailBulk,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Sign in with Email',
                      style: TextStyle(color: Colors.white),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
