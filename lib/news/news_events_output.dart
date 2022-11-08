import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/utils/dimensions.dart';

import '../widget/big-text-widget.dart';

class NewsEventsOutput extends StatefulWidget {
  const NewsEventsOutput({Key? key}) : super(key: key);

  @override
  _NewsEventsOutputState createState() => _NewsEventsOutputState();
}

class _NewsEventsOutputState extends State<NewsEventsOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height100,
            //foregroundColor: Colors.white,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: false,
            pinned: true,
            expandedHeight: Dimensions.height362,
            backgroundColor: Colors.white,
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
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: Dimensions.font20,
                              ),
                            ),
                            SizedBox(width: Dimensions.width10,),
                            SizedBox(
                              width: Dimensions.width200,
                              child: BigTextWidget(
                                text: "Красота Божьего мира»»",
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
                        ),
                      ],
                    ),
                  ),
                  background: Stack(
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                  "assets/images/souvenirs.png",
                                ),
                                fit: BoxFit.cover
                            ),
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
                                  SizedBox(width: Dimensions.width5,),
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                                width: double.maxFinite,
                                height: Dimensions.height121,
                                padding: const EdgeInsets.all(20),
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage("assets/images/rectangle2.png"),
                                      fit: BoxFit.cover
                                    )
                                ),
                                child: SizedBox(
                                  width: Dimensions.width290,
                                  child: BigTextWidget(
                                    text: "«Определены победители первого этапа конкурса «Красота Божьего мира»»",
                                    size: Dimensions.font20,
                                    color: const Color(0xFFFFFFFF),
                                    fontWeight: FontWeight.w800,),
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
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(
                      text:"Enjoy your favorite dishe and a lovely your friends and family and have a great time. Food from local food trucks will be available for purchase.  Food from local food trucks will be available for purchase.  Food from local food trucks will be available for purchase. ",
                      size: Dimensions.font16,
                      height: 1.2,
                      color: const Color(0xFF120D26),
                      fontWeight: FontWeight.w400,
                    ),
                     SizedBox(height: Dimensions.height20,),
                    BigTextWidget(
                      text: 'Рекомендуем еще',
                      size: Dimensions.font18,
                      color: const Color(0xFF06070D),
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(height: Dimensions.height10,),
                    GestureDetector(
                      child: Container(
                        width: Dimensions.width380,
                        height: Dimensions.height106,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radius15)
                        ),
                        child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: Dimensions.width73,
                                        height: Dimensions.height96,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFBEBEBE),
                                            borderRadius: BorderRadius.circular(Dimensions.radius15)
                                        ),
                                      ),
                                      Positioned(
                                        right: 3,
                                        top: 1,
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          width: Dimensions.width73,
                                          height: Dimensions.height96,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                                              image: const DecorationImage(
                                                  image: AssetImage("assets/images/image3-home.png"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                   SizedBox(width: Dimensions.width30,),
                                  Container(
                                    alignment: Alignment.center,
                                    width: Dimensions.width220,
                                    height: Dimensions.height80,
                                    child: BigTextWidget(
                                      text: "«Определены победители первого этапа конкурса «Красота Божьего мира»»",
                                      size: Dimensions.font14,
                                      color: const Color(0xFF120D26),
                                      fontWeight: FontWeight.w400,),
                                  ),
                                ],
                              ),
                            ]
                        ),
                      ),
                    ),
                     SizedBox(height: Dimensions.height20),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
