import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';

import '../../../controller/afisha_controller.dart';
import '../../../models/afish_model.dart';
import '../../../models/exhibitions.dart';
import '../../../utils/app_colors.dart';
import '../../../utils/dimensions.dart';
import '../../../utils/utils.dart';
import '../../../widget/big-text-widget.dart';
import '../../../widget/small-text-widget.dart';
import '../../collections/collections_events_output.dart';
import '../../poster/poster_events_output.dart';
import '../../show/show_events_output.dart';

class SearchPageBody extends StatefulWidget {
  final List<dynamic>? collection;
  final List<dynamic>? afisha;
  final List<dynamic>? posters;
  final List<dynamic>? souveners;

  const SearchPageBody({
    Key? key,
    this.afisha,
    this.posters,
    this.collection,
    this.souveners,
  }) : super(key: key);

  @override
  _SearchPageBodyState createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  bool showPage = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: widget.afisha!.isEmpty && widget.collection!.isEmpty
          ? Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: Dimensions.height80,
                ),
                Image.asset("assets/icons/search.png"),
                SizedBox(
                  height: Dimensions.height50,
                ),
                BigTextWidget(
                  text: "Начните поиск здесь",
                  size: Dimensions.font24,
                  fontWeight: FontWeight.w900,
                ),
              ],
            )
          : ListView(
              children: [
                SizedBox(
                  width: 250,
                  child: Text(
                    "Вот что нам удалось найти по Вашему запросу",
                    style: TextStyle(
                      fontSize: Dimensions.font20,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimensions.height20,
                ),
                if (widget.afisha!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(
                        text: "Aфиши",
                        size: Dimensions.font20,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                if (widget.afisha!.isNotEmpty)
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                if (widget.afisha!.isNotEmpty)
                  SizedBox(
                      height: 280,
                      child: ListView.builder(
                          itemCount: widget.afisha!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return _buildPostItem(
                              widget.afisha![index],
                            );
                          })),
                SizedBox(
                  height: Dimensions.height20,
                ),
                if (widget.collection!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(
                        text: "Коллекции",
                        size: Dimensions.font20,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                if (widget.collection!.isNotEmpty)
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                if (widget.collection!.isNotEmpty)
                  SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: widget.collection!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CollectionsEventsOutput(
                                              collection:
                                                  widget.collection![index],
                                            )));
                              },
                              child: Stack(
                                alignment: Alignment.bottomCenter,
                                clipBehavior: Clip.none,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 15.0),
                                    child: SizedBox(
                                      width: 200,
                                      height: 200,
                                      child: ClipRRect(
                                        borderRadius:
                                            BorderRadius.circular(10), // Ima
                                        child: SizedBox.fromSize(
                                          size: const Size.fromRadius(20),
                                          // Image radius
                                          child: Image.network(
                                            decodeToLatin(
                                                widget.collection![index].img!),
                                            fit: BoxFit.cover,
                                            headers: const {
                                              'Cookie':
                                                  'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                            },
                                            height: Dimensions.height158,
                                            loadingBuilder:
                                                (BuildContext context,
                                                    Widget child,
                                                    ImageChunkEvent?
                                                        loadingProgress) {
                                              if (loadingProgress == null) {
                                                return child;
                                              }
                                              return Shimmer.fromColors(
                                                baseColor: Colors.grey
                                                    .withOpacity(0.8),
                                                highlightColor: Colors.grey
                                                    .withOpacity(0.3),
                                                child: Container(
                                                  width: Dimensions.width152,
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
                                      ),
                                    ),
                                  ),
                                  Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            right: 15.0, bottom: 1),
                                        child: Image.asset(
                                          'assets/images/bottom_overlay.png',
                                          width: 200,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                      Container(
                                        width: 200,
                                        padding: const EdgeInsets.only(
                                            left: 10, bottom: 10, right: 10),
                                        child: BigTextWidget(
                                          text: decodeToLatin(
                                              widget.collection![index].name!),
                                          size: Dimensions.font15,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          })),
                if (widget.posters!.isNotEmpty)
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                if (widget.posters!.isNotEmpty)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(
                        text: "Вставки",
                        size: Dimensions.font20,
                        fontWeight: FontWeight.w800,
                      ),
                    ],
                  ),
                if (widget.posters!.isNotEmpty)
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                if (widget.posters!.isNotEmpty)
                  SizedBox(
                      height: 200,
                      child: ListView.builder(
                          itemCount: widget.posters!.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return _buildShowItem(
                              widget.posters![index],
                            );
                          }))
              ],
            ),
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
                    )));
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
                    height: 218,
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius10),
                        topRight: Radius.circular(Dimensions.radius10),
                      ),
                    ),
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

  Widget _buildShowItem(ExhibitionsModel exhibitions) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ShowEventsOutput(
                      exhibitionsModel: exhibitions,
                    )));
      },
      child: Container(
        height: Dimensions.height220,
        padding: const EdgeInsets.only(left: 10),
        child: Stack(
          alignment: AlignmentDirectional.bottomCenter,
          children: [
            SizedBox(
              width: Dimensions.width172,
              height: Dimensions.height208,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10), // Ima
                child: SizedBox.fromSize(
                  size: const Size.fromRadius(20),
                  // Image radius
                  child: Image.network(
                    exhibitions.img!,
                    fit: BoxFit.cover,
                    headers: const {
                      'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                    },
                    height: Dimensions.height158,
                    loadingBuilder: (BuildContext context, Widget child,
                        ImageChunkEvent? loadingProgress) {
                      if (loadingProgress == null) {
                        return child;
                      }
                      return Shimmer.fromColors(
                        baseColor: Colors.grey.withOpacity(0.8),
                        highlightColor: Colors.grey.withOpacity(0.3),
                        child: Container(
                          width: Dimensions.width152,
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                  height: Dimensions.height55,
                  width: Dimensions.width172 + 5,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(Dimensions.radius10),
                        topRight: Radius.circular(Dimensions.radius10),
                        bottomRight: Radius.circular(Dimensions.radius10),
                        bottomLeft: Radius.circular(Dimensions.radius10)),
                    color: Colors.white,
                  ),
                  child: Center(
                    child: Text(
                      exhibitions.name ?? '',
                      maxLines: 2,
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                  )),
            )
          ],
        ),
      ),
    );
  }
}
