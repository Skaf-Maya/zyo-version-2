import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/controller/wishlist_controller.dart';

class Wishlist extends StatelessWidget {
  Wishlist({Key? key}) : super(key: key);


  WishlistController wishlistController = Get.put(WishlistController());

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
                  _body(context)
                ],
              ),
            ),
          ),
        )
    );
  }

  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height * 0.1,
      child: Center(
        child: Text(App_Localization.of(context)!.translate("wish_list"),
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
                color: Colors.white)
        ),
      ),
    );
  }
  _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.57,
                mainAxisSpacing: 15,
                crossAxisSpacing: 10
            ),
            itemCount: wishlistController.wish_list.length,
            itemBuilder: (BuildContext ctx, index) {
              return _list_wishlist(context,index);
            }),
      ),
    );
  }
  _list_wishlist(BuildContext context, int index) {
    return Column(
      children: [
        Expanded(
          flex: 7,
          child: Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              image: DecorationImage(
                  image: AssetImage(
                      wishlistController.wish_list[index].image.toString()
                  ),
                  fit: BoxFit.cover
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(5),
              child: Align(
                  alignment: Alignment.bottomRight,
                  child: Obx(()=> GestureDetector(
                    onTap: () {
                      wishlistController.wishlist.value = !wishlistController.wishlist.value;
                    },
                    child: wishlistController.wishlist.value
                        ? Icon(
                      Icons.favorite_border,
                      color: Colors.white,
                      size: 25,
                    )
                        : Icon(
                      Icons.favorite_outlined,
                      color: AppColors.main,
                      size: 25,
                    ),
                  ))
              ),
            ),
          ),),
        Expanded(
          flex: 1,
          child:  _price(context,index),),
        Expanded(
          child: _title(context,index),),
      ],
    );
  }
  _price(BuildContext context,int index) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          wishlistController.wish_list[index].price.toString(),
          style: TextStyle(
              color: Colors.white,
              fontSize: 18
          ),),
      ),
    );
  }
  _title(BuildContext context,int index) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          wishlistController.wish_list[index].title.toString(),
          maxLines: 2,
          style: TextStyle(
              color: Colors.white,
              fontSize: 10
          ),),
      ),
    );
  }
}


