import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../widget/big-text-widget.dart';
import '../widget/small-text-widget.dart';

class SouvenirsEventsOutput extends StatefulWidget {
  const SouvenirsEventsOutput({Key? key}) : super(key: key);

  @override
  _SouvenirsEventsOutputState createState() => _SouvenirsEventsOutputState();
}

class _SouvenirsEventsOutputState extends State<SouvenirsEventsOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: 100,
            //foregroundColor: Colors.white,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: false,
            pinned: true,
            expandedHeight: 362.0,
            backgroundColor: Colors.white,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: 10),
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
                                  "assets/images/souvenirs.png",
                                ),
                                fit: BoxFit.cover
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
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/rectangle2.png"),
                                    )
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    BigTextWidget(text: "Валяние шерсти", size: 15, color: Colors.white, fontWeight: FontWeight.w500,),
                                    SizedBox(height: 10,),
                                    BigTextWidget(
                                      text: "Игрушка конек",
                                      size: 20,
                                      color: Color(0xFFFFFFFF),
                                      fontWeight: FontWeight.w800,),
                                  ],
                                )
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
                      text:"Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.  Food from local food trucks will be available for purchase.  Food from local food trucks will be available for purchase. ",
                      size: 16,
                      height: 1.2,
                      color: Color(0xFF120D26),
                      fontWeight: FontWeight.w400,
                    ),
                    const SizedBox(height: 20,),
                    BigTextWidget(
                      text: 'Рекомендуем еще',
                      size: 18,
                      color: const Color(0xFF06070D),
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(height: 10,),
                    GestureDetector(
                  child: Container(
                    width: 380,
                    height: 106,
                    margin: EdgeInsets.only(bottom: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15)
                    ),
                    child: Stack(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    width: 73,
                                    height: 96,
                                    decoration: BoxDecoration(
                                        color: Color(0xFFBEBEBE),
                                        borderRadius: BorderRadius.circular(15)
                                    ),
                                  ),
                                  Positioned(
                                    right: 3,
                                    top: 1,
                                    bottom: 0,
                                    left: 0,
                                    child: Container(
                                      width: 73,
                                      height: 96,
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(15),
                                          image: DecorationImage(
                                              image: AssetImage("assets/images/image3-home.png"),
                                              fit: BoxFit.cover
                                          )
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 40,),
                              Container(
                                width: 180,
                                height: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    BigTextWidget(text: "Колокольчики", size: 13, color: Color(0xFF747688), fontWeight: FontWeight.w400,),
                                    BigTextWidget(text: "Настенные часы в технике Фьюзинг", size: 16, fontWeight: FontWeight.w400,),
                                    BigTextWidget(text: "2500 руб.", size: 16, fontWeight: FontWeight.w600,),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          Container(
                              alignment: Alignment.topRight,
                              margin: EdgeInsets.only(right: 10,top: 10),
                              child: Icon(Icons.shopping_cart_outlined)
                          )
                        ]
                    ),
                  ),
                ),
                    const SizedBox(height: 20),
                  ],
                )),
          )
        ],
      ),
      bottomNavigationBar: Container(
        height: 87,
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: Container(
          alignment: Alignment.center,
          child: ElevatedButton(
            child: Text(
              "Заказать",
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
