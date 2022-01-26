import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/controller/registration_controller.dart';

class VerificationCode extends StatelessWidget {
  VerificationCode({Key? key}) : super(key: key);

  RegistrationController registrationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => SafeArea(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: AppColors.main,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _header(context),
                  SizedBox(height: 100,),
                  _body(context),
                  SizedBox(height: 100,),
                  _submit(context)
                ],
              ),
            ),
          )
      ),)
    );
  }

  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.arrow_back_ios,color: Colors.white,)
                ],
              ),
            ),
          ),
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.1,
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo/logo2.png"),
                    )),
              )
            ],
          ),
          SizedBox(
            width: 45,
          ),
        ],
      ),
    );
  }
  _body(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.6,
      child: TextField(
        style: TextStyle(color: Colors.white),
        controller: registrationController.code,
        cursorColor: Colors.white,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          focusedErrorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red)),
          errorText:
          registrationController.validate_verification.value &&
              registrationController.code.text.isEmpty ?
          App_Localization.of(context)!.translate("code_is_required") : null,
          errorBorder: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: Colors.red)),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          hintText: App_Localization.of(context)!.translate("enter_the_code"),
          hintStyle: TextStyle(color: Colors.white,fontSize: 15),
          contentPadding: EdgeInsets.all(5),
          suffixIcon: Icon(
            Icons.email_outlined,
            color: Colors.black,
            size: 20,
          ),
        ),
      ),
    );
  }
  _submit(BuildContext context) {
    return GestureDetector(
      onTap: () {
        registrationController.next_verification(context);
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.93,
        height: MediaQuery.of(context).size.height * 0.08,
        color: Colors.white,
        child: Center(
          child: Text(
              App_Localization.of(context)!.translate("submit"),
            style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}
