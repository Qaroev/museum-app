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
    return SizedBox(
      height: 280,
      child: Obx(() => dataController.isDataLoading.value
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: dataController.afishaList.length >= 10
                  ? 20
                  : dataController.afishaList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return _buildPostItem(
                  dataController.afishaList[index],
                );
              })),
    );
  }

  Widget _buildPostItem(AfishaModel afishaItems) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
            MaterialPageRoute(
                builder: (context) => PosterEventsOutput(
                  afishaList: afishaItems,
                ))
        );

      },
      child: SizedBox(
        height: Dimensions.height220,
        child: Stack(
          children: [
            Stack(
              clipBehavior: Clip.antiAlias,
              children: [
                GestureDetector(
                  child: Container(
                    width: Dimensions.width172 + 5,
                    height: Dimensions.height208,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius10),
                        topRight: Radius.circular(Dimensions.radius10),
                      ),
                    ),
                    child: Image.network(
                      decodeToLatin(afishaItems.img!),
                      fit: BoxFit.fill,
                      height: Dimensions.height208,
                      loadingBuilder: (BuildContext context, Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.white.withOpacity(0.8),
                          highlightColor: Colors.white.withOpacity(0.3),
                          child: Container(
                            width: Dimensions.width172 + 5,
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
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Image.asset(
                    'assets/images/top_overlay.png',
                    width: Dimensions.width172 + 5,
                    color: Colors.black,
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
                margin: EdgeInsets.only(
                  right: Dimensions.width10,
                ),
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
                    BigTextWidget(
                      text: decodeToLatin(afishaItems.name!),
                      size: Dimensions.font14,
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
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
