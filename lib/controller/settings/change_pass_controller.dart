import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/top_bar.dart';

class ChangePassController extends GetxController {

  TextEditingController old_pass = TextEditingController();
  TextEditingController new_pass = TextEditingController();
  TextEditingController confirm_pass = TextEditingController();
  var validate = false.obs;

  submit(BuildContext context) {
    if(old_pass.text.isEmpty || new_pass.text.isEmpty ||
        confirm_pass.text.isEmpty || old_pass.text.length < 6 ||
        new_pass.text.length < 6 || confirm_pass.text.length < 6 ) {
      validate.value = true;
    }
    else {
      validate.value = false;
      TopBar().success_top_bar(context, "password Changed");
    }
  }
}