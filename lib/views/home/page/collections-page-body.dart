import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/controller/collection_controller.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:shimmer/shimmer.dart';

import '../../../utils/utils.dart';
import '../../../widget/big-text-widget.dart';

class CollectionPageBody extends StatelessWidget {
  CollectionController collectionController = Get.put(CollectionController());

  CollectionPageBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Obx(() => collectionController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: collectionController.collectionItems!.length >= 10
                  ? 20
                  : collectionController.collectionItems!.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  clipBehavior: Clip.none,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 15.0),
                      child: SizedBox(
                        width: 200,
                        height: 200,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10), // Ima
                          child: SizedBox.fromSize(
                            size: const Size.fromRadius(20),
                            // Image radius
                            child: Image.network(
                              decodeToLatin(collectionController
                                  .collectionItems![index].img!),
                              fit: BoxFit.cover,
                              height: Dimensions.height158,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Shimmer.fromColors(
                                  baseColor: Colors.white.withOpacity(0.8),
                                  highlightColor: Colors.white.withOpacity(0.3),
                                  child: Container(
                                    width: Dimensions.width152,
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset('assets/image/person.png');
                              },
                            ),
                          ),
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(right: 15.0,bottom: 1),
                          child: Image.asset(
                            'assets/images/bottom_overlay.png',
                            width: 200,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Container(
                          width: 200,
                          padding: const EdgeInsets.only(left: 10,bottom: 10,right: 10),
                          child: BigTextWidget(
                            text: decodeToLatin(collectionController
                                .collectionItems![index].name!),
                            size: Dimensions.font15,
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    )
                  ],
                );
              })),
    );
  }
}
