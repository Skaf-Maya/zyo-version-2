import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/controller/sub_category_controller.dart';
import 'package:zyo_version_1/view/cart.dart';
import 'package:zyo_version_1/view/product.dart';

class SubCategory extends StatelessWidget {
  SubCategory({Key? key}) : super(key: key);

  SubCategoryController subCategoryController = Get.put(SubCategoryController());
  SearchDemoSearchDelegate delegate = SearchDemoSearchDelegate();

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
      ),
    );
  }

  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                          onTap: () {
                            Get.back();
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                            size: 20,
                          )
                      )
                    ],
                  ),
                  SizedBox(width: 5),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          Get.back();
                        },
                        child: Text("Dresses",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18
                            )),
                      )
                    ],
                  ),
                ],
              )
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          //todo something
                        },
                        child: SvgPicture.asset('assets/icons/sort.svg',
                          width: 20,height: 20,
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      icon: const Icon(Icons.search,
                          color: Colors.white),
                      onPressed: () => _pressed_on_search(context)
                  ),
                  Stack(
                    children: [
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(()=>Cart());
                            },
                            child: Container(
                                height: 45,
                                width: 20,
                                child: Icon(Icons.shopping_bag_outlined,color: Colors.white,)),
                          ),
                        ],
                      ),
                      Positioned(
                          top: 25,
                          child: Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: Center(
                              child: Text("10",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 7,
                                    fontWeight: FontWeight.bold
                                ),),
                            ),
                          ))
                    ],
                  )
                ],
              )
            ],
          ),
        ],
      ),
          Divider(
            thickness: 2,
            color: AppColors.main2,
          )
        ],
      ),
    );
  }
  _body(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
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
            itemCount: subCategoryController.products.length,
            itemBuilder: (BuildContext ctx, index) {
              return _list_products(context,index);
            }),
      ),
    );
  }
  _list_products(BuildContext context, int index) {
    return Column(
      children: [
        Expanded(
            flex: 7,
            child: GestureDetector(
              onTap: () {
                Get.to(()=>ProductInfo(subCategoryController.products[index]));
              },
              child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  image: DecorationImage(
                      image: AssetImage(subCategoryController.products[index].image.toString()),
                      fit: BoxFit.cover
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Obx(() => GestureDetector(
                        onTap: () {
                          subCategoryController.wishlist.value = !subCategoryController.wishlist.value;
                        },
                        child: subCategoryController.wishlist.value
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
              ),
            )),
        Expanded(
          flex: 1,
          child: _price(context,index),),
        Expanded(
          child: _title(context,index),),
      ],
    );
  }
  _price(BuildContext context,int index) {
    return  Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(subCategoryController.products[index].price.toString(),
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
        alignment: Alignment.bottomLeft,
        child: Container(
          child: Text(subCategoryController.products[index].title.toString(),
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,
              fontSize: 10
            ),),
        ),
      ),
    );
  }
  _pressed_on_search(BuildContext context) async {
    final int? selected = await showSearch<int>(
      context: context,
      delegate: delegate,
    );
    if (selected != null && selected != subCategoryController.Selected) {
      subCategoryController.Selected = selected;
    }
  }
}

class SearchDemoSearchDelegate extends SearchDelegate<int> {

  final List<int> _data = List<int>.generate(100001, (int i) => i).reversed.toList();
  final List<int> _history = <int>[42607, 85604, 66374, 44, 174];


  @override
  ThemeData appBarTheme(BuildContext context) {
    return super.appBarTheme(context).copyWith(
      appBarTheme: AppBarTheme(
        color: AppColors.main, //new AppBar color
      ),
      textSelectionTheme: TextSelectionThemeData(
        selectionHandleColor: Colors.red, // Change bubble to red
        cursorColor: Colors.black,
      ),

      hintColor: Colors.white,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: Colors.white,
        ),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final Iterable<int> suggestions = query.isEmpty
        ? _history
        : _data.where((int i) => '$i'.startsWith(query));

    return Container(
      color: AppColors.main,
      child: _SuggestionList(
        query: query,
        suggestions: suggestions.map<String>((int i) => '$i').toList(),
        onSelected: (String suggestion) {
          query = suggestion;
          showResults(context);
        },
      ),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    final int? searched = int.tryParse(query);
    if (searched == null || !_data.contains(searched)) {
      return Container(
        color: AppColors.main,
        child: Center(
          child: Text(
            '" $query "\n is not exists',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      );
    }

    return Container(
      color: AppColors.main,
      child: Center(
        //when i click on suggestion
      ),
    );
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return <Widget>[
      Container(
        color:AppColors.main,
        child: IconButton(
          icon: const Icon(Icons.clear,color: Colors.white,),
          onPressed: () {
            query = '';
            showSuggestions(context);
          },
        ),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
   return null;
  }
}
class _SuggestionList extends StatelessWidget {
  const _SuggestionList({required this.suggestions, required this.query, required this.onSelected});

  final List<String> suggestions;
  final String query;
  final ValueChanged<String> onSelected;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: suggestions.length,
      itemBuilder: (BuildContext context, int i) {
        final String suggestion = suggestions[i];
        return ListTile(
          title: Text(suggestion.substring(query.length),
            style: TextStyle(color: Colors.white),),
          onTap: () {
            onSelected(suggestion);
          },
        );
      },
    );
  }
}

