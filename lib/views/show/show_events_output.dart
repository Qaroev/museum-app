import 'package:flutter/material.dart';
import 'package:museum_resource_center/models/exhibitions.dart';
import 'package:shimmer/shimmer.dart';

import '../../utils/dimensions.dart';
import '../../widget/big-text-widget.dart';
import '../../widget/small-text-widget.dart';

class ShowEventsOutput extends StatefulWidget {
  final ExhibitionsModel? exhibitionsModel;

  const ShowEventsOutput({Key? key, this.exhibitionsModel}) : super(key: key);

  @override
  _ShowEventsOutputState createState() => _ShowEventsOutputState();
}

class _ShowEventsOutputState extends State<ShowEventsOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height100,
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
                          margin: EdgeInsets.only(
                              left: Dimensions.width20,
                              bottom: Dimensions.height10,
                              top: Dimensions.height10,
                              right: Dimensions.width20),
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
                                    ),
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  SizedBox(
                                    width: Dimensions.width10,
                                  ),
                                  SizedBox(
                                    width: Dimensions.width200,
                                    child: BigTextWidget(
                                      text: "Сумка женская",
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
                                  SizedBox(
                                    width: Dimensions.width5,
                                  ),
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
                  background: Stack(children: [
                    Image.network(
                      widget.exhibitionsModel!.img??'',
                      fit: BoxFit.fill,
                      height: Dimensions.height500,
                      width: double.infinity,
                      loadingBuilder: (BuildContext context,
                          Widget child,
                          ImageChunkEvent? loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        }
                        return Shimmer.fromColors(
                          baseColor: Colors.grey,
                          highlightColor: Colors.grey.withOpacity(0.3),
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.grey[300],
                            ),
                          ),
                        );
                      },
                      errorBuilder: (BuildContext context,
                          Object exception, StackTrace? stackTrace) {
                        return Image.asset('assets/images/show1.png');
                      },
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          top: Dimensions.height50,
                          left: Dimensions.width20,
                          right: Dimensions.width20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: Dimensions.width40,
                            height: Dimensions.height40,
                            decoration: BoxDecoration(
                                color:
                                    const Color(0xFF434670).withOpacity(0.25),
                                borderRadius:
                                    BorderRadius.circular(Dimensions.radius10)),
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
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: const Color(0xFF434670)
                                        .withOpacity(0.25),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.ios_share,
                                        size: 15,
                                        color: Colors.white,
                                      )),
                                ),
                              ),
                              const SizedBox(
                                width: 5,
                              ),
                              Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                      color: const Color(0xFF434670)
                                          .withOpacity(0.25),
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
                            height: Dimensions.height102,
                            padding: const EdgeInsets.all(20),
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                              image: AssetImage("assets/images/rectangle2.png"),
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigTextWidget(
                                  text: "${widget.exhibitionsModel!.name??''}",
                                  size: Dimensions.font15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigTextWidget(
                                  text: "${widget.exhibitionsModel!.type_afisha!.name??''}",
                                  size: Dimensions.font20,
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ))
                      ],
                    ),
                  ]),
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
                    Text(widget.exhibitionsModel!.description??''),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigTextWidget(
                      text: 'Рекомендуем еще',
                      size: Dimensions.font18,
                      color: const Color(0xFF06070D),
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
                            (index) => SizedBox(
                                  height: Dimensions.height220,
                                  child: Stack(
                                    //alignment: AlignmentDirectional.bottomCenter,
                                    children: [
                                      GestureDetector(
                                        child: Container(
                                          width: Dimensions.width172,
                                          height: Dimensions.height208,
                                          alignment: Alignment.topRight,
                                          margin: EdgeInsets.only(
                                              right: Dimensions.width10),
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      Dimensions.radius10),
                                              image: const DecorationImage(
                                                  image: AssetImage(
                                                    'assets/images/image1-home.png',
                                                  ),
                                                  fit: BoxFit.cover)),
                                          child: SmallTextWidget(
                                              text: "Постоянные",
                                              size: Dimensions.font11,
                                              color: Colors.white
                                                  .withOpacity(0.8)),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Container(
                                            height: Dimensions.height55,
                                            width: Dimensions.width172,
                                            margin: EdgeInsets.only(
                                              right: Dimensions.width10,
                                            ),
                                            padding: const EdgeInsets.all(5),
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                      Dimensions.radius10),
                                                  topRight: Radius.circular(
                                                      Dimensions.radius10),
                                                  bottomRight: Radius.circular(
                                                      Dimensions.radius10),
                                                  bottomLeft: Radius.circular(
                                                      Dimensions.radius10)),
                                              color: Colors.white,
                                            ),
                                            child: Center(
                                              child: BigTextWidget(
                                                text:
                                                    "«Отечественная война 1812 года»",
                                                size: Dimensions.font12,
                                                color: Colors.black,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            )),
                                      )
                                    ],
                                  ),
                                )),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height100,
                    ),
                  ],
                )),
          )
        ],
      ),
    );
  }
}
