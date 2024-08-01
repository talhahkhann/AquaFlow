import 'package:ecomproject/controllers/GetUserData.Controller.dart';
import 'package:ecomproject/controllers/SingIn.Controller.dart';
import 'package:ecomproject/screens/admin-panel/AdminMain.Screen.dart';
import 'package:ecomproject/screens/auth-ui/WelcomeScreen.dart';
import 'package:ecomproject/screens/user-panel/MainScreen.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'ForgotPasswordScreen.dart';

class SinginScreen extends StatefulWidget {
  const SinginScreen({super.key});

  @override
  State<SinginScreen> createState() => _SinginScreenState();
}

class _SinginScreenState extends State<SinginScreen> {
  final SingInController singInController = Get.put(SingInController());
  final GetUserDataController getUserDataController =
      Get.put(GetUserDataController());
  TextEditingController userEmail = TextEditingController();
  TextEditingController userPassword = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          backgroundColor: AppConstant.appbarColor,
          title: Text(
            'Sing In',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
              child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        LottieBuilder.asset(
                          'assets/images/SplashAnimation.json',
                          height: Get.height / 2.8,
                        ),
                      ],
                    ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userEmail,
                    cursorColor: AppConstant.appbarColor,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        hintText: 'Email',
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  )),
              SizedBox(
                height: Get.height / 50,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: Obx(
                    () => TextFormField(
                        obscureText: singInController.isPasswordVisible.value,
                        controller: userPassword,
                        cursorColor: AppConstant.appbarColor,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                            suffixIcon: singInController.isPasswordVisible.value
                                ? GestureDetector(
                                    onTap: () {
                                      singInController.isPasswordVisible
                                          .toggle();
                                    },
                                    child: Icon(Icons.visibility))
                                : Icon(Icons.visibility_off),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ))),
                  )),
              Container(
                alignment: Alignment.centerRight,
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Get.to(() => ForgetPasswordScreen());
                  },
                  child: Text(
                    "Forgot Password?",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Material(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      color: AppConstant.appbarColor,
                    ),
                    width: Get.width / 1.2,
                    height: Get.height / 12,
                    child: TextButton.icon(
                        onPressed: () async {
                          String email = userEmail.text.trim();
                          String password = userPassword.text.trim();
                          if (email.isEmpty || password.isEmpty) {
                            Get.snackbar(
                                'Error', 'Please Enter Email and Password',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appbarColor,
                                colorText: AppConstant.appMainColor);
                          } else {
                            UserCredential? userCredential =
                                await singInController.singInMethod(
                                    email, password);
                            var UserData = await getUserDataController
                                .getUserData(userCredential!.user!.uid);
                            if (userCredential != null) {
                              if (userCredential.user!.emailVerified) {
                                //
                                if (UserData[0]['isAdmin'] == true) {
                                  Get.snackbar(
                                      'Success Admin', 'Login Successfully',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppConstant.appbarColor,
                                      colorText: AppConstant.appMainColor);
                                  Get.offAll(() => AdminMainScreen());
                                } else {
                                  Get.snackbar(
                                      'Success User', 'Login Successfully',
                                      snackPosition: SnackPosition.BOTTOM,
                                      backgroundColor: AppConstant.appbarColor,
                                      colorText: AppConstant.appMainColor);
                                  Get.offAll(() => MainScreen());
                                }
                              } else {
                                Get.snackbar('Error',
                                    'Please Verify your email befor login',
                                    snackPosition: SnackPosition.BOTTOM,
                                    backgroundColor: AppConstant.appbarColor,
                                    colorText: AppConstant.appMainColor);
                              }
                            } else {
                              Get.snackbar('Error', 'Please try again',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appbarColor,
                                  colorText: AppConstant.appMainColor);
                            }
                          }
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.signIn,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Log In',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Don't have an account?"),
                  SizedBox(
                    width: Get.width / 40,
                  ),
                  Padding(
                    padding: EdgeInsets.all(8),
                    child: GestureDetector(
                      onTap: () {
                        Get.offAll(() => WelcomeScreen());
                      },
                      child: Text(
                        'Sing Up',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  )
                ],
              )
            ],
          )),
        ),
      );
    });
  }
}
