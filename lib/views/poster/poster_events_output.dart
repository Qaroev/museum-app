import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:museum_resource_center/widget/big-text-widget.dart';
import 'package:museum_resource_center/widget/small-text-widget.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/afisha_controller.dart';
import '../../models/afish_model.dart';
import '../../utils/app_colors.dart';
import '../show/show_events_output.dart';

class PosterEventsOutput extends StatefulWidget {
  final AfishaModel? afishaList;

  const PosterEventsOutput({Key? key, this.afishaList}) : super(key: key);

  @override
  _PosterEventsOutputState createState() => _PosterEventsOutputState();
}

class _PosterEventsOutputState extends State<PosterEventsOutput> {
  AfishaController dataController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
        SliverAppBar(
          expandedHeight: 270.0,
          toolbarHeight: Dimensions.height60,
          toolbarTextStyle: const TextStyle(color: Colors.black),
          automaticallyImplyLeading: false,
          primary: true,
          pinned: true,
          backgroundColor: Colors.white,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: Dimensions.width30,
                height: Dimensions.height30,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.24),
                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
                margin: EdgeInsets.only(bottom: Dimensions.height20),
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: Dimensions.iconSize15,
                    )),
              ),
            ],
          ),
          actions: [
            Container(
              margin: EdgeInsets.only(
                  right: Dimensions.width10, bottom: Dimensions.height20),
              child: Row(
                children: [
                  Container(
                    width: Dimensions.width30,
                    height: Dimensions.height30,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.35),
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius10)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.ios_share,
                            size: Dimensions.iconSize15,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: Dimensions.width5,
                  ),
                  // Container(
                  //     width: Dimensions.width30,
                  //     height: Dimensions.height30,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white.withOpacity(0.24),
                  //         borderRadius:
                  //             BorderRadius.circular(Dimensions.radius10)),
                  //     child: IconButton(
                  //       onPressed: () {},
                  //       icon: Image.asset(
                  //         "assets/images/menu.png",
                  //         color: Colors.white,
                  //       ),
                  //     )),
                ],
              ),
            )
          ],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return FlexibleSpaceBar(
                  titlePadding: EdgeInsets.only(
                      bottom: Dimensions.height20, left: Dimensions.width40),
                  title: constraints.maxHeight >= 160
                      ? Container()
                      : Row(
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: Dimensions.iconSize20,
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            SizedBox(
                              width: Dimensions.width200,
                              child: Text(
                                decodeToLatin(widget.afishaList!.name ?? ''),
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width60,
                            ),
                            Icon(
                              Icons.ios_share,
                              size: Dimensions.iconSize20,
                            ),
                            SizedBox(
                              width: Dimensions.width5,
                            ),
                            // Image.asset(
                            //   "assets/images/menu.png",
                            //   color: Colors.black,
                            //   width: Dimensions.width20,
                            //   height: Dimensions.height20,
                            // ),
                          ],
                        ),
                  background: Container(
                    height: Dimensions.height300,
                    child: Stack(
                      children: [
                        Stack(
                          children: [
                            Image.network(
                              height: 320,
                              decodeToLatin(widget.afishaList!.img!),
                              fit: BoxFit.fill,
                              headers: const {
                                'Cookie':
                                    'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                              },
                              width: double.infinity,
                              loadingBuilder: (BuildContext context,
                                  Widget child,
                                  ImageChunkEvent? loadingProgress) {
                                if (loadingProgress == null) {
                                  return child;
                                }
                                return Shimmer.fromColors(
                                  baseColor: Colors.black.withOpacity(0.8),
                                  highlightColor: Colors.black.withOpacity(0.3),
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Colors.black.withOpacity(0.5),
                                    ),
                                  ),
                                );
                              },
                              errorBuilder: (BuildContext context,
                                  Object exception, StackTrace? stackTrace) {
                                return Image.asset('assets/images/picture.png');
                              },
                            ),
                            Container(
                              height: Dimensions.height300,
                              padding: EdgeInsets.only(
                                  left: Dimensions.width20,
                                  right: Dimensions.width20,
                                  bottom: Dimensions.height5),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      (widget.afishaList!.pushkin_card == true)
                                          ? SmallTextWidget(
                                              text: "Пушкинская карта",
                                              size: Dimensions.font11,
                                              color:
                                                  Colors.white.withOpacity(0.8),
                                              overflow: TextOverflow.clip,
                                            )
                                          : Container(),
                                      BigTextWidget(
                                        text: decodeToLatin(widget
                                            .afishaList!.type_afisha['name']),
                                        size: Dimensions.font15,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w500,
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 264,
                                    child: Text(
                                      decodeToLatin(
                                          widget.afishaList!.name ?? ''),
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(
                                    height: Dimensions.height5,
                                  ),
                                  Container(
                                    height: 20,
                                  )
                                  // DotsIndicator(
                                  //   position: 1,
                                  //   dotsCount: 4,
                                  //   decorator: DotsDecorator(
                                  //     color: Colors.white,
                                  //     activeColor: Colors.white,
                                  //     size: const Size.square(4.0),
                                  //     activeSize: const Size(30.0, 4.0),
                                  //     activeShape: RoundedRectangleBorder(
                                  //         borderRadius:
                                  //             BorderRadius.circular(5.0)),
                                  //   ),
                                  // ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: Dimensions.width20),
                          child: ElevatedButton(
                            onPressed: () {
                              showModalBottomSheet(
                                  isScrollControlled: true,
                                  backgroundColor: Colors.transparent,
                                  elevation: 0,
                                  context: context,
                                  builder: (BuildContext context) {
                                    return Container(
                                      height: Dimensions.height600,
                                      padding: const EdgeInsets.all(20),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                                Dimensions.radius30),
                                            topRight: Radius.circular(
                                                Dimensions.radius30)),
                                      ),
                                      child: Column(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              Navigator.pop(context);
                                            },
                                            child: SizedBox(
                                              width: 30,
                                              child: Divider(
                                                thickness: 5,
                                                color: Color(0xFFB2B2B2),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: 10,
                                          ),
                                          BigTextWidget(
                                            text: "Записаться на событие",
                                            size: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF120D26),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Form(
                                            child: Column(
                                              children: [
                                                TextField(
                                                    decoration: InputDecoration(
                                                        hintText:
                                                            "Как вас зовут?",
                                                        hintStyle: TextStyle(
                                                            fontSize: 18,
                                                            color: Color(
                                                                0xFF120D26),
                                                            fontWeight:
                                                                FontWeight
                                                                    .w400)),
                                                    keyboardType:
                                                        TextInputType.text),
                                                TextField(
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Контактный телефон",
                                                      hintStyle: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Color(0xFF120D26),
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  keyboardType:
                                                      TextInputType.phone,
                                                ),
                                                TextField(
                                                  decoration: InputDecoration(
                                                      hintText:
                                                          "Контактный email",
                                                      hintStyle: TextStyle(
                                                          fontSize: 18,
                                                          color:
                                                              Color(0xFF120D26),
                                                          fontWeight:
                                                              FontWeight.w400)),
                                                  keyboardType: TextInputType
                                                      .emailAddress,
                                                ),
                                                TextField(
                                                  decoration: InputDecoration(
                                                    hintText:
                                                        "Планируемая дата и время события",
                                                    hintStyle: TextStyle(
                                                        fontSize: 18,
                                                        color:
                                                            Color(0xFF120D26),
                                                        fontWeight:
                                                            FontWeight.w400),
                                                  ),
                                                  keyboardType:
                                                      TextInputType.datetime,
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Container(
                                            width: double.maxFinite,
                                            height: 48,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(14),
                                              color: Color(0xFF2F3A4B),
                                            ),
                                            child: Center(
                                                child: BigTextWidget(
                                              text: "Оставить заявку",
                                              size: 15,
                                              fontWeight: FontWeight.w500,
                                              color: Colors.white,
                                            )),
                                          )
                                        ],
                                      ),
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(
                                  left: Dimensions.width30,
                                  right: Dimensions.width30,
                                  top: Dimensions.height10,
                                  bottom: Dimensions.height10),
                              primary: const Color(0xFF2F3A4B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
                            ),
                            child: const Text(
                              "Записаться",
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                  ));
            },
          ),
        ),
        SliverFillRemaining(
          hasScrollBody: false,
          fillOverscroll: false,
          child: Container(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigTextWidget(
                    text: "Расписание",
                    size: Dimensions.font18,
                    fontWeight: FontWeight.w600,
                    color: const Color(0xFF06070D),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          widget.afishaList!.seanses2.length,
                          (index) => Container(
                                width: Dimensions.width118,
                                height: Dimensions.height54,
                                margin:
                                    EdgeInsets.only(right: Dimensions.width10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: const Color(0xFFD98639))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigTextWidget(
                                      text:
                                          "${getMonth(widget.afishaList!.seanses2[index]['date'])}",
                                      size: Dimensions.font15,
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    BigTextWidget(
                                      text:
                                          "${getTime(widget.afishaList!.seanses2[index]['date'])}",
                                      color: Colors.black,
                                      size: Dimensions.font15,
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigTextWidget(
                    text: "О событии",
                    size: Dimensions.font18,
                    color: const Color(0xFF06070D),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  Text(
                    "Место проведения :  ${decodeToLatin(widget.afishaList!.place ?? '')}",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                  // Divider(thickness: 2),
                  // BigTextWidget(
                  //   text: "Адрес : ул. Советская, 82",
                  //   size: Dimensions.font14,
                  // ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Дата события : ${getNameMonth(widget.afishaList!)}",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text:
                        "Контактный телефон : ${widget.afishaList!.phone ?? ''}",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Возрастное ограничение : 6+",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text:
                        "Стоимость билета от : ${decodeToLatin(widget.afishaList!.price ?? '')} руб.",
                    size: Dimensions.font14,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  Text(
                    decodeToLatin(widget.afishaList!.description ?? ''),
                    style: TextStyle(color: Colors.black, fontSize: 14),
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  BigTextWidget(
                    text: 'Рекомендуем еще',
                    size: 18,
                    color: Color(0xFF06070D),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  GetBuilder<AfishaController>(
                      init: AfishaController(),
                      builder: (evt) {
                        if (evt.isDataLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        if (evt.isDataLoading) {
                          return const Center(
                              child: CircularProgressIndicator());
                        }
                        return SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                                dataController.afishaList.length >= 10
                                    ? 10
                                    : dataController.afishaList.length,
                                (index) => GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    PosterEventsOutput(
                                                      afishaList: dataController
                                                          .afishaList[index],
                                                    )));
                                      },
                                      child: Container(
                                        height: Dimensions.height270,
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
                                                        decodeToLatin(
                                                            dataController
                                                                .afishaList[index]
                                                                .img!),
                                                        fit: BoxFit.cover,
                                                        width: double.infinity,
                                                        height: double.infinity,
                                                        headers: const {
                                                          'Cookie':
                                                          'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                                        },
                                                        loadingBuilder: (BuildContext
                                                        context,
                                                            Widget child,
                                                            ImageChunkEvent?
                                                            loadingProgress) {
                                                          if (loadingProgress ==
                                                              null) {
                                                            return child;
                                                          }
                                                          return Shimmer
                                                              .fromColors(
                                                            baseColor: Colors.grey
                                                                .withOpacity(0.8),
                                                            highlightColor: Colors
                                                                .grey
                                                                .withOpacity(0.3),
                                                            child: Container(
                                                              width: Dimensions
                                                                  .width172 +
                                                                  5,
                                                              decoration: BoxDecoration(
                                                                  color: Colors
                                                                      .grey[300],
                                                                  borderRadius: BorderRadius.all(
                                                                      Radius.circular(
                                                                          Dimensions
                                                                              .radius10))),
                                                            ),
                                                          );
                                                        },
                                                        errorBuilder:
                                                            (BuildContext context,
                                                            Object exception,
                                                            StackTrace?
                                                            stackTrace) {
                                                          return Image.asset(
                                                              'assets/images/picture.png');
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
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Row(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      dataController
                                                                  .afishaList[
                                                                      index]
                                                                  .pushkin_card ==
                                                              true
                                                          ? SizedBox(
                                                              width: 70,
                                                              height: Dimensions
                                                                  .height50,
                                                              child:
                                                                  SmallTextWidget(
                                                                text:
                                                                    "Пушкинская карта",
                                                                size: Dimensions
                                                                    .font14,
                                                                color: Colors
                                                                    .white
                                                                    .withOpacity(
                                                                        0.8),
                                                                overflow:
                                                                    TextOverflow
                                                                        .clip,
                                                              ),
                                                            )
                                                          : Container(),
                                                      SmallTextWidget(
                                                          text: decodeToLatin(
                                                              dataController
                                                                      .afishaList[
                                                                          index]
                                                                      .type_afisha[
                                                                  'name']),
                                                          size:
                                                              Dimensions.font14,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          color: Colors.white
                                                              .withOpacity(
                                                                  0.8)),
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
                                                padding:
                                                    const EdgeInsets.all(5),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomRight:
                                                          Radius.circular(
                                                              Dimensions
                                                                  .radius10),
                                                      bottomLeft:
                                                          Radius.circular(
                                                              Dimensions
                                                                  .radius10)),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    BigTextWidget(
                                                      text: getNameMonth(
                                                          dataController
                                                                  .afishaList[
                                                              index]),
                                                      size: Dimensions.font12,
                                                      color: AppColors
                                                          .textBigColor,
                                                      fontWeight:
                                                          FontWeight.w300,
                                                    ),
                                                    const Spacer(),
                                                    Text(
                                                      decodeToLatin(
                                                          dataController
                                                              .afishaList[index]
                                                              .name!),
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12,
                                                        overflow: TextOverflow
                                                            .ellipsis,
                                                        fontWeight:
                                                            FontWeight.w500,
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
                                    )),
                          ),
                        );
                      }),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                ],
              )),
        )
      ]),
      bottomNavigationBar: Container(
        width: 120,
        height: 43,
        margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 10),
        decoration: const BoxDecoration(
            color: Color(0xFF2F3A4B),
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(),
            const Text('Купить билет',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w500)),
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
      return '$month1 по $month2';
    }
    return '';
  }
}
