import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/views/show/show_events_output.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/exhibitions_controller.dart';
import '../../models/exhibitions.dart';
import '../../utils/dimensions.dart';
import '../../widget/big-text-widget.dart';

//Выставка
class ShowEvents extends StatefulWidget {
  const ShowEvents({Key? key}) : super(key: key);

  @override
  _ShowEventsState createState() => _ShowEventsState();
}

class _ShowEventsState extends State<ShowEvents> {
  ExhibitionsController exhibitionsController = Get.find();
  int typeIndex = -1;
  var sortItems = [];

  sortItemsByType(List<ExhibitionsModel> afishaTypes, type) {
    sortItems = [];
    for (var element in afishaTypes) {
      if (element.type_afisha!.name == type) {
        sortItems.add(element);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => exhibitionsController.isDataLoading.value
        ? const Center(child: CircularProgressIndicator())
        : Container(
            margin: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BigTextWidget(
                  text: "Наши выставки",
                  size: Dimensions.font20,
                  fontWeight: FontWeight.w800,
                ),
                SizedBox(
                  height: Dimensions.height10,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: List.generate(
                      exhibitionsController.exhibitionsTypes!.length,
                      (index) => Container(
                        margin: EdgeInsets.only(right: Dimensions.width20),
                        child: ElevatedButton(
                          onPressed: () {
                            if (index == typeIndex) {
                              typeIndex = -1;
                              sortItems = [];
                            } else {
                              typeIndex = index;
                              sortItemsByType(exhibitionsController.exhibitions!,
                                  exhibitionsController.exhibitionsTypes![index]);
                            }
                            setState(() {});
                          },
                          style: ElevatedButton.styleFrom(
                            elevation: 1,
                            backgroundColor: typeIndex == index
                                ? const Color(0xFF4579FF).withOpacity(0.7)
                                : const Color(0xFFF3F8F9),
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius50),
                                side: BorderSide(
                                    color: Color(0xFF12153D).withOpacity(0.5))),
                          ),
                          child: Text(
                            exhibitionsController.exhibitionsTypes![index],
                            style: const TextStyle(color: Color(0xFF434670)),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                Expanded(
                  child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 1,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20),
                      itemCount: sortItems.isNotEmpty
                          ? sortItems.length
                          : exhibitionsController.exhibitions!.length,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ShowEventsOutput(
                                          exhibitionsModel: sortItems.isNotEmpty
                                              ? sortItems[index]
                                              : exhibitionsController
                                                  .exhibitions![index],
                                        )));
                          },
                          child: listItems(sortItems.isNotEmpty
                              ? sortItems[index]
                              : exhibitionsController.exhibitions![index]),
                        );
                      }),
                )
              ],
            )));
  }

  listItems(exhibitions) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 300,
              alignment: Alignment.bottomLeft,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Image.network(
                exhibitions.img ?? '',
                headers: const {
                  'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                },
                fit: BoxFit.cover,
                height: 300,
                loadingBuilder: (BuildContext context, Widget child,
                    ImageChunkEvent? loadingProgress) {
                  if (loadingProgress == null) {
                    return child;
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.white.withOpacity(0.8),
                    highlightColor: Colors.white.withOpacity(0.3),
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
            Image.asset(
              'assets/images/overlay.png',
              fit: BoxFit.cover,
              width: Dimensions.width178,
              height: 300,
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 28.0, left: 10, right: 10),
          child: Text(
            exhibitions.name ?? '',
            style: const TextStyle(color: Colors.white),
          ),
        )
      ],
    );
  }
}
