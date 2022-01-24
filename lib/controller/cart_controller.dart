import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/view/checkout.dart';

class CartController extends GetxController {

  var count = 1.obs;
  TextEditingController code = TextEditingController();
  var validate = false.obs;

  increase() {
    count.value ++;
  }

  decrease() {
    if(count.value > 1) {
      count.value --;
    }
    else {
      //delete from cart
    }
  }

  btm_sheet_checkout(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.75,
          color: AppColors.main,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: GestureDetector(
                      onTap: () {
                        Get.back();
                      },
                      child: Align(
                        alignment: Alignment.centerRight,
                          child: Icon(Icons.close,color: Colors.white,)))
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.95,
                  height: MediaQuery.of(context).size.height * 0.4,
                  child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) {
                        return Row(
                          children: [
                            SizedBox(width: 10),
                            Container(
                              width: MediaQuery.of(context).size.width * 0.42,
                              height: MediaQuery.of(context).size.height * 0.32,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10)),
                                  color: Colors.white,
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage("assets/home/flash_sale/1.png")
                                  )
                              ),
                            )
                          ],
                        );
                      }),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    children: [
                      Text(App_Localization.of(context)!.translate("totals")+" ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                      ),),
                      Text("\$300.00",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                        ),),
                    ],
                  ),
                ),
                SizedBox(height: 50),
                GestureDetector(
                  onTap: () {
                    Get.to(()=>Checkout());
                  },
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: 50,
                    child: Center(
                      child: Text(App_Localization.of(context)!.translate("checkout"),
                        style: TextStyle(
                            color: AppColors.main,
                            fontSize: 18,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
  checkout(BuildContext context) {
    if(code.text.isEmpty) {
      validate.value = true;
    }
    else {
      validate.value = false;
      btm_sheet_checkout(context);
    }
  }

  List<Color> colors = [
    Colors.blueGrey, Colors.red, Colors.blue, Colors.yellow].obs as List<Color>;

}

