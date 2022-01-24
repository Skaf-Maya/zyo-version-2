import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/view/home.dart';

class ForgetPassController extends GetxController {

  TextEditingController email = TextEditingController();
  var validate = false.obs;

  submit() {
    if(email.text.isEmpty || !RegExp(r'\S+@\S+\.\S+').hasMatch(email.text))
    {
      validate.value = true;
    }
    else {
      validate.value = false;
      Get.offAll(()=>Home());
    }
  }
}