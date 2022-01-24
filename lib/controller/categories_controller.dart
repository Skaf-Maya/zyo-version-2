import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/model/categories.dart';
import 'package:zyo_version_1/model/product.dart';
import 'package:zyo_version_1/model/sub_categories.dart';

class CategoriesController extends GetxController {

  TextEditingController search_controller = TextEditingController();
  CarouselController controller = CarouselController();
  var select_category = 0.obs;
  var select_sub_category = 0.obs;


  List<SubCategory> sub_categories = [
    SubCategory(id: 1, title: "JUST FOR YOU", image: ""),
    SubCategory(id: 2, title: "NEW IN", image: ""),
    SubCategory(id: 3, title: "TRENDS", image: ""),
    SubCategory(id: 4, title: "12.12 SALE", image: ""),
    SubCategory(id: 5, title: "DRESSES", image: ""),
    SubCategory(id: 6, title: "JACKETS", image: ""),
    SubCategory(id: 7, title: "SHORTS", image: ""),
    SubCategory(id: 8, title: "SKIRTS", image: ""),
    SubCategory(id: 9, title: "ATHLEISURE WOMEN", image: ""),
    SubCategory(id: 10, title: "SLEEP & LOUNG", image: ""),
  ];

  List<Category> categories = [
    Category(id: 1, title: "WOMAN",image: ""),
    Category(id: 2, title: "MEN", image: ""),
    Category(id: 3, title: "BAGS & ACCESSORIES",image: ""),
    Category(id: 4, title: "BEAUTY ESSENTIALS",image: ""),
  ];

  List<Product> products = <Product>[
    Product(id: 1, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 2, title: "rop Top Dragon Totem", price: "300.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 3, title: "rop Top Dragon Totem", price: "500.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 4, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 5, title: "rop Top Dragon Totem", price: "600.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 6, title: "rop Top Dragon Totem", price: "100.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 7, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 8, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 9, title: "rop Top Dragon Totem", price: "400.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 10, title: "rop Top Dragon Totem", price: "150.00\$",image: "assets/home/flash_sale/1.png"),
  ];
}