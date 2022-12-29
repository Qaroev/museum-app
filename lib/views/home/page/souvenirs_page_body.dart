import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/models/products_model.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/product_controller.dart';
import '../../../utils/dimensions.dart';
import '../../../widget/big-text-widget.dart';

class SouvenirsPageBody extends StatefulWidget {
  const SouvenirsPageBody({Key? key}) : super(key: key);

  @override
  _SouvenirsPageBodyState createState() => _SouvenirsPageBodyState();
}

class _SouvenirsPageBodyState extends State<SouvenirsPageBody> {
  ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
        init: ProductController(),
        builder: (evt) {
          if (evt.isDataLoading.value) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                  children: List.generate(
                      productController.products!.length >= 10
                          ? 10
                          : productController.products!.length,
                      (index) => _buildSouvenirsItem(
                          productController.products![index]))));
        });
  }

  Widget _buildSouvenirsItem(Products products) {
    return Container(
      width: Dimensions.width327,
      height: Dimensions.height132,
      padding: const EdgeInsets.all(10),
      margin: EdgeInsets.only(right: Dimensions.width10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(Dimensions.radius10),
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
                color: Color(0xFFEFF6F6),
                blurRadius: 20.0,
                spreadRadius: 10.0,
                offset: Offset(10, 20)),
          ]),
      child: Row(
        children: [
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
          SizedBox(
            width: Dimensions.width10,
          ),
          SizedBox(
            width: Dimensions.width176,
            height: Dimensions.height80,
            child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                BigTextWidget(
                  text: products.categories[0]['name'],
                  size: Dimensions.font13,
                  color: const Color(0xFF747688),
                ),
                const SizedBox(height: 10),
                Text(products.name ?? '',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500)),
                const SizedBox(height: 5),
                Text('${products.price} руб.',
                    style: const TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w500))
              ],
            ),
          )
        ],
      ),
    );
  }
}
