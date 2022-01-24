import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/model/categories.dart';
import 'package:zyo_version_1/model/product.dart';
import 'package:zyo_version_1/model/sub_categories.dart';

class HomeController extends GetxController {


  GlobalKey<ScaffoldState> key = GlobalKey<ScaffoldState>();
  CarouselController controller = CarouselController();
  var select_nav_bar = 0.obs;
  var slider_value = 0.0.obs;
  var wishlistIcon = true.obs;
  int Selected = 0;
  var activeIndex = 0.obs;

  set_index(int selected){
    activeIndex.value=selected;
  }

  set_nav_bar(int select) {
    select_nav_bar.value=select;
  }

  List<Category> categories = [
    Category(id: 1, title: "WOMAN",image: ""),
    Category(id: 2, title: "MEN", image: ""),
    Category(id: 3, title: "BAGS & ACCESSORIES",image: ""),
    Category(id: 4, title: "BEAUTY ESSENTIALS",image: ""),
  ];

  List<SubCategory> sub_categories = [
    SubCategory(id: 1, title: "Dresses", image: "assets/home/sub_categories/Layer -1.png"),
    SubCategory(id: 2, title: "Jackets", image: "assets/home/sub_categories/Layer 2.png"),
    SubCategory(id: 3, title: "ShortsS", image: "assets/home/sub_categories/Layer 3.png"),
    SubCategory(id: 4, title: "Skirts", image: "assets/home/sub_categories/Path 602.png"),
  ];

  List flash_sales_image = [
    "assets/home/flash_sale/1.png",
    "assets/home/flash_sale/2.png",
    "assets/home/flash_sale/1.png",
    "assets/home/flash_sale/2.png",
    "assets/home/flash_sale/1.png",
    "assets/home/flash_sale/2.png",
    "assets/home/flash_sale/1.png",
    "assets/home/flash_sale/2.png",
    "assets/home/flash_sale/1.png",
  ].obs;

  List<Product> products = <Product>[
    Product(id: 1, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 2, title: "rop Top Dragon Totem", price: "300.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 3, title: "rop Top Dragon Totem", price: "500.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 4, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
  ];


}