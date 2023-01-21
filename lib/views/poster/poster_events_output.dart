import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/yandex.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:museum_resource_center/widget/big-text-widget.dart';
import 'package:museum_resource_center/widget/small-text-widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';

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
  final date = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final email = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: SafeArea(
        child: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            toolbarHeight: Dimensions.height60,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: true,
            pinned: true,
            floating: false,
            centerTitle: true,
            backgroundColor: Colors.white,
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
                    background: SizedBox(
                      height: 500,
                      width: MediaQuery.of(context).size.width,
                      child: Stack(
                        children: [
                          Image.network(
                            decodeToLatin(widget.afishaList!.img!),
                            height: 500,
                            fit: BoxFit.fill,
                            headers: const {
                              'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                            },
                            width: double.infinity,
                            loadingBuilder: (BuildContext context, Widget child,
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
                          Stack(
                            alignment: Alignment.bottomCenter,
                            children: [
                              Image.asset(
                                'assets/images/bottom_overlay.png',
                                height: 90,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                                color: Colors.black,
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
                                        Column(
                                          children: [
                                            (widget.afishaList!.pushkin_card ==
                                                    true)
                                                ? SmallTextWidget(
                                                    text: "Пушкинская карта",
                                                    size: Dimensions.font11,
                                                    color: Colors.white
                                                        .withOpacity(0.8),
                                                    overflow: TextOverflow.clip,
                                                  )
                                                : Container(),
                                            SizedBox(
                                              width: 264,
                                              child: Text(
                                                decodeToLatin(
                                                    widget.afishaList!.name ??
                                                        ''),
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ],
                                        ),
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
                                      height: Dimensions.height5,
                                    ),
                                    Container(
                                      height: 20,
                                    )
                                  ],
                                ),
                              ),
                              Container(
                                alignment: Alignment.bottomRight,
                                color: Colors.transparent,
                                child: ElevatedButton(
                                  onPressed: () async {},
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14.0),
                                    ),
                                    backgroundColor: Colors.transparent,
                                  ),
                                  child: Text(''),
                                ),
                              ),
                            ],
                          ),
                          Stack(
                            alignment: Alignment.topCenter,
                            children: [
                              Image.asset(
                                'assets/images/fade 4.png',
                                height: 150,
                                width: MediaQuery.of(context).size.width,
                                fit: BoxFit.fill,
                                color: Colors.black,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(18.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Image.asset(
                                          'assets/images/back.png',
                                          height: 40,
                                          width: 40,
                                          fit: BoxFit.fill,
                                        )),
                                    Image.asset(
                                      'assets/images/share.png',
                                      height: 40,
                                      width: 40,
                                      fit: BoxFit.fill,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
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
                padding: const EdgeInsets.all(10),
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
                                  margin: EdgeInsets.only(
                                      right: Dimensions.width10),
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
                      text:
                          "Дата события : ${getNameMonth(widget.afishaList!)}",
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
                          var items = dataController.afishaList
                              .where((element) =>
                                  element.id != widget.afishaList!.id &&
                                  element.type_afisha['name'] ==
                                      widget.afishaList!.type_afisha['name'])
                              .toList();
                          print(items);
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: List.generate(
                                  items.length >= 10 ? 10 : items.length,
                                  (index) => GestureDetector(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PosterEventsOutput(
                                                        afishaList:
                                                            items[index],
                                                      )));
                                        },
                                        child: Container(
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // Ima
                                                      child: SizedBox.fromSize(
                                                        size: const Size
                                                            .fromRadius(20),
                                                        // Image radius
                                                        child: Image.network(
                                                          decodeToLatin(
                                                              items[index]
                                                                  .img!),
                                                          fit: BoxFit.cover,
                                                          width:
                                                              double.infinity,
                                                          height:
                                                              double.infinity,
                                                          headers: const {
                                                            'Cookie':
                                                                'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                                          },
                                                          loadingBuilder:
                                                              (BuildContext
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
                                                              baseColor: Colors
                                                                  .grey
                                                                  .withOpacity(
                                                                      0.8),
                                                              highlightColor:
                                                                  Colors
                                                                      .grey
                                                                      .withOpacity(
                                                                          0.3),
                                                              child: Container(
                                                                width: Dimensions
                                                                        .width172 +
                                                                    5,
                                                                decoration: BoxDecoration(
                                                                    color: Colors
                                                                            .grey[
                                                                        300],
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(Dimensions.radius10))),
                                                              ),
                                                            );
                                                          },
                                                          errorBuilder:
                                                              (BuildContext
                                                                      context,
                                                                  Object
                                                                      exception,
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
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10), // Ima
                                                      child: SizedBox.fromSize(
                                                        size: const Size
                                                            .fromRadius(20),
                                                        // Image radius
                                                        child: Image.asset(
                                                          'assets/images/top_overlay.png',
                                                          color: Colors.black,
                                                          width: Dimensions
                                                                  .width172 +
                                                              5,
                                                          fit: BoxFit.fill,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        items[index].pushkin_card ==
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
                                                                items[index]
                                                                        .type_afisha[
                                                                    'name']),
                                                            size: Dimensions
                                                                .font14,
                                                            overflow:
                                                                TextOverflow
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
                                                alignment:
                                                    Alignment.bottomCenter,
                                                child: Container(
                                                  height: Dimensions.height75,
                                                  width:
                                                      Dimensions.width172 + 5,
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
                                                        CrossAxisAlignment
                                                            .start,
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
                                                            items[index].name!),
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
                  ],
                )),
          )
        ]),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          if (widget.afishaList!.vip == false) {
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
                          topLeft: Radius.circular(Dimensions.radius30),
                          topRight: Radius.circular(Dimensions.radius30)),
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
                                  controller: name,
                                  decoration: InputDecoration(
                                      hintText: "Как вас зовут?",
                                      hintStyle: TextStyle(
                                          fontSize: 18,
                                          color: Color(0xFF120D26),
                                          fontWeight: FontWeight.w400)),
                                  keyboardType: TextInputType.text),
                              TextField(
                                controller: phone,
                                decoration: InputDecoration(
                                    hintText: "Контактный телефон",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF120D26),
                                        fontWeight: FontWeight.w400)),
                                keyboardType: TextInputType.phone,
                              ),
                              TextField(
                                controller: email,
                                decoration: InputDecoration(
                                    hintText: "Контактный email",
                                    hintStyle: TextStyle(
                                        fontSize: 18,
                                        color: Color(0xFF120D26),
                                        fontWeight: FontWeight.w400)),
                                keyboardType: TextInputType.emailAddress,
                              ),
                              TextField(
                                controller: date,
                                onTap: () {
                                  showDatePicker(
                                      locale: const Locale('ru', 'ru_RU'),
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(2019, 1),
                                      lastDate: DateTime(2023, 12),
                                      builder: (context, picker) {
                                        return picker!;
                                      }).then((selectedDate) {
                                    //TODO: handle selected date
                                    if (selectedDate != null) {
                                      date.text =
                                          '${selectedDate.year}-${selectedDate.month.toString().length == 1 ? '0${selectedDate.month}' : "${selectedDate.month}"}-${selectedDate.day}';
                                    }
                                  });
                                },
                                readOnly: true,
                                decoration: InputDecoration(
                                  hintText: "Планируемая дата и время события",
                                  hintStyle: TextStyle(
                                      fontSize: 18,
                                      color: Color(0xFF120D26),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        InkWell(
                          onTap: () async {
                            showLoaderDialog(context);
                            await sendMail();
                            Navigator.of(context).pop();
                            showModalBottomSheet(
                                isScrollControlled: true,
                                backgroundColor: Colors.transparent,
                                elevation: 0,
                                context: context,
                                builder: (BuildContext context) {
                                  return Container(
                                      alignment: Alignment.center,
                                      height: Dimensions.height500,
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
                                              width: Dimensions.width30,
                                              child: const Divider(
                                                thickness: 5,
                                                color: Color(0xFFB2B2B2),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height10,
                                          ),
                                          BigTextWidget(
                                            text: "Записаться на событие",
                                            size: 24,
                                            fontWeight: FontWeight.w500,
                                            color: Color(0xFF120D26),
                                          ),
                                          SizedBox(
                                            height: Dimensions.height100,
                                          ),
                                          SizedBox(
                                            width: 204,
                                            child: Text(
                                              "Спасибо. Мы получили Вашу заявку и очень скоро с Вами свяжемся",
                                              style: TextStyle(
                                                fontSize: Dimensions.font16,
                                                fontWeight: FontWeight.w400,
                                                color: const Color(0xFF120D26),
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ));
                                });
                          },
                          child: Container(
                            width: double.maxFinite,
                            height: 48,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(14),
                              color: Color(0xFF2F3A4B),
                            ),
                            child: Center(
                                child: BigTextWidget(
                              text: "Оставить заявку",
                              size: 15,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                            )),
                          ),
                        )
                      ],
                    ),
                  );
                });
          } else {
            var url =
                'https://quicktickets.ru/noyabrsk-mrc/${widget.afishaList!.datatcevent}';
            if (url == "") return;
            if (await canLaunchUrl(Uri.parse(url))) {
              await launchUrl(
                Uri.parse(url),
              );
            } else {
              throw 'Could not launch $url';
            }
          }
        },
        child: Container(
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
              Text(
                  widget.afishaList!.vip == false
                      ? "Записаться"
                      : "Купить билет",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w500)),
            ],
          ),
        ),
      ),
    );
  }

  sendMail() async {
    String username = 'mailgo@binarywd.com';
    String password = 'K4y-e9G-7hp-z2c';
    String r = Random().nextInt(999999).toString().padLeft(6, '0');
    print(r);
    final smtpServer = yandex(username, password);
    var order = '';
    final message = Message()
      ..from = Address(username)
      ..ccRecipients.addAll(
          ['pr-museum89@mail.ru', 'gulboyqaroev@mail.ru']) //cc Recipents emails
      ..bccRecipients.add(const Address(
          'pr-museum89@mail.ru', 'gulboyqaroev@mail.ru')) //bcc Recipents emails
      ..subject =
          'Тема: Запись на событие  "${decodeToLatin(widget.afishaList!.name ?? '')}"  с мобильного приложения МРЦ' //subject of the email
      ..text =
          'Письмо\n На событие "${decodeToLatin(widget.afishaList!.name ?? '')}" был оформлена запись \nИнформация о заказчике \nКак зовут: ${name.text}\nКонтактный телефон: ${phone.text}\nКонтакный email: ${email.text}\n\nДата создания заказа: ${date.text}'; //body of the email

    try {
      final sendReport = await send(message, smtpServer);
      Navigator.of(context).pop();
      print('Message sent: ' +
          sendReport.toString()); //print if the email is sent
    } on MailerException catch (e) {
      print('Message not sent. \n' +
          e.toString()); //print if the email is not sent
      // e.toString() will show why the email is not sending
    }
  }
  showLoaderDialog(BuildContext context){
    AlertDialog alert=AlertDialog(
      content:  Row(
        children: [
          const CircularProgressIndicator(),
          Container(margin: const EdgeInsets.only(left: 7),child:const Text("Загрузка..." )),
        ],),
    );
    showDialog(barrierDismissible: false,
      context:context,
      builder:(BuildContext context){
        return alert;
      },
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
