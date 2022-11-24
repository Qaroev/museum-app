import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/widget/big-text-widget.dart';
import 'package:museum_resource_center/widget/small-text-widget.dart';

import '../widget/app_Icon.dart';

class PosterEventsOutput extends StatefulWidget {
  const PosterEventsOutput({Key? key}) : super(key: key);

  @override
  _PosterEventsOutputState createState() => _PosterEventsOutputState();
}

class _PosterEventsOutputState extends State<PosterEventsOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
        SliverAppBar(
          toolbarHeight: Dimensions.height80,
          toolbarTextStyle: TextStyle(color: Colors.black),
          automaticallyImplyLeading: false,
          primary: true,
          pinned: true,
          expandedHeight: Dimensions.height270,
          backgroundColor: const Color(0xFFF3F8F9),
          // leading: Row(
          //   mainAxisAlignment: MainAxisAlignment.end,
          //   crossAxisAlignment: CrossAxisAlignment.center,
          //   children: [
          //     Container(
          //       width: Dimensions.width30,
          //       height: Dimensions.height30,
          //       decoration: BoxDecoration(
          //           color: Colors.white.withOpacity(0.24),
          //           borderRadius: BorderRadius.circular(Dimensions.radius10)),
          //       margin: EdgeInsets.only(bottom: Dimensions.height40),
          //       child: IconButton(
          //           onPressed: () {
          //             Navigator.pop(context);
          //           },
          //           icon: Icon(
          //             Icons.arrow_back_ios,
          //             color: Colors.white,
          //             size: Dimensions.iconSize15,
          //           )),
          //     )
          //   ],
          // ),
          // actions: [Container(
          //     margin: EdgeInsets.only(right: Dimensions.width10, bottom: Dimensions.height40),
          //     child: Row(
          //       children: [
          //         Container(
          //           width: Dimensions.width30,
          //           height: Dimensions.height30,
          //           decoration: BoxDecoration(
          //               color: Colors.white.withOpacity(0.24),
          //               borderRadius: BorderRadius.circular(Dimensions.radius10)),
          //           child: Center(
          //             child: IconButton(
          //               onPressed: () {
          //               },
          //                 icon: Icon(
          //                   Icons.ios_share,
          //                   size: Dimensions.iconSize15,
          //                 )),
          //           ),
          //         ),
          //         SizedBox(width: Dimensions.width5,),
          //         Container(
          //             width: Dimensions.width30,
          //             height: Dimensions.height30,
          //             decoration: BoxDecoration(
          //                 color: Colors.white.withOpacity(0.24),
          //                 borderRadius: BorderRadius.circular(Dimensions.radius10)),
          //             child: IconButton(
          //               onPressed: () {},
          //               icon: Image.asset(
          //                 "assets/images/menu.png",
          //                 color: Colors.white,
          //               ),
          //             )),
          //       ],
          //     ),
          //   )],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: Dimensions.height10),
                  title: constraints.maxHeight >= 160
                      ? Container()
                      : Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(left:Dimensions.width20, bottom: Dimensions.height10, top: Dimensions.height10, right: Dimensions.width20),
                    child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  IconButton(
                                  icon: Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.black,
                                    size: Dimensions.iconSize20,
                                  ), onPressed: () { Navigator.pop(context); },
                                ),
                                  SizedBox(width: Dimensions.width10,),
                                  SizedBox(
                                    width: Dimensions.width200,
                                    child: BigTextWidget(
                                      text: "Мастерская креативных подарков",
                                      size: Dimensions.font16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w800,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.ios_share,
                                    size: Dimensions.iconSize20,
                                  ),
                                  SizedBox(width: Dimensions.width5,),
                                  Image.asset(
                                    "assets/images/menu.png",
                                    color: Colors.black,
                                    width: Dimensions.width20,
                                    height: Dimensions.height20,
                                  ),
                                ],
                              )

                            ],
                          ),
                      ),
                  background: Container(
                    height: Dimensions.height300,
                    child: Stack(
                      children: [
                        Container(
                          height: Dimensions.height300,
                          padding:
                              EdgeInsets.only(left: Dimensions.width20, right: Dimensions.width20, bottom: Dimensions.height5),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(
                              "assets/images/image-poster.png",
                            ),
                            fit: BoxFit.cover,
                          )),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SmallTextWidget(
                                    text: "Пушкинская карта",
                                    size: Dimensions.font11,
                                    color: Colors.white.withOpacity(0.8),
                                    overflow: TextOverflow.clip,
                                  ),
                                  BigTextWidget(
                                    text: "Выставка",
                                    size: Dimensions.font15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: Dimensions.width287,
                                child: BigTextWidget(
                                  text: "Мастерская креативных подарков",
                                  size: Dimensions.font20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: Dimensions.height5,),
                              DotsIndicator(
                                position: 1,
                                dotsCount: 4,
                                decorator: DotsDecorator(
                                  color: Colors.white,
                                  activeColor: Colors.white,
                                  size: const Size.square(4.0),
                                  activeSize: const Size(30.0, 4.0),
                                  activeShape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(5.0)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: Dimensions.height50, left: Dimensions.width20, right: Dimensions.width20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: Dimensions.width40,
                                height: Dimensions.height40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF434670).withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(Dimensions.radius10)),
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
                              Row(
                                children: [
                                  Container(
                                    width: Dimensions.width40,
                                    height: Dimensions.height40,
                                    decoration: BoxDecoration(
                                        color: const Color(0xFF434670).withOpacity(0.25),
                                        borderRadius: BorderRadius.circular(Dimensions.radius10)),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.ios_share,
                                            size: Dimensions.iconSize15,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
                                  Container(
                                      width: Dimensions.width40,
                                      height: Dimensions.height40,
                                      decoration: BoxDecoration(
                                          color: const Color(0xFF434670).withOpacity(0.25),
                                          borderRadius: BorderRadius.circular(Dimensions.radius10)),
                                      child: IconButton(
                                        onPressed: () {},
                                        icon: Image.asset(
                                          "assets/images/menu.png",
                                          color: Colors.white,
                                        ),
                                      )),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Container(
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: Dimensions.width20),
                          child: ElevatedButton(
                            child: Text(
                              "Купить билет",
                              style: TextStyle(color: Colors.white),
                            ),
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
                                            SizedBox(height: 10,),
                                            BigTextWidget(
                                              text: "Записаться на событие",
                                              size: 24,
                                              fontWeight: FontWeight.w500,
                                              color: Color(0xFF120D26),
                                            ),
                                            SizedBox(height: 20,),
                                            Form(
                                              child: Column(
                                                children: [
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: "Как вас зовут?",
                                                      hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400)
                                                    ),
                                                    keyboardType: TextInputType.text
                                                  ),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                      hintText: "Контактный телефон",
                                                      hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400)
                                                    ),
                                                    keyboardType: TextInputType.phone,
                                                  ),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                        hintText: "Контактный email",
                                                        hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400)
                                                    ),
                                                    keyboardType: TextInputType.emailAddress,
                                                  ),
                                                  TextField(
                                                    decoration: InputDecoration(
                                                        hintText: "Планируемая дата и время события",
                                                        hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400),
                                                    ),
                                                    keyboardType: TextInputType.datetime,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            SizedBox(height: 20,),
                                            Container(
                                              width: double.maxFinite,
                                              height:48,
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(14),
                                                color: Color(0xFF2F3A4B),
                                              ),
                                              child: Center(child: BigTextWidget(text: "Оставить заявку", size: 15, fontWeight: FontWeight.w500, color: Colors.white,)),
                                            )
                                          ],
                                        ),
                                    );
                                  });
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.only(left: Dimensions.width30, right: Dimensions.width30, top: Dimensions.height10, bottom: Dimensions.height10),
                              primary: const Color(0xFF2F3A4B),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(14.0),
                              ),
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
                  SizedBox(height: Dimensions.height10,),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          10,
                          (index) => Container(
                                width: Dimensions.width118,
                                height: Dimensions.height54,
                                margin: EdgeInsets.only(right: Dimensions.width10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xFFD98639))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigTextWidget(
                                      text: "Вт, 1 марта",
                                      size: Dimensions.font15,
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    BigTextWidget(
                                      text: "16:20",
                                      color: Colors.black,
                                      size: Dimensions.font15,
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(height: Dimensions.height20,),
                  BigTextWidget(
                    text: "О событии",
                    size: Dimensions.font18,
                    color: const Color(0xFF06070D),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(height: Dimensions.height10,),
                  BigTextWidget(
                    text: "Место проведения : МБУК «Музейный ресурсный центр»",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Адрес : ул. Советская, 82",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Дата события : 23 ноября 2021 по 31 декабря 2022",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Контактный телефон : 42-00-10",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Возрастное ограничение : 6+",
                    size: Dimensions.font14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Стоимость билета от : от 121,50 до 455 руб.",
                    size: Dimensions.font14,
                  ),
                  SizedBox(height: Dimensions.height20,),
                  BigTextWidget(
                    text:
                        'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. \n\nEnjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
                    size: 14,
                    height: 1.6,
                    color: Color(0xFF120D26),
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(height: Dimensions.height10,),
                  BigTextWidget(
                    text: 'Рекомендуем еще',
                    size: 18,
                    color: Color(0xFF06070D),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: Dimensions.height10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                width: Dimensions.width152,
                                height: Dimensions.height158,
                                margin: EdgeInsets.only(right: Dimensions.width10),
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                                    image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image2-poster.png'))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallTextWidget(
                                      text: 'c 15 по 31 марта',
                                      size: Dimensions.font12,
                                      color: Colors.white,
                                    ),
                                    BigTextWidget(
                                      text: 'Декоративно-прикладное искусство',
                                      size: Dimensions.font13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: Dimensions.height30,
                  ),
                ],
              )),
        )
      ]),
      bottomNavigationBar: Container(
        height: Dimensions.height87,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text(
              "Купить билет",
              style: TextStyle(color: Colors.white, fontSize: Dimensions.font13),
            ),
            onPressed: () => print("pressed"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 80),
              elevation: 1,
              primary: const Color(0xFF2F3A4B),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(14.0),
              ),
            ),
          ),
        ),
      ) ,
    );
  }
}
