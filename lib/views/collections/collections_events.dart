import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/collection_controller.dart';
import '../../utils/dimensions.dart';
import '../../widget/big-text-widget.dart';
import 'collections_events_output.dart';

class CollectionsEvents extends StatefulWidget {
  const CollectionsEvents({Key? key}) : super(key: key);

  @override
  _CollectionsEventsState createState() => _CollectionsEventsState();
}

class _CollectionsEventsState extends State<CollectionsEvents> {
  CollectionController collectionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BigTextWidget(
              text: "Наши коллекции",
              size: Dimensions.font20,
              fontWeight: FontWeight.w800,
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  7,
                  (index) => Container(
                    margin: EdgeInsets.only(right: Dimensions.width20),
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 1,
                        primary: const Color(0xFFF3F8F9),
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(Dimensions.radius50),
                            side: BorderSide(
                                color:
                                    const Color(0xFF12153D).withOpacity(0.5))),
                      ),
                      child: const Text(
                        "Конкурс",
                        style: TextStyle(color: Color(0xFF434670)),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: Dimensions.height20,
            ),
            Obx(() => collectionController.isDataLoading.value
                ? const Center(child: CircularProgressIndicator())
                : Expanded(
                    child: GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 1,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20),
                        itemCount: collectionController.collectionItems!.length,
                        itemBuilder: (BuildContext context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                           CollectionsEventsOutput(
                                            collection: collectionController.collectionItems![index],
                                          )));
                            },
                            child: Stack(
                              alignment: Alignment.bottomCenter,
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: Dimensions.width178,
                                      height: 300,
                                      alignment: Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        collectionController
                                                .collectionItems![index].img ??
                                            '',
                                        fit: BoxFit.cover,
                                        height: 300,
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Shimmer.fromColors(
                                            baseColor:
                                                Colors.white.withOpacity(0.8),
                                            highlightColor:
                                                Colors.white.withOpacity(0.3),
                                            child: Container(
                                              width: Dimensions.width92,
                                              height: Dimensions.height92,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                          );
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Image.asset(
                                              'assets/images/picture.png');
                                        },
                                      ),
                                    ),
                                    Image.asset(
                                      'assets/images/overlay.png',
                                      fit: BoxFit.cover,
                                      width: Dimensions.width178,
                                      height: 300,
                                    )
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      bottom: 28.0, left: 10, right: 10),
                                  child: Text(
                                    decodeToLatin(collectionController
                                            .collectionItems![index].name ??
                                        ''),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 3,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          );
                        }),
                  ))
          ],
        ));
  }
}
