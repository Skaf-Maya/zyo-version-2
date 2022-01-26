import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/view/home.dart';
import 'package:zyo_version_1/view/verification_code.dart';

class RegistrationController extends GetxController {

  GlobalKey<ScaffoldState> globalKey =  GlobalKey<ScaffoldState>();
  var selected = 0.obs;
  TextEditingController email_sign_in = TextEditingController();
  TextEditingController password_sign_in = TextEditingController();
  TextEditingController email_register = TextEditingController();
  TextEditingController password_register = TextEditingController();
  TextEditingController code = TextEditingController();
  var validate_sign = false.obs;
  var validate_register = false.obs;
  var isHidden_sign = true.obs;
  var isHidden_register = true.obs;
  var isChecked_1 = false.obs;
  var isChecked_2 = false.obs;
  var validate_verification = false.obs;

  visible_password_signin() {
    isHidden_sign.value = !isHidden_sign.value;
  }

  visible_password_register() {
    isHidden_register.value = !isHidden_register.value;
  }

  next_sign_in() {
    if(email_sign_in.text.isEmpty || password_sign_in.text.isEmpty ||
       !RegExp(r'\S+@\S+\.\S+').hasMatch(email_sign_in.text) ||
        password_sign_in.text.length < 6 )
      {
        validate_sign.value = true;
      }
    else {
      validate_sign.value = false;
      Get.offAll(()=>Home());
    }
  }

  next_register(BuildContext context) {
    if(email_register.text.isEmpty || password_register.text.isEmpty ||
        !RegExp(r'\S+@\S+\.\S+').hasMatch(email_register.text) ||
        password_register.text.length < 6 || isChecked_1==false || isChecked_2==false )
    {
      validate_register.value = true;
    }
    else {
      validate_register.value = false;
      Get.to(() => VerificationCode());
    }
  }

  next_verification(BuildContext context) {
    if(code.text.isEmpty)
    {
      validate_verification.value = true;
    }
    else {
      validate_verification.value = false;
      Get.off(()=>Home());
    }
  }

}