import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/view/order_confirmed.dart';

class CheckoutController extends GetxController {

  TextEditingController first_name = TextEditingController();
  TextEditingController last_name = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController state = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController address1 = TextEditingController();
  TextEditingController address2 = TextEditingController();
  var validate = false.obs;
  var isSwitched = false.obs;

  save(BuildContext context) {
    if(first_name.text.isEmpty || last_name.text.isEmpty ||
        phone.text.isEmpty || state.text.isEmpty ||
        city.text.isEmpty || address1.text.isEmpty ||
        address2.text.isEmpty || !isSwitched.value) {
      validate.value = true;
    }
    else {
      validate.value = false;
      Get.off(()=>OrderConfirmed());
    }
  }

}