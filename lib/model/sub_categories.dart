import 'dart:convert';

class SubCategories {
  SubCategories({
    this.subcategories
  });

  List<SubCategory>? subcategories;

  factory SubCategories.fromJson(String str) => SubCategories.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubCategories.fromMap(Map<String, dynamic> json) => SubCategories(
    subcategories: List<SubCategory>.from(json["subcategories"].map((x) => SubCategory.fromMap(x))),
  );

  Map<String, dynamic> toMap() => {
    "subcategories": List<dynamic>.from(subcategories!.map((x) => x.toMap())),
  };
}

class SubCategory {
  SubCategory({
    this.id,
    this.title,
    this.image
  });

  int? id;
  String? title;
  String? image;

  factory SubCategory.fromJson(String str) => SubCategory.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory SubCategory.fromMap(Map<String,dynamic> json) => SubCategory(
      id: json["id"],
      title: json["title"],
      image: json["image"]
  );

  Map<String,dynamic> toMap() =>{
    "id": id,
    "title": title,
    "image": image
  };

}

