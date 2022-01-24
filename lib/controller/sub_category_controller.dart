import 'package:get/get.dart';
import 'package:zyo_version_1/model/product.dart';

class SubCategoryController extends GetxController {

  int Selected = 0;
  var wishlist = true.obs;
  var select_color = 0.obs;

  List<Product> products = <Product>[
    Product(id: 1, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 2, title: "rop Top Dragon Totem", price: "300.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 3, title: "rop Top Dragon Totem", price: "500.00\$",image: "assets/home/flash_sale/1.png"),
    Product(id: 4, title: "rop Top Dragon Totem", price: "200.00\$",image: "assets/home/flash_sale/1.png"),
  ];

}