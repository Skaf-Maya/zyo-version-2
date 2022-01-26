import 'package:flutter/material.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';

class NoInternet extends StatelessWidget {
  const NoInternet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.main,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.wifi_off,color: AppColors.main2,size: 100),
              SizedBox(height: 15),
              Text(
                App_Localization.of(context)!.translate("no_internet"),
                style: TextStyle(
                    color: AppColors.main2,
                    fontSize: 25
                )),
              SizedBox(height: 40),
              Container(
                width: MediaQuery.of(context).size.width * 0.4,
                height: MediaQuery.of(context).size.height * 0.07,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                    color: AppColors.main2
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      App_Localization.of(context)!.translate("reload"),
                      style: TextStyle(
                        color: AppColors.main,
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                      ),),
                    SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () {
                        //todo something
                      },
                      child: Icon(Icons.refresh,color: AppColors.main,)),
                  ],
                )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
