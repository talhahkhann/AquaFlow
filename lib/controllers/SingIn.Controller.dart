import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SingInController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for password visibility

  var isPasswordVisible = false.obs;
  Future<UserCredential?> singInMethod(
    String userEmail,
    String userPassword,
    
  ) async {
    try {
      EasyLoading.show(status: 'Please wait');
      UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
              email: userEmail, password: userPassword);
// Send Email Verification

  
// add data into databas
EasyLoading.dismiss();
return userCredential;

    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appbarColor,
          colorText: AppConstant.appMainColor);
    }
  }
}
