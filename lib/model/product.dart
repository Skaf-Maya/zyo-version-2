import 'dart:convert';

class Products {
  Products({
    this.products
});

  List<Product>? products;

  factory Products.fromJson(String str) => Products.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Products.fromMap(Map<String, dynamic> json) => Products(
    products: List<Product>.from(json["products"].map((x) => Product.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "products": List<dynamic>.from(products!.map((x) => x.toMap())),
  };
}

class Product {
  Product({
    this.id,
    this.title,
    this.price,
    this.image
});

  int? id;
  String? title;
  String? price;
  String? image;
  bool favorite = false;

  factory Product.fromJson(String str) => Product.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Product.fromMap(Map<String,dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    image: json["image"]
  );

  Map<String,dynamic> toMap() =>{
    "id": id,
    "title": title,
    "price": price,
    "image": image
  };

}

