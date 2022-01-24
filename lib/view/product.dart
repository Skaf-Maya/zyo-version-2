import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:zyo_version_1/const/app_colors.dart';
import 'package:zyo_version_1/const/app_localization.dart';
import 'package:zyo_version_1/const/btn_sheet.dart';
import 'package:zyo_version_1/const/top_bar.dart';
import 'package:zyo_version_1/controller/product_controller.dart';
import 'package:zyo_version_1/model/product.dart';
import 'package:zyo_version_1/view/cart.dart';

class ProductInfo extends StatelessWidget {
  Product product;
  ProductInfo(this.product);

  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()=> SafeArea(
        child:  CustomScrollView(
          slivers: [
            SliverAppBar(
              automaticallyImplyLeading: false,
              flexibleSpace: FlexibleSpaceBar(
                background: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  color: AppColors.main,
                  child: Column(
                    children: [
                      _header(context),
                      _body(context),
                    ],
                  ),
                ),
              ),
              backgroundColor: AppColors.main,
              expandedHeight: MediaQuery.of(context).size.height,
            ),
            SliverList(delegate: SliverChildListDelegate([
              Obx(() =>  Container(
                width: MediaQuery.of(context).size.width,
                color: AppColors.main,
                child: Center(
                  child: Column(
                    children: [
                      productController.selected.value==0 ? _goods(context) : _reviews(context),
                      _footer(context)
                    ],
                  ),
                ),
              ))
            ]))
          ],
        ),
      )),
    );
  }

  _header(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      height: MediaQuery.of(context).size.height * 0.1,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )
              )
            ],
          ),
          Container(
            width: 150,
            height: 70,
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
  _footer(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      productController.wishlist.value = !productController.wishlist.value;
                    },
                    child: !productController.wishlist.value ?
                    Icon(Icons.favorite_border,color: AppColors.main,size: 30,) :
                    Icon(Icons.favorite, color: Colors.red,size: 30,)
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    TopBar().success_top_bar(
                      context, App_Localization.of(context)!.translate("just_added_to_your_bag"));
                  },
                  child: Container(
                    color: AppColors.main,
                    width: MediaQuery.of(context).size.width * 0.78,
                    height: MediaQuery.of(context).size.height * 0.06,
                    child: Center(
                      child: Text(App_Localization.of(context)!.translate("add_to_bag"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
  _body(BuildContext context) {
    return Column(
      children: [
        _slider_images(context),
        SizedBox(height: 20),
        _title(product,context),
        SizedBox(height: 10),
        _price_and_rating(product,context),
      ],
    );
  }
  _slider_images(BuildContext context) {
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: productController.controller,
          options: CarouselOptions(
              height: MediaQuery.of(context).size.height * 0.67,
              autoPlay: productController.product_images.length == 1
                  ? false
                  : true,
              viewportFraction: 1,
              autoPlayInterval: Duration(seconds: 3),
              onPageChanged: (index, reason) {

                productController.set_index(index);
              }),

          itemCount: productController.product_images.length,
          itemBuilder: (BuildContext context,
              int index, int realIndex) {
            return Container(
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              decoration:BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        productController.product_images[index]),
                    fit: BoxFit.fill,
                  )),
            );
          },
        ),
        Positioned(
          bottom: 20,
          left: 5,
          right: 5,
          child: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               SizedBox(width: 50),
                Column(
                  children: [
                    Container(
                      width: 80,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.grey.withOpacity(0.6),
                          borderRadius: BorderRadius.all(Radius.circular(30))
                      ),
                      child: Center(
                          child: Text(
                            (productController.activeIndex.value+1).toString()+
                                "/" +
                                productController.product_images.length.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                            ),)
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    children: [
                      Icon(Icons.favorite, color: Colors.white,size: 30,),
                      Text("125",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                    ],
                  ),
                )
              ],
            ),
          )
        )
      ],
    );
  }
  _title(Product product,BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                child: Text(
                  product.title.toString() + product.title.toString(),
                  maxLines: 2,
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 15
                  ),),
              ),
            ],
          ),
          Column(
            children: [
              GestureDetector(
                onTap: () {
                  //todo something
                },
                child: SvgPicture.asset("assets/icons/Icon_share.svg",width: 20,),
              ),
            ],
          ),
        ],
      ),
    );
  }
  _price_and_rating(Product product, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: Text(
              product.price.toString(),
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20
              ),),
          ),
          RatingBar(
              itemSize: 20,
              initialRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              ratingWidget: RatingWidget(
                  full: Icon(Icons.star, color: Colors.white),
                  half: Icon(
                    Icons.star_half,
                    color: Colors.white,
                  ),
                  empty: Icon(
                    Icons.star_outline,
                    color: Colors.white,
                  )),
              onRatingUpdate: (value) {
                productController.ratingValue.value = value;
              }),
        ],
      ),
    );
  }
  _goods(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          _header2(context),
          _product_image(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(App_Localization.of(context)!.translate("goods"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: productController.selected.value==0 ?
                        TextDecoration.underline : TextDecoration.none
                    )
                ),
                SizedBox(width: 50,),
                GestureDetector(
                  onTap: () {
                    productController.selected.value ++;
                  },
                  child: Text(App_Localization.of(context)!.translate("reviews"),
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      )
                  ),
                ),
              ],
            ),
          ),
          _title2(product,context),
          SizedBox(height: 10),
          _price_and_rating(product,context),
          SizedBox(height: 10),
          _list_of_color(context),
          SizedBox(height: 10),
          _list_of_size(context),
          SizedBox(height: 10),
          Divider(
            color: Colors.white12,
            thickness: 5,
          ),
          GestureDetector(
           onTap: () {
             //todo something
            },
           child:  Container(
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 Column(
                   children: [
                     Row(
                       children: [
                         Transform.scale(
                           scale: 1.1,
                           child: Checkbox(
                             side: MaterialStateBorderSide.resolveWith(
                                   (states) => BorderSide(width: 1.0,
                                   color: productController.checked.value ? Colors.transparent : Colors.white),
                             ),
                             activeColor: Colors.green,
                             checkColor: Colors.black,
                             shape: CircleBorder(),
                             value: productController.checked.value,
                             onChanged: (value) {
                               productController.checked.value = value!;
                             },
                           ),
                         ),
                         Center(
                           child: Text(App_Localization.of(context)!.translate("return_police"),
                             style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 15
                             ),),
                         ),
                       ],
                     )
                   ],
                 ),
                 Column(
                   children: [
                     Padding(
                       padding: const EdgeInsets.all(10),
                       child: Icon(Icons.arrow_forward_ios,
                         color: Colors.white,size: 20,),
                     )
                   ],
                 ),
               ],
             ),
           ),
         ),
          Divider(
            color: Colors.white12,
            thickness: 5,
          ),
          _description(context),
          Divider(
            color: Colors.white12,
            thickness: 1,
          ),
          _size_information(context),
          SizedBox(height: 10)
        ],
      ),
    );
  }
  _header2(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 10),
      width: MediaQuery.of(context).size.width * 0.93,
      child:  Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    Get.back();
                  },
                  child: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  )
              )
            ],
          ),
        ],
      ),
    );
  }
  _product_image(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 80,
          height: 80,
          decoration:BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(50)),
              image: DecorationImage(
                image: AssetImage("assets/home/flash_sale/1.png"),
                fit: BoxFit.fill,
              )),
        )
      ],
    );
  }
  _title2(Product product,BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.93,
          child: Text(
            product.title.toString(),
            maxLines: 2,
            style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
        ),
      ],
    );
  }
  _list_of_color(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(App_Localization.of(context)!.translate("color")+" Red",
            style: TextStyle(
                color: Colors.white,
                fontSize: 15
            ),),
          SizedBox(height: 10,),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productController.colors.length,
                itemBuilder: (context, index) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      SizedBox(width: 10),
                      _colors(context,index),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
  _colors(BuildContext context, int index) {
    return Obx(() => GestureDetector(
      onTap: () {
        productController.select_color.value = index;
      },
      child: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
            color: productController.colors[index], //this is the important line
            borderRadius: BorderRadius.all(Radius.circular(30)),
            border: Border.all(color: productController.select_color == index.obs ?
            Colors.white : Colors.transparent , width: 2
            )
        ),
      ),
    ));
  }
  _list_of_size(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(App_Localization.of(context)!.translate("size"),
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
            ),),
          SizedBox(height: 10,),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.05,
            child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: productController.colors.length,
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      SizedBox(width: 10),
                      _sizes(context,index),
                    ],
                  );
                }),
          ),
        ],
      ),
    );
  }
  _sizes(BuildContext context, int index) {
    return Obx(() => GestureDetector(
      onTap: () {
        productController.select_size.value = index;
      },
      child: Container(
        width: 65.0,
        decoration: BoxDecoration(
           // color: Colors.red, //this is the important line
            borderRadius: BorderRadius.all(Radius.circular(25)),
            border: Border.all(color: productController.select_size == index.obs ?
            Colors.white : Colors.white24 , width: 2
            )
        ),
        child: Center(
          child: Text(
            productController.sizes[index].toString(),
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    ));
  }
  _description(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child:GestureDetector(
            onTap: () {
              _btm_sheet_desc(context);
            },
            child:  Container(
              color: Colors.transparent,
              width: MediaQuery.of(context).size.width * 0.93,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Text(App_Localization.of(context)!.translate("description"),
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 15
                        ),),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.arrow_forward_ios,
                        color: Colors.white,size: 20,)
                    ],
                  ),
                ],
              ),
            ),
          )
        ),
      ],
    );
  }
  _size_information(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(App_Localization.of(context)!.translate("model_size"),
                style: TextStyle(
                    color: AppColors.main2
                ),),
              SizedBox(width: 1),
              Text("S",
                style: TextStyle(
                    color: AppColors.main2
                ),)
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(App_Localization.of(context)!.translate("height"),
                style: TextStyle(
                    color: AppColors.main2
                ),),
              SizedBox(width: 1),
              Text("176 Cm / 69.3Inch",
                style: TextStyle(
                    color: AppColors.main2
                ),)
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(App_Localization.of(context)!.translate("bust"),
                style: TextStyle(
                    color: AppColors.main2
                ),),
              SizedBox(width: 1),
              Text("89 Cm /35Inch",
                style: TextStyle(
                    color: AppColors.main2
                ),)
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(App_Localization.of(context)!.translate("waist"),
                style: TextStyle(
                    color: AppColors.main2
                ),),
              SizedBox(width: 1),
              Text("63 Cm / 24.8Inch",
                style: TextStyle(
                    color: AppColors.main2
                ),)
            ],
          ),
          SizedBox(height: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(App_Localization.of(context)!.translate("hips"),
                style: TextStyle(
                    color: AppColors.main2
                ),),
              SizedBox(width: 1),
              Text("92 Cm / 36.2Inch",
                style: TextStyle(
                    color: AppColors.main2
                ),)
            ],
          ),
        ],
      ),
    );
  }
  _reviews(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Column(
        children: [
          _header2(context),
          _product_image(context),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.15,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    productController.selected.value --;
                  },
                  child: Text(App_Localization.of(context)!.translate("goods"),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          decoration: productController.selected.value==0 ?
                          TextDecoration.underline : TextDecoration.none
                      )
                  ),
                ),
                SizedBox(width: 50),
                Text(App_Localization.of(context)!.translate("reviews"),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        decoration: productController.selected.value==1 ?
                        TextDecoration.underline : TextDecoration.none
                    )
                ),
              ],
            ),
          ),
          _review_detail(context),
        ],
      ),
    );
  }
  _review_detail(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.93,
      child: Column(
        children: [
          Row(
              children: [
                Center(
                  child: Text(
                    App_Localization.of(context)!.translate("reviews"),
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
                SizedBox(width: 10),
                Center(
                  child: Text(
                    "(2039)",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ),
              ]),
          SizedBox(height: 25),
          Container(
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: 7,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      _list_reviews(context,index),
                      SizedBox(height: 10,)
                    ],
                  );
                }),
          )
        ],
      ),
    );
  }
  _list_reviews(BuildContext context, int index) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                      width: MediaQuery.of(context).size.width * 0.5,
                      child: Text('Andree Young',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),)),
                ],
              ),
              SizedBox(height: 5),
              Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.9,
                    child: Text(
                      'Wonderful glasses, perfect gift for my girlfor our anniversary!'
                      ,style: TextStyle(color: Colors.white , fontSize: 14),),
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
  _btm_sheet_desc(BuildContext context) {
    return showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (context)
      {
        return Container(
          height: MediaQuery.of(context).size.height * 0.8,
          color: AppColors.main,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(),
                      Center(
                        child: Text(
                        App_Localization.of(context)!.translate("description"),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18
                        ),),
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.back();
                            },
                              child: Icon(Icons.close,color: Colors.white,))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20,),
                Divider(
                  thickness: 2,
                  color: Colors.white12,
                ),
                SizedBox(height: 10,),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Column(
                    children: [
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("style"), "Casual"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("color"), "Black"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("pattern_type"), "Plain"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("length"), "Regular"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("season"), "Spring/Fall"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("type"), "Windbreaker"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("details"), "Drawstring"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("sleeve_length"), "Long Sleeve"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("neckline"), "Hooded"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("sleeve_type"), "Regular Sleeve"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("fit_type"), "Regular Fit"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("sheer"), "No"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("placket"), "Zipper"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("material"), "Polyester"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("composition"), "100% Polyester"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("fabric"), "Non-Stretch"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("care_instructions"), "Machine Wash Or ProfessionalDry Cleanr"),
                      SizedBox(height: 10,),
                      BtnSheet().btn_sheet(context,
                          App_Localization.of(context)!.translate("sku"), "Sw215548514514"),

                    ],
                  ),
                ),
                SizedBox(height: 10)
              ],
            ),
          ),
        );
      },
    );
  }
}



