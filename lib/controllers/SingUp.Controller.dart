import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecomproject/models/User.Model.dart';
import 'package:ecomproject/utils/AppConstants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';

class SingUpController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // for password visibility

  var isPasswordVisible = false.obs;
  Future<UserCredential?> singUpMethod(
    String userName,
    String userEmail,
    String userPhone,
    String userCity,
    String userPassword,
    String userDeviceToken,
  ) async {
    try {
      EasyLoading.show(status: 'Please wait');
      UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
              email: userEmail, password: userPassword);
// Send Email Verification

      await userCredential.user!.sendEmailVerification();
      UserModel userModel = UserModel(
          uId: userCredential.user!.uid,
          username: userName,
          email: userEmail,
          phone: userPhone,
          userImg: '',
          userDeviceToken: userDeviceToken,
          country: '',
          userAddress: '',
          street: '',
          isAdmin: false,
          isActive: true,
          createdOn: DateTime.now(),
          city: userCity);
// add data into database

_firestore.collection('users').doc(userCredential.user!.uid).set(userModel.toMap());
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
