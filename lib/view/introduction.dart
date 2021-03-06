import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/controller/introduction_controller.dart';
import 'package:zyo_version_1/view/registation.dart';

class Introduction extends StatelessWidget {
  Introduction({Key? key}) : super(key: key);

  IntroController introController = Get.put(IntroController());


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/intro/intro.png"),
              fit: BoxFit.cover
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _btn(context),
              SizedBox(height: 50,)
            ],
          ),
        ),
      ),
    );
  }

  //remove later
  _btn(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.off(()=>Registration());
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.07,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(25))
        ),
        child: Center(
          child: Text(
            App_Localization.of(context)!.translate("start"),
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold
          ),),
        ),
      ),
    );
  }
}
