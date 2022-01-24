import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/controller/home_controller.dart';
import 'package:zyo_version_1/view/cart.dart';
import 'package:zyo_version_1/view/categories.dart';
import 'package:zyo_version_1/view/new_collection.dart';
import 'package:zyo_version_1/view/product.dart';
import 'package:zyo_version_1/view/settings.dart';
import 'package:zyo_version_1/view/sub_category.dart';
import 'package:zyo_version_1/view/wishlist.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  HomeController homeController = Get.put(HomeController());
  SearchDemoSearchDelegate delegate = SearchDemoSearchDelegate();
  String _url = 'https://flutter.dev';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.key,
      bottomNavigationBar: _btnNavBar(context),
      body: Obx(() {
        return  homeController.select_nav_bar == 0 ? _home(context) :
        homeController.select_nav_bar == 1 ? Categories() :
        homeController.select_nav_bar == 2 ? NewCollection() :
        homeController.select_nav_bar == 3 ? Wishlist() : Settings();
      }),
    );
  }

  _btnNavBar(BuildContext context) {
    return Obx(() => Container(
      width: MediaQuery.of(context).size.width,
      child: BottomNavigationBar(
        mouseCursor: SystemMouseCursors.grab,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: TextStyle(fontSize: 11),
        selectedLabelStyle: TextStyle(fontSize: 11,fontWeight: FontWeight.bold),
        selectedItemColor: AppColors.main,
        unselectedItemColor: Colors.black87,
        currentIndex: homeController.select_nav_bar.value,
        onTap: (index) {
          homeController.set_nav_bar(index);
        },
        items: [
          BottomNavigationBarItem(
            icon:
            homeController.select_nav_bar.value==0 ?
            Icon(Icons.home, size: 25) :
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/Icon_home.svg',width: 15,height: 15,
              ),
            ),
            label: App_Localization.of(context)!.translate("home"),
          ),
          BottomNavigationBarItem(
            icon: homeController.select_nav_bar.value == 1 ?
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/categories2.svg',width: 15,height: 15,
              ),
            ) :
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/categories.svg',width: 15,height: 15,
              ),
            ),
            label: App_Localization.of(context)!.translate("categories"),
          ),
          BottomNavigationBarItem(
            icon: homeController.select_nav_bar.value == 2 ?
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/new_collection2.svg',width: 18,height: 18,
              ),
            ) :
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/new_collection.svg', width: 18,height: 18
              ),
            ),
            label: App_Localization.of(context)!.translate("new"),
          ),
          BottomNavigationBarItem(
            icon: homeController.select_nav_bar.value == 3 ?
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/wishlist2.svg',width: 15,height: 15,
              ),
            ) :
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/wishlist_icon.svg',width: 15,height: 15,
              ),
            ),
            label: App_Localization.of(context)!.translate("wishlist"),
          ),
          BottomNavigationBarItem(
            icon: homeController.select_nav_bar.value == 4 ?
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/settings2.svg',width: 15,height: 15,
              ),
            ) :
            Padding(
              padding: const EdgeInsets.all(3),
              child: SvgPicture.asset('assets/icons/Icon_settings.svg',width: 15,height: 15,
              ),
            ),
            backgroundColor: Colors.white,
            label: App_Localization.of(context)!.translate("settings"),
          ),
        ],
      ),
    ),
    );
  }
  _home(BuildContext context) {
    return SafeArea(
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
    );
  }
  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.12,
      child: Row(
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
                          //todo something
                        },
                        child: SvgPicture.asset('assets/icons/noun_message.svg',width: 20,height: 20,
                        ),
                      )
                    ],
                  ),
                  SizedBox(width: 15),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          homeController.select_nav_bar.value =3;
                        },
                        child: SvgPicture.asset('assets/icons/noun_Heart.svg',
                          width: 20,height: 20, color: Colors.white,
                        ),
                      )

                    ],
                  ),
                ],
              ),
            ],
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            height: MediaQuery.of(context).size.height * 0.1,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/logo/logo2.png"),
                )),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                children: [
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
                             height: 50,
                             width: 20,
                               child: Icon(Icons.shopping_bag_outlined,color: Colors.white,)),
                         ),
                       ],
                     ),
                     Positioned(
                       top: 28,
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
              ),
            ],
          ),
        ],
      ),
    );
  }
  _body(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home/home1.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.07,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.categories.length,
                  itemBuilder: (context, index) {
                    return _categories(index);
                  }),
            ),
            Slider(
              value: double.parse(homeController.slider_value.value.toString()),
              onChanged: (value) {
                homeController.slider_value.value = double.parse(value.round().toString());
              },
              min: 0,
              max: (double.parse(homeController.categories.length.toString())-1)+0.5,
              activeColor: Colors.white,
              inactiveColor: AppColors.main2,
            ),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.08,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home/home2.png"),
                  fit: BoxFit.cover
              )
          ),
        ),
        Column(
          children: [
            SizedBox(height: 10,),
            _slider_categories(context),
            SizedBox(height: 10),
            Container(
                width: MediaQuery.of(context).size.width * 0.2,
                alignment: Alignment.topCenter,
                child: LinearProgressIndicator(
                  value: (double.parse(homeController.activeIndex.value.toString())/3),
                  color: Colors.white,
                  backgroundColor: AppColors.main2,
                )
            ),
            SizedBox(height: 10),
            Center(
              child: Text(
                App_Localization.of(context)!.translate("deal_of_the_day"),
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.25,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home/home3.png"),
                  fit: BoxFit.cover
              )
          ),
          child:  Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text("CYPER MONDAY",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25
                        )
                    ),
                  ),
                  Container(
                    child: Text("Shopping Guide",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        )
                    ),
                  ),
                  Container(
                    child: Text("Games, prizes, and more you don't wanto miss!",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 10
                        )
                    ),
                  ),
                  SizedBox(height: 10,),
                  GestureDetector(
                    onTap: () {
                      //todo something
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      height: MediaQuery.of(context).size.height * 0.04,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(50))
                      ),
                      child: Center(
                        child: Text(App_Localization.of(context)!.translate("view_more")),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
        Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 10,bottom: 10),
              width: MediaQuery.of(context).size.width * 0.93,
              child: Row(
                children: [
                  Text(
                    App_Localization.of(context)!.translate("flash_sale"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20
                    ),
                  ),
                ],
              )
            ),
            Container(
              width: MediaQuery.of(context).size.width * 0.93,
              height: MediaQuery.of(context).size.height * 0.23,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: homeController.flash_sales_image.length,
                  itemBuilder: (context, index) {
                    return Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.23,
                          child:  _flash_sale(context,index),
                        ),
                        SizedBox(width: 15)
                      ],
                    );
                  }),
            ),
          ],
        ),
        SizedBox(height: 15),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height * 0.3,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/home/home4.png"),
                  fit: BoxFit.cover
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("COMMING SOON",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 20
                ),),
              SizedBox(height: 10,),
              GestureDetector(
                onTap: () {
                  //todo something
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.height * 0.04,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(50))
                  ),
                  child: Center(
                    child: Text(App_Localization.of(context)!.translate("pre_order")),
                  ),
                ),
              )
            ],
          ),
        ),
        _products(context),
      ],
    );
  }
  _categories(int index) {
    return GestureDetector(
      onTap: () {
        homeController.slider_value.value = double.parse(index.toString());
      },
      child: Row(
        children: [
          SizedBox(width: 20),
          Text(
            homeController.categories[index].title.toString(),
            style: TextStyle(
                color: homeController.slider_value.value == double.parse(index.toString()) ?
                Colors.white : AppColors.main2
            ),
          ),
          SizedBox(width:18)
        ],
      ),
    );
  }
  _slider_categories(BuildContext context) {
    return CarouselSlider(
      carouselController: homeController.controller,
      options: CarouselOptions(
        viewportFraction: 1,
        height: 130.0,
        enableInfiniteScroll: false,
        enlargeCenterPage: true,
        // autoPlay: true,
        pauseAutoPlayOnTouch: true,
        aspectRatio: 2.0,
        onPageChanged: (index, reason) {
          homeController.set_index(index);
        },
      ),
      items: homeController.sub_categories.map((c){
        return Builder(
            builder:(BuildContext context){
              return Container(
                  child: Row(
                    children: [
                      _sub_categories(context, 0),
                      _sub_categories(context, 1),
                      _sub_categories(context, 2),
                      _sub_categories(context, 3)
                    ],
                  )
              );
            }
        );
      }).toList(),
    );
  }
  _sub_categories(BuildContext context, int index) {
    return  SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.25,
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(()=>SubCategory());
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.2,
                    height: MediaQuery.of(context).size.height * 0.1,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white , width: 2),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                            image: AssetImage(
                              homeController.sub_categories[index].image.toString())
                        )
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Column(
                  children: [
                    Text(
                      homeController.sub_categories[index].title.toString(),
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  _flash_sale(BuildContext context, int index) {
    return Column(
      children: [
        Container(
          child: GestureDetector(
            onTap: () {
              //todo something
            },
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.25,
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                            homeController.flash_sales_image[index],)
                      )
                  ),
                ),
                SvgPicture.asset("assets/icons/flash_sale.svg")
              ],
            ),
          ),
        ),
        SizedBox(height: 8),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text("US\$2.00",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.25,
          child: Text("US\$5.00",
            style: TextStyle(
                decorationColor: Colors.white,
                decoration: TextDecoration.lineThrough,
                color: AppColors.main2,
                fontSize: 13
            ),),
        )
      ],
    );
  }
  _products(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Container(
        child: GridView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                childAspectRatio: 4/7,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10
            ),
            itemCount: homeController.products.length,
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
          flex: 3,
          child:GestureDetector(
            onTap: () {
              Get.to(()=>ProductInfo(homeController.products[index]));
            },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(15)),
                image: DecorationImage(
                    image: AssetImage(homeController.products[index].image.toString()),
                    fit: BoxFit.cover
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Align(
                    alignment: Alignment.bottomRight,
                    child: Obx(() => GestureDetector(
                      onTap: () {
                        homeController.wishlistIcon.value = !homeController.wishlistIcon.value;
                      },
                      child: homeController.wishlistIcon.value
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
          ),),
        Expanded(
            flex:1,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(homeController.products[index].price.toString(),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15
                ),),
            ))
      ],
    );
  }
  _pressed_on_search(BuildContext context) async {
    final int? selected = await showSearch<int>(
      context: context,
      delegate: delegate,
    );
    if (selected != null && selected != homeController.Selected) {
      homeController.Selected = selected;
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
        color: Colors.black,
        elevation: 0,
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
  String get searchFieldLabel => 'search'.tr;

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
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
          showSuggestions(context);
        },
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



