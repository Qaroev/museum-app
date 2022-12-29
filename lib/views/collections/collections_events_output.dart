import 'package:flutter/material.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../models/collection_model.dart';
import '../../utils/app_colors.dart';
import '../../widget/big-text-widget.dart';
import '../../widget/small-text-widget.dart';

class CollectionsEventsOutput extends StatefulWidget {
  final Collection? collection;

  const CollectionsEventsOutput({Key? key, this.collection}) : super(key: key);

  @override
  _CollectionsEventsOutputState createState() =>
      _CollectionsEventsOutputState();
}

class _CollectionsEventsOutputState extends State<CollectionsEventsOutput> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height80,
            foregroundColor: Colors.white,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: true,
            pinned: true,
            expandedHeight: Dimensions.height362,
            backgroundColor: Colors.white,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  centerTitle: true,
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
                                      size: Dimensions.font20,
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
                                      text: decodeToLatin(
                                          widget.collection!.name ?? ''),
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
                                    size: Dimensions.font20,
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
                            ],
                          ),
                        ),
                  background: Stack(children: [
                    Image.network(
                      widget.collection!.img ?? '',
                      fit: BoxFit.fill,
                      headers: const {
                        'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                      },
                      height: Dimensions.height500,
                      width: double.infinity,
                      loadingBuilder: (BuildContext context, Widget child,
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
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
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
                              // Container(
                              //     width: 40,
                              //     height: 40,
                              //     decoration: BoxDecoration(
                              //         color: const Color(0xFF434670)
                              //             .withOpacity(0.25),
                              //         borderRadius: BorderRadius.circular(10)),
                              //     child: IconButton(
                              //       onPressed: () {},
                              //       icon: Image.asset(
                              //         "assets/images/menu.png",
                              //         color: Colors.white,
                              //       ),
                              //     )),
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
                                  text: decodeToLatin(
                                      widget.collection!.name ?? ''),
                                  size: Dimensions.font15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigTextWidget(
                                  text: decodeToLatin(
                                      widget.collection!.type_afisha!.name ??
                                          ''),
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
                    BigTextWidget(
                      text: "Об элементе",
                      size: Dimensions.font18,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF06070D),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    BigTextWidget(
                      text: "Коллекция: Вещевая коллекция и этнография",
                      size: Dimensions.font14,
                    ),
                    const Divider(thickness: 2),
                    Text(
                      "Автор: ${decodeToLatin(widget.collection!.autor ?? '')}",
                      style: const TextStyle(
                        color: AppColors.textBigColor,
                        fontSize: 12,
                      ),
                    ),
                    const Divider(thickness: 2),
                    Text(
                      "Время создания: ${decodeToLatin(widget.collection!.time ?? '')}",
                      style: const TextStyle(
                        color: AppColors.textBigColor,
                        fontSize: 12,
                      ),
                    ),
                    const Divider(thickness: 2),
                    Text(
                      "Место создания: ${decodeToLatin(widget.collection!.legend ?? '')}",
                      style: const TextStyle(
                        color: AppColors.textBigColor,
                        fontSize: 12,
                      ),
                    ),
                    const Divider(thickness: 2),
                    Text(
                      "Материал: ${decodeToLatin(widget.collection!.material ?? '')}",
                      style: const TextStyle(
                        color: AppColors.textBigColor,
                        fontSize: 12,
                      ),
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text:
                          "Размеры: ${decodeToLatin(widget.collection!.razmeri ?? '')}",
                      size: Dimensions.font14,
                    ),
                    const Divider(thickness: 2),
                    BigTextWidget(
                      text:
                          "Фондовый номер: ${decodeToLatin(widget.collection!.number ?? '')}",
                      size: Dimensions.font14,
                      height: 1.6,
                      color: const Color(0xFF120D26),
                      fontWeight: FontWeight.w400,
                    ),
                    const Divider(thickness: 2),
                    Text(
                      decodeToLatin(widget.collection!.description ?? ''),
                      style: const TextStyle(
                        color: AppColors.textBigColor,
                        fontSize: 12,
                      ),
                    ),
                    Text(
                      "Фонд: ${decodeToLatin(widget.collection!.description ?? '')}",
                      style: const TextStyle(
                        color: AppColors.textBigColor,
                        fontSize: 12,
                      ),
                    ),
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
                            (index) => Container(
                                  width: Dimensions.width152,
                                  height: Dimensions.height158,
                                  margin: EdgeInsets.only(
                                      right: Dimensions.width10),
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          Dimensions.radius20),
                                      image: const DecorationImage(
                                          image: AssetImage(
                                              'assets/images/image2-poster.png'))),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SmallTextWidget(
                                        text: 'c 15 по 31 марта',
                                        size: Dimensions.font12,
                                        color: Colors.white,
                                      ),
                                      BigTextWidget(
                                        text:
                                            'Декоративно-прикладное искусство',
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
                      height: Dimensions.height100,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
