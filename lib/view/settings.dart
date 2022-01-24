import 'package:country_list_pick/country_list_pick.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/Global.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/controller/settings_controller.dart';
import 'package:zyo_version_1/view/introduction.dart';
import 'package:zyo_version_1/view/settings/address_book.dart';
import 'package:zyo_version_1/view/settings/change_pass.dart';
import 'package:zyo_version_1/view/settings/connect_to_us.dart';
import 'package:zyo_version_1/view/settings/delete_account.dart';
import 'package:zyo_version_1/view/settings/languages.dart';
import 'package:zyo_version_1/view/settings/personal_info.dart';

class Settings extends StatelessWidget {
  Settings({Key? key}) : super(key: key);

  Settings_controlller settings_controlller = Get.put(Settings_controlller());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: AppColors.main,
          child: SingleChildScrollView(
            child: Column(
              children: [
                _header(context),
                _body(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Text(App_Localization.of(context)!.translate("settings"),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 25,
                color: Colors.white)
        ),
      ),
    );
  }
  _body(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 20,),
        _personal_info(context),
        SizedBox(height: 20,),
        _addess_pass_account(context),
        SizedBox(height: 20,),
        _country_lang_currency(context),
        SizedBox(height: 20,),
        _connectus_about(context),
        SizedBox(height: 20,),
        _sign_out(context),
        SizedBox(height: 80),
        Center(
          child: Text(App_Localization.of(context)!.translate("version")+" 7.9.0",
          style: TextStyle(color: AppColors.main2,fontSize: 18)),
        ),
        SizedBox(height: 20),
      ],
    );
  }
  _personal_info(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(()=>PersonalInfo());
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: AppColors.main3,
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(App_Localization.of(context)!.translate("personal_information"),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,color: Colors.white,size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  _addess_pass_account(BuildContext context) {
    return Container(
        color: AppColors.main3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(()=> AddressBook());
              },
              child: Container(
                color: AppColors.main3,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(App_Localization.of(context)!.translate("address_book"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,color: Colors.white,size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColors.main2,
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=> ChangePassword());
              },
              child: Container(
                color: AppColors.main3,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(App_Localization.of(context)!.translate("change_password"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,color: Colors.white,size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColors.main2,
            ),
            GestureDetector(
              onTap: () {
                Get.to(()=> DeleteAccount());
              },
              child: Container(
                color: AppColors.main3,
                height: MediaQuery.of(context).size.height * 0.1,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(App_Localization.of(context)!.translate("delete_account"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,color: Colors.white,size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
  _country_lang_currency(BuildContext context) {
    return Container(
        color: AppColors.main3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            _country(context),
            Divider(
              thickness: 1,
              color: AppColors.main2,
            ),
            _lang(context),
            Divider(
              thickness: 1,
              color: AppColors.main2,
            ),
            _currency(context)
          ],
        )
    );
  }
  _connectus_about(BuildContext context) {
    return Container(
        color: AppColors.main3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                Get.to(()=>ConnectToUs());
              },
              child: Container(
                height: MediaQuery.of(context).size.height * 0.1,
                color: AppColors.main3,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(App_Localization.of(context)!.translate("connect_to_us"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,color: Colors.white,size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: AppColors.main2,
            ),
            GestureDetector(
              onTap: () {
                //todo something
              },
              child: Container(
                color: AppColors.main3,
                height: MediaQuery.of(context).size.height * 0.1,
                child:  Padding(
                  padding: const EdgeInsets.only(left: 10,right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(App_Localization.of(context)!.translate("about_zyo"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.arrow_forward_ios,color: Colors.white,size: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
  _sign_out(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.offAll(()=> Introduction());
      },
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        height: 50,
        child: Center(
          child: Text(App_Localization.of(context)!.translate("sign_out"),
            style: TextStyle(
                color: AppColors.main,
                fontSize: 18,
                fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
  _country(BuildContext context) {
    return Container(
      color: AppColors.main3,
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: Text(App_Localization.of(context)!.translate("country_region"),
                style: TextStyle(
                    color: AppColors.main2,
                    fontSize: 18
                ),),
            ),
          ),
          Row(
            children: [
              CountryListPick(
                pickerBuilder: (context,code) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Container(
                            width:
                            Global.language_code == "ar" ?
                            MediaQuery.of(context).size.width - 38:
                            MediaQuery.of(context).size.width - 48,
                            child: Text(" "+code!.name.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15
                              ),),
                          )
                        ],
                      ),
                      Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                    ],
                  );
                },
                appBar: AppBar(
                  backgroundColor: Colors.black,
                  title: Text(
                    App_Localization.of(context)!.translate("choose_a_country"),
                    style: TextStyle(
                      fontSize: 18
                    ),
                  ),
                ),
                theme: CountryTheme(
                  labelColor: AppColors.main,
                  alphabetTextColor: Colors.transparent,
                  alphabetSelectedBackgroundColor: Colors.transparent,
                  isShowFlag: false,
                  isShowTitle: true,
                  isShowCode: false,
                  isDownIcon: true,
                  showEnglishName: true,

                ),
                initialSelection: '+971',
                onChanged: (CountryCode? code) {
                  print(code!.name.toString());
                },
              )
            ],
          ),
        ],
      ),
    );
  }
  _lang(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(() => Languages());
      },
      child: Container(
        color: AppColors.main3,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: Text(App_Localization.of(context)!.translate("languages"),
                  style: TextStyle(
                      color: AppColors.main2,
                      fontSize: 18
                  ),),
              ),
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 10),
              child: Row(
                children: [
                  Container(
                width:
                Global.language_code == "ar" ?
                MediaQuery.of(context).size.width - 40 :
                MediaQuery.of(context).size.width - 50,
                child: Text(
                    Global.language_code == "en" ?
                    App_Localization.of(context)!.translate("english") :
                    App_Localization.of(context)!.translate("arabic"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 16
                    )),
              ),
                  Icon(
                Icons.arrow_forward_ios,color: Colors.white,size: 20,
              ),
              ],
            ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
  _currency(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showCurrencyPicker(
          context: context,
          showFlag: true,
          showCurrencyName: true,
          showCurrencyCode: true,
          onSelect: (Currency currency) {
            print('Select currency: ${currency.name}');
          },
        );
      },
      child: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        color: AppColors.main3,
        child:  Padding(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(App_Localization.of(context)!.translate("currency"),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Icon(
                  Icons.arrow_forward_ios,color: Colors.white,size: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
