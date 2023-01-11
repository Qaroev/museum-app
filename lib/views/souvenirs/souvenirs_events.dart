import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/controller/exhibitions_controller.dart';
import 'package:museum_resource_center/controller/product_controller.dart';
import 'package:museum_resource_center/main.dart';
import 'package:museum_resource_center/models/products_model.dart';
import 'package:museum_resource_center/views/souvenirs/souvenirs_events_output.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/dimensions.dart';
import '../../utils/local_storage_service.dart';
import '../../utils/utils.dart';
import '../../widget/big-text-widget.dart';

class SouvenirsEvents extends StatefulWidget {
  const SouvenirsEvents({Key? key}) : super(key: key);

  @override
  _SouvenirsEventsState createState() => _SouvenirsEventsState();
}

class _SouvenirsEventsState extends State<SouvenirsEvents> {
  ProductController productController = Get.put(ProductController());
  int typeIndex = -1;
  var sortItems = [];

  sortItemsByType(List<Products> products, type) {
    sortItems = [];
    for (var element in products) {
      if (element.categories[0]['name'] == type) {
        sortItems.add(element);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => productController.isDataLoading.value
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(
                      text: "Каталог сувениров Музея",
                      size: Dimensions.font20,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    productController.productsTypes != null
                        ? SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                productController.productsTypes!.length,
                                (index) => Container(
                                  margin: EdgeInsets.only(
                                      right: Dimensions.width20),
                                  child: ElevatedButton(
                                    onPressed: () {
                                      if (index == typeIndex) {
                                        typeIndex = -1;
                                        sortItems = [];
                                      } else {
                                        typeIndex = index;
                                        sortItemsByType(
                                            productController.products!,
                                            productController
                                                .productsTypes![index]['name']);
                                      }
                                      setState(() {});
                                    },
                                    style: ElevatedButton.styleFrom(
                                      elevation: 1,
                                      backgroundColor: typeIndex == index
                                          ? const Color(0xFF4579FF)
                                              .withOpacity(0.7)
                                          : const Color(0xFFF3F8F9),
                                      shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(
                                              Dimensions.radius50),
                                          side: BorderSide(
                                              color: const Color(0xFF12153D)
                                                  .withOpacity(0.5))),
                                    ),
                                    child: Text(
                                      productController.productsTypes![index]
                                          ['name'],
                                      style: const TextStyle(
                                          color: Color(0xFF434670)),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : Container(),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: sortItems.isNotEmpty
                            ? sortItems.length
                            : productController.products!.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          SouvenirsEventsOutput(
                                            products: sortItems.isNotEmpty
                                                ? sortItems[index]
                                                : productController.products![index],
                                          )));
                            },
                            child: listItems(sortItems.isNotEmpty
                                ? sortItems[index]
                                : productController.products![index]),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ));
  }

  listItems(Products products) {
    return Container(
      width: Dimensions.width380,
      height: Dimensions.height106,
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(Dimensions.radius15)),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: Dimensions.width73,
                height: Dimensions.height96,
                decoration: BoxDecoration(
                    color: const Color(0xFFBEBEBE),
                    borderRadius: BorderRadius.circular(Dimensions.radius15)),
              ),
              Container(
                width: Dimensions.width73,
                height: Dimensions.height96,
                alignment: Alignment.bottomLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Image.network(
                  products.images[0]['src'] ?? '',
                  fit: BoxFit.cover,
                  height: 300,
                  headers: const {
                    'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                  },
                  loadingBuilder: (BuildContext context, Widget child,
                      ImageChunkEvent? loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Shimmer.fromColors(
                      baseColor: Colors.grey.withOpacity(0.8),
                      highlightColor: Colors.grey.withOpacity(0.3),
                      child: Container(
                        width: Dimensions.width92,
                        height: Dimensions.height92,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                        ),
                      ),
                    );
                  },
                  errorBuilder: (BuildContext context, Object exception,
                      StackTrace? stackTrace) {
                    return Image.asset('assets/images/picture.png');
                  },
                ),
              ),
            ],
          ),
          SizedBox(
            width: Dimensions.width40,
          ),
          SizedBox(
            width: Dimensions.width180,
            height: Dimensions.height80,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(products.categories[0]['name'],
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.font13,
                        fontWeight: FontWeight.w400)),
                Text(products.name ?? '',
                    maxLines: 2,
                    style: TextStyle(
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w400)),
                Text('${products.price} руб.',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: Dimensions.font16,
                        fontWeight: FontWeight.w600))
              ],
            ),
          ),
          InkWell(
            onTap: () async {
              var res = await LocalStorageService().getData('favorites');
              if (res == null) {
                dynamic user = {
                  "id": products.id,
                };
                LocalStorageService().saveData(
                  'favorites',
                  encode([user]),
                );
                addToBasket.add(1);
              } else {
                List<dynamic> childrens = decode(res);
                var newArr =
                childrens.where((e) => e['id'] == products.id).toList();
                if (newArr.isEmpty) {
                  dynamic user = {
                    "id": products.id,
                  };
                  childrens.add(user);
                  LocalStorageService().saveData(
                    'favorites',
                    encode(childrens),
                  );
                  addToBasket.add(childrens.length);
                }
              }
              ScaffoldMessenger.of(context)
                  .showSnackBar(const SnackBar(content: Text('Добавлено в корзину')));
            },
            child: Container(
                width: 20,
                height: 20,
                alignment: Alignment.topRight,
                margin: EdgeInsets.only(
                    right: Dimensions.width10, top: Dimensions.height10),
                child: const Icon(Icons.shopping_cart_outlined)),
          )
        ],
      ),
    );
  }
}
