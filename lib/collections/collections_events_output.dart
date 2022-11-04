import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/big-text-widget.dart';
import '../widget/small-text-widget.dart';

class CollectionsEventsOutput extends StatefulWidget {
  const CollectionsEventsOutput({Key? key}) : super(key: key);

  @override
  _CollectionsEventsOutputState createState() => _CollectionsEventsOutputState();
}

class _CollectionsEventsOutputState extends State<CollectionsEventsOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            foregroundColor: Colors.white,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: true,
            pinned: true,
            expandedHeight: 362.0,
            backgroundColor: Colors.white,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                    title: constraints.maxHeight >= 160
                        ? Container()
                        : Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(left:20, bottom: 10, top: 10, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                          Row(
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
                                  text: "Сумка женская",
                                  size: 16,
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
                      ],
                    ),
                        ),
                    background: Stack(
                      children: [
                        Container(
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/collections.png",
                              ),
                              fit: BoxFit.fitWidth,
                            ),
                        ),
                        foregroundDecoration: const BoxDecoration(
                          gradient: LinearGradient(
                            colors: [
                              Colors.transparent,
                              Colors.black26,
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.center,
                            stops: [0, 0.001],
                          ),
                        ),
                      ),
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: Color(0xFF434670).withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(10)),
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      color: Colors.white,
                                      size: 15,
                                    )),
                              ),
                              Row(
                                children: [
                                  Container(
                                    width: 40,
                                    height: 40,
                                    decoration: BoxDecoration(
                                        color: Color(0xFF434670).withOpacity(0.25),
                                        borderRadius: BorderRadius.circular(10)),
                                    child: Center(
                                      child: IconButton(
                                          onPressed: () {},
                                          icon: Icon(
                                            Icons.ios_share,
                                            size: 15,
                                            color: Colors.white,
                                          )),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                          color: Color(0xFF434670).withOpacity(0.25),
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
                            ],
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              width: double.maxFinite,
                              height: 102,
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                  color: Color(0xFF434670).withOpacity(0.03)
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  BigTextWidget(text: "Вещевая коллекция и этнография", size: 15, color: Colors.white, fontWeight: FontWeight.w500,),
                                  SizedBox(height: 10,),
                                  BigTextWidget(
                                    text: "Сумка женская",
                                    size: 20,
                                    color: Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w800,),
                                ],
                              ),
                            )
                          ],
                        ),
                      ]
                    ),
                );
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
                      text: "Об элементе",
                      size: 18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF06070D),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigTextWidget(
                      text: "Коллекция: Вещевая коллекция и этнография",
                      size: 14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text: "Автор / Изготовитель: ручная работа, автор неизвестен",
                      size: 14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text: "Время создания:",
                      size: 14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text: "Место создания:",
                      size: 14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text: "Материал: дерево, кожа, сборка",
                      size: 14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text: "Размеры: 8,4х3,5х6,5 см",
                      size: 14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text:"Фондовый номер: НМРЦ ОФ-1136",
                      size: 14,
                      height: 1.6,
                      color: Color(0xFF120D26),
                      fontWeight: FontWeight.w400,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text:"Дополнительные данные: источник поступления, легенда, прочее:Поступила в фонды в 2000 г.",
                      size: 14,
                      height: 1.6,
                      color: const Color(0xFF120D26),
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    BigTextWidget(
                      text:"Фонд:",
                      size: 14,
                      height: 1.6,
                      color: const Color(0xFF120D26),
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    BigTextWidget(
                      text: 'Рекомендуем еще',
                      size: 18,
                      color: const Color(0xFF06070D),
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10,),
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
                    const SizedBox(height: 100,)
                  ],
                )),
          )
        ],
      ),
    );
  }
}
