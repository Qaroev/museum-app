import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/models/afish_model.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/afisha_controller.dart';
import '../../../utils/app_colors.dart';
import '../../../widget/big-text-widget.dart';
import '../../../widget/small-text-widget.dart';
import '../../poster/poster_events_output.dart';

class PosterPageBody extends StatefulWidget {
  const PosterPageBody({Key? key}) : super(key: key);

  @override
  _PosterPageBodyState createState() => _PosterPageBodyState();
}

class _PosterPageBodyState extends State<PosterPageBody> {
  AfishaController dataController = Get.put(AfishaController());
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AfishaController>(
        init: AfishaController(),
        builder: (evt) {

          if (evt.isDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (evt.isDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          return SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: dataController.afishaList.length >= 10
                      ? 20
                      : dataController.afishaList.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return _buildPostItem(
                      dataController.afishaList[index],
                    );
                  }));
        });
  }

  Widget _buildPostItem(AfishaModel afishaItems) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PosterEventsOutput(
                      afishaList: afishaItems,
                    )));
      },
      child: Container(
        height: Dimensions.height220,
        padding: const EdgeInsets.all(5),
        child: Column(
          children: [
            Stack(
              children: [
                SizedBox(
                  width:
                  Dimensions.width172 + 5,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Ima
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(20),
                      // Image radius
                      child: Image.network(
                        decodeToLatin(afishaItems.img!),
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: double.infinity,
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
                              width: Dimensions.width172 + 5,
                              decoration: BoxDecoration(
                                  color: Colors.grey[300],
                                  borderRadius: BorderRadius.all(Radius.circular(Dimensions.radius10))
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
                  ),
                ),
                SizedBox(
                  width:
                  Dimensions.width172 + 5,
                  height: 150,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Ima
                    child: SizedBox.fromSize(
                      size: const Size.fromRadius(20),
                      // Image radius
                      child: Image.asset(
                        'assets/images/top_overlay.png',
                        color: Colors.black,
                        width:
                        Dimensions.width172 + 5,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      afishaItems.pushkin_card == true
                          ? SizedBox(
                              width: 70,
                              height: Dimensions.height50,
                              child: SmallTextWidget(
                                text: "Пушкинская карта",
                                size: Dimensions.font14,
                                color: Colors.white.withOpacity(0.8),
                                overflow: TextOverflow.clip,
                              ),
                            )
                          : Container(),
                      SmallTextWidget(
                          text: decodeToLatin(afishaItems.type_afisha['name']),
                          size: Dimensions.font14,
                          overflow: TextOverflow.ellipsis,
                          color: Colors.white.withOpacity(0.8)),
                    ],
                  ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: Dimensions.height75,
                width: Dimensions.width172 + 5,
                padding: const EdgeInsets.all(5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(Dimensions.radius10),
                      bottomLeft: Radius.circular(Dimensions.radius10)),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    BigTextWidget(
                      text: getNameMonth(afishaItems),
                      size: Dimensions.font12,
                      color: AppColors.textBigColor,
                      fontWeight: FontWeight.w300,
                    ),
                    const Spacer(),
                    Text(
                      decodeToLatin(afishaItems.name!),
                      maxLines: 2,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                        overflow: TextOverflow.ellipsis,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const Spacer()
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getNameMonth(AfishaModel afishaItems) {
    if (afishaItems.seanses2 != null) {
      var month1 = getMonth(afishaItems.seanses2[0]['date']);
      var month2 = getMonth(
          afishaItems.seanses2[afishaItems.seanses2.length - 1]['date']);
      return 'c $month1 по $month2';
    }
    return '';
  }
}
