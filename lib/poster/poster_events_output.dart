import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
      backgroundColor: Color(0xFFF3F8F9),
      body: CustomScrollView(scrollDirection: Axis.vertical, slivers: [
        SliverAppBar(
          toolbarHeight: 80,
          toolbarTextStyle: TextStyle(color: Colors.black),
          automaticallyImplyLeading: false,
          primary: true,
          pinned: true,
          expandedHeight: 270.0,
          backgroundColor: Colors.white,
          leading: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 30,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.24),
                    borderRadius: BorderRadius.circular(10)),
                margin: EdgeInsets.only(bottom: 40),
                child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 15,
                    )),
              )
            ],
          ),
          actions: [Container(
              margin: EdgeInsets.only(right: 10, bottom: 40),
              child: Row(
                children: [
                  Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.24),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.ios_share,
                            size: 15,
                          )),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.24),
                          borderRadius: BorderRadius.circular(10)),
                      child: IconButton(
                        onPressed: () {},
                        icon: Image.asset(
                          "assets/images/menu.png",
                          color: Colors.white,
                        ),
                      )),
                ],
              ),
            )],
          flexibleSpace: LayoutBuilder(
            builder: (context, constraints) {
              return FlexibleSpaceBar(
                  //centerTitle: true,
                  titlePadding: EdgeInsets.only(bottom: 20, left: 40),
                  title: constraints.maxHeight >= 160
                      ? Container()
                      : Row(
                          children: [
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.black,
                              size: 20,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            SizedBox(
                              width: 200,
                              child: BigTextWidget(
                                text: "Мастерская креативных подарков",
                                size: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w800,
                              ),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Icon(
                              Icons.ios_share,
                              size: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Image.asset(
                              "assets/images/menu.png",
                              color: Colors.black,
                              width: 20,
                              height: 20,
                            ),
                          ],
                        ),
                  background: Container(
                    height: 300,
                    child: Stack(
                      children: [
                        Container(
                          height: 300,
                          padding:
                              EdgeInsets.only(left: 20, right: 20, bottom: 5),
                          decoration: BoxDecoration(
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
                                    size: 11,
                                    color: Colors.white.withOpacity(0.8),
                                    overflow: TextOverflow.clip,
                                  ),
                                  BigTextWidget(
                                    text: "Выставка",
                                    size: 15,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  )
                                ],
                              ),
                              SizedBox(
                                width: 287,
                                child: BigTextWidget(
                                  text: "Мастерская креативных подарков",
                                  size: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                              SizedBox(height: 5,),
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
                          alignment: Alignment.bottomRight,
                          margin: EdgeInsets.only(right: 20),
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
                                        height: 600,
                                        padding: EdgeInsets.all(20),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(30),
                                              topRight: Radius.circular(30)),
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
                              padding: EdgeInsets.only(left: 30, right: 30, top: 10, bottom: 10),
                              primary: Color(0xFF2F3A4B),
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
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BigTextWidget(
                    text: "Расписание",
                    size: 18,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF06070D),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          10,
                          (index) => Container(
                                width: 118,
                                height: 54,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border:
                                        Border.all(color: Color(0xFFD98639))),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigTextWidget(
                                      text: "Вт, 1 марта",
                                      size: 15,
                                      color: Color(0xFF333333),
                                      fontWeight: FontWeight.w700,
                                    ),
                                    BigTextWidget(
                                      text: "16:20",
                                      color: Colors.black,
                                      size: 15,
                                    ),
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BigTextWidget(
                    text: "О событии",
                    size: 18,
                    color: Color(0xFF06070D),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BigTextWidget(
                    text: "Место проведения : МБУК «Музейный ресурсный центр»",
                    size: 14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Адрес : ул. Советская, 82",
                    size: 14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Дата события : 23 ноября 2021 по 31 декабря 2022",
                    size: 14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Контактный телефон : 42-00-10",
                    size: 14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Возрастное ограничение : 6+",
                    size: 14,
                  ),
                  Divider(thickness: 2),
                  BigTextWidget(
                    text: "Стоимость билета от : от 121,50 до 455 руб.",
                    size: 14,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  BigTextWidget(
                    text:
                        'Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase. \n\nEnjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.',
                    size: 14,
                    height: 1.6,
                    color: Color(0xFF120D26),
                    fontWeight: FontWeight.w400,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  BigTextWidget(
                    text: 'Рекомендуем еще',
                    size: 18,
                    color: Color(0xFF06070D),
                    fontWeight: FontWeight.w600,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(
                          5,
                          (index) => Container(
                                width: 152,
                                height: 158,
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    image: DecorationImage(
                                        image: AssetImage(
                                            'assets/images/image2-poster.png'))),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SmallTextWidget(
                                      text: 'c 15 по 31 марта',
                                      size: 12,
                                      color: Colors.white,
                                    ),
                                    BigTextWidget(
                                      text: 'Декоративно-прикладное искусство',
                                      size: 13,
                                      fontWeight: FontWeight.w700,
                                      color: Colors.white,
                                    )
                                  ],
                                ),
                              )),
                    ),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                ],
              )),
        )
      ]),
      bottomNavigationBar: Container(
        height: 87,
        decoration: BoxDecoration(
            color: Colors.white
        ),
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text(
              "Купить билет",
              style: TextStyle(color: Colors.white, fontSize: 13),
            ),
            onPressed: () => print("pressed"),
            style: ElevatedButton.styleFrom(
              padding: EdgeInsets.symmetric(horizontal: 80),
              elevation: 1,
              primary: Color(0xFF2F3A4B),
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
