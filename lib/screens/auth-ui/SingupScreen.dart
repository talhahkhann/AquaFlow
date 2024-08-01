import 'package:ecomproject/controllers/SingUp.Controller.dart';
import 'package:ecomproject/screens/auth-ui/SinginScreen.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class SingupScreen extends StatefulWidget {
  const SingupScreen({super.key});

  @override
  State<SingupScreen> createState() => _SingupScreenState();
}

class _SingupScreenState extends State<SingupScreen> {
  final SingUpController singUpController = Get.put(SingUpController());
  TextEditingController username = TextEditingController();
  TextEditingController useremail = TextEditingController();
  TextEditingController userPhone = TextEditingController();
  TextEditingController userCity = TextEditingController();
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
            'Sing Up',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
              child: Column(
            children: [
              isKeyboardVisible
                  ? SizedBox.shrink()
                  : Column(
                      children: [
                        LottieBuilder.asset(
                          'assets/images/SplashAnimation.json',
                          height: Get.height / 4.7,
                        ),
                      ],
                    ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: useremail,
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
                height: Get.height / 180,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: username,
                    cursorColor: AppConstant.appbarColor,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                        hintText: 'Username',
                        prefixIcon: Icon(Icons.account_circle_rounded),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  )),
              SizedBox(
                height: Get.height / 180,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userPhone,
                    cursorColor: AppConstant.appbarColor,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Phone',
                        prefixIcon: Icon(Icons.phone),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  )),
              SizedBox(
                height: Get.height / 180,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: Obx(() => TextFormField(
                        obscureText: singUpController.isPasswordVisible.value,
                        controller: userPassword,
                        cursorColor: AppConstant.appbarColor,
                        keyboardType: TextInputType.visiblePassword,
                        decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                                onTap: () {
                                  singUpController.isPasswordVisible.toggle();
                                },
                                child: singUpController.isPasswordVisible.value
                                    ? Icon(Icons.visibility)
                                    : Icon(Icons.visibility_off)),
                            hintText: 'Password',
                            prefixIcon: Icon(Icons.password_rounded),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            )),
                      ))),
              SizedBox(
                height: Get.height / 180,
              ),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  width: Get.width,
                  padding: EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: userCity,
                    cursorColor: AppConstant.appbarColor,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(
                        hintText: 'City',
                        prefixIcon: Icon(Icons.location_city),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        )),
                  )),
              // Container(
              //   alignment: Alignment.centerRight,
              //   margin: EdgeInsets.symmetric(horizontal: 5.0),
              //   child: Text(
              //     "Forgot Password?",
              //     style: TextStyle(fontWeight: FontWeight.bold),
              //   ),
              // ),

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
                          String name = username.text.trim();
                          String email = useremail.text.trim();
                          String city = userCity.text.trim();
                          String phone = userPhone.text.trim();
                          String password = userPassword.text.trim();
                          String userDeviceToken = '';
                          if (name.isEmpty ||
                              email.isEmpty ||
                              phone.isEmpty ||
                              city.isEmpty ||
                              password.isEmpty ||
                              password.isEmpty) {
                            Get.snackbar('Error', 'Please Enter All Details',
                                snackPosition: SnackPosition.BOTTOM,
                                backgroundColor: AppConstant.appbarColor,
                                colorText: AppConstant.appMainColor);
                          } else {
                            UserCredential? userCredential =
                                await singUpController.singUpMethod(name, email,
                                    phone, city, password, userDeviceToken);
                            if (userCredential != null) {
                              Get.snackbar('Verification email Sent',
                                  'Please Check your email',
                                  snackPosition: SnackPosition.BOTTOM,
                                  backgroundColor: AppConstant.appbarColor,
                                  colorText: AppConstant.appMainColor);
                              FirebaseAuth.instance.signOut();
                              Get.offAll(() => SinginScreen);
                            }
                          }
                        },
                        icon: FaIcon(
                          FontAwesomeIcons.signing,
                          color: Colors.white,
                        ),
                        label: Text(
                          'Sing Up',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )),
                  ),
                ),
              ),
              SizedBox(
                height: Get.height / 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have an account?"),
                  SizedBox(
                    width: Get.width / 55,
                  ),
                  GestureDetector(
                    onTap: () {
                      Get.offAll(() => SinginScreen());
                    },
                    child: Text(
                      'Log In',
                      style: TextStyle(fontWeight: FontWeight.bold),
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
