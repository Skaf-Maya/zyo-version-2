import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/model/categories.dart';
import 'package:zyo_version_1/model/product.dart';

class NewCollectionController extends GetxController {

  TextEditingController search_controller = TextEditingController();
  var select_category = 0.obs;
  var wishlist = false.obs;

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