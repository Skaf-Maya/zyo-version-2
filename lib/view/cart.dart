import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/controller/cart_controller.dart';

class Cart extends StatelessWidget {
  Cart({Key? key}) : super(key: key);

  CartController cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Obx(() => SafeArea(
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
      ))
    );
  }
  
  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Icon(Icons.close,color: Colors.white,)),
          Text(App_Localization.of(context)!.translate("shopping_bag"),
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold
          ),),
          Column()
        ],
      ),
    );
  }
  _body(BuildContext context) {
    return Column(
      children: [
        _cart(context),
        _totals(context),
        SizedBox(height: 40),
        _code(context),
        SizedBox(height: 100),
        _footer(context),
        SizedBox(height: 20),

      ],
    );
  }
  _cart(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: 4,
        itemBuilder: (context, index) {
          return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/home/flash_sale/1.png"),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.2,
                    width: MediaQuery.of(context).size.width * 0.6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Container(
                          width: MediaQuery.of(context).size.width * 0.6,
                          child: Text(
                            "Crop Top Dragon Totem Print Let",
                            style: TextStyle(
                                overflow: TextOverflow.ellipsis,
                                color: Colors.white,
                                fontSize: 12),
                          ),
                        )),
                        Expanded(
                            flex: 1,
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Text(
                                "US\$9.00",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight:
                                    FontWeight.bold),
                              ),
                            ),),
                        Expanded(
                            flex: 1,
                            child:  Container(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: Row(
                                children: [
                                  Text(
                                    "US\$0.99",
                                    style: TextStyle(
                                      color: AppColors.main2,
                                      fontSize: 10,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  Text(
                                    App_Localization.of(context)!.translate("cheaper_than_added"),
                                    style: TextStyle(
                                      color: AppColors.main2,
                                      fontSize: 10,
                                    ),
                                  )
                                ],
                              ),
                            ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Container(
                                  height: 20,
                                  width: MediaQuery.of(context).size.width * 0.18,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("S /",
                                        style: TextStyle(fontSize: 12),
                                      ),
                                      Container(
                                        width: 8,
                                        height: 8,
                                        decoration: BoxDecoration(
                                            color: cartController.colors[index],
                                            shape: BoxShape.circle
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Container(
                                  height: 30,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.white , width: 1),
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Row(
                                    children: [
                                      IconButton(
                                        onPressed: () {
                                          cartController.decrease();
                                        },
                                        icon: Icon(
                                          Icons.remove,
                                          size: 15,
                                        ), color: Colors.white,
                                      ),
                                      Obx(() =>
                                          Text(cartController.count.value.toString(),
                                            style: TextStyle(
                                              color: Colors.white,),
                                          ),),
                                      IconButton(
                                        onPressed: () {
                                          cartController.increase();
                                        },
                                        icon: Icon(
                                          Icons.add,
                                          size: 15,
                                        ),
                                        color: Colors.white,)
                                    ],
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(height: 10,),
              Divider(
                color: Colors.white,
                thickness: 1,
              ),
              SizedBox(height: 10,),
            ],
          );
          //return _cart_item(context, index);
        },
      ),
    );
  }
  _totals(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width * 0.93,
          child: Row(
            children: [
              Text(
                App_Localization.of(context)!.translate("totals"),
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  color: Colors.white
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 20),
        _sub_total(context),
        const SizedBox(height: 25),
        _shipping(context)
      ],
    );
  }
  _sub_total(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                App_Localization.of(context)!.translate("sub_total"),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
            ],
          ),
          SizedBox(width: 5),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: LayoutBuilder(
              builder: (BuildContext context,
                  BoxConstraints constraints) {
                final boxWidth = constraints.constrainWidth();
                final dashWidth = 4.0;
                final dashHeight = 2.0;
                final dashCount =
                (boxWidth / (2 * dashWidth)).floor();
                return Flex(
                  children: List.generate(dashCount, (_) {
                    return SizedBox(
                      width: dashWidth,
                      height: dashHeight,
                      child: const DecoratedBox(
                        decoration:
                        BoxDecoration(color: Colors.white),
                      ),
                    );
                  }),
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                );
              },
            ),
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$30.00",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _shipping(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                App_Localization.of(context)!.translate("shipping"),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),
              ),
            ],
          ),
          SizedBox(width: 5,),
          Flexible(
            flex: 1,
            fit: FlexFit.loose,
            child: LayoutBuilder(
              builder: (BuildContext context,
                  BoxConstraints constraints) {
                final boxWidth = constraints.constrainWidth();
                final dashWidth = 4.0;
                final dashHeight = 2.0;
                final dashCount =
                (boxWidth / (2 * dashWidth)).floor();
                return Flex(
                  children: List.generate(dashCount, (_) {
                    return SizedBox(
                      width: dashWidth,
                      height: dashHeight,
                      child: const DecoratedBox(
                        decoration:
                        BoxDecoration(color: Colors.white),
                      ),
                    );
                  }),
                  mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
                  direction: Axis.horizontal,
                );
              },
            ),
          ),
          SizedBox(width: 5,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "\$0.0",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 15
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
  _code (BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 70,
            width: MediaQuery.of(context).size.width * 0.7,
            child: TextField(
              style: TextStyle(color: Colors.white),
              controller: cartController.code,
              cursorColor: Colors.white,
              keyboardType: TextInputType.number,
              textAlignVertical: TextAlignVertical.center,
              decoration: InputDecoration(
                focusedErrorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.red)),
                errorText: cartController.validate.value && cartController.code.text.isEmpty ?
                App_Localization.of(context)!.translate("please_enter_the_code") : null,
                errorBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5),
                    borderSide: BorderSide(color: Colors.red)),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white,width: 2),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                hintText: App_Localization.of(context)!.translate("enter_voucher_code"),
                hintStyle: TextStyle(color: Colors.white,fontSize: 15),
                contentPadding: EdgeInsets.all(10),
              ),
            ),
          ),
          GestureDetector(
              onTap: () {
                if(cartController.code.text.isEmpty) {
                  cartController.validate.value = true;
                }
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 35,
                    child: Text(App_Localization.of(context)!.translate("apply"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                      ),),
                  ),
                  Container(
                    height: 10,
                  )
                ],
              )
          ),
        ],
      ),
    );
  }
  _footer(BuildContext context) {
    return GestureDetector(
      onTap: () => cartController.checkout(context),
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.93,
        height: 50,
        child: Center(
          child: Text(App_Localization.of(context)!.translate("checkout")+ "(4)",
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
}