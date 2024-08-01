import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class ForgotPasswordController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for password visibility

  var isPasswordVisible = false.obs;
  Future<void> ForgotPasswordMethod(
    String userEmail,
   
    
  ) async {
    
    try {
      EasyLoading.show(status: 'Please wait');

      await _auth.sendPasswordResetEmail(email: userEmail);

        Get.snackbar("Success", "Password Reset Mail Sent to $userEmail",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appbarColor,
          colorText: AppConstant.appMainColor);
      
     
// Send Email Verification

  
// add data into databas
EasyLoading.dismiss();


    } on FirebaseAuthException catch (e) {
      EasyLoading.dismiss();
      Get.snackbar("Error", "$e",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: AppConstant.appbarColor,
          colorText: AppConstant.appMainColor);
    }
  }
}
