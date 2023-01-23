import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/collection_controller.dart';
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
  CollectionController collectionController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            toolbarHeight: Dimensions.height60,
            foregroundColor: Colors.white,
            toolbarTextStyle: const TextStyle(color: Colors.black),
            automaticallyImplyLeading: false,
            primary: true,
            pinned: true,
            expandedHeight: 400,
            backgroundColor: Colors.white,
            flexibleSpace: LayoutBuilder(
              builder: (context, constraints) {
                return FlexibleSpaceBar(
                  centerTitle: true,
                  title: constraints.maxHeight >= 160
                      ? Container()
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: 18.0),
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Colors.black,
                                  size: Dimensions.iconSize20,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: Dimensions.width10,
                            ),
                            SizedBox(
                              width: Dimensions.width200,
                              child: Text(
                                decodeToLatin(widget.collection!.name ?? ''),
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
                            InkWell(
                              onTap: () async {
                                await FlutterShare.share(
                                    title: decodeToLatin(
                                        widget.collection!.name ?? ''),
                                    text: decodeToLatin(
                                        widget.collection!.name ?? ''),
                                    linkUrl: decodeToLatin(
                                        widget.collection!.name ?? ''),
                                    chooserTitle: decodeToLatin(
                                        widget.collection!.name ?? ''));
                              },
                              child: Icon(
                                Icons.ios_share,
                                size: Dimensions.iconSize20,
                              ),
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
                                      onPressed: () async{
                                        await FlutterShare.share(
                                            title: decodeToLatin(
                                                widget.collection!.name ?? ''),
                                            text: decodeToLatin(
                                                widget.collection!.name ?? ''),
                                            linkUrl: decodeToLatin(
                                                widget.collection!.name ?? ''),
                                            chooserTitle: decodeToLatin(
                                                widget.collection!.name ?? ''));

                                      },
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
                            ],
                          ),
                        ],
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                          width: double.maxFinite,
                          height: 110,
                          padding: const EdgeInsets.all(20),
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage("assets/images/Rectangle 2.png"),
                          )),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                decodeToLatin(widget.collection!.name ?? ''),
                                style: TextStyle(
                                  fontSize: Dimensions.font15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: Dimensions.height10,
                              ),
                              BigTextWidget(
                                text: decodeToLatin(
                                    widget.collection!.type_afisha!.name ?? ''),
                                size: Dimensions.font20,
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w800,
                              ),
                            ],
                          )),
                    )
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
                    SizedBox(
                      height: 15,
                    ),
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
                      height: 25,
                    ),
                    BigTextWidget(
                      text: 'Рекомендуем еще',
                      size: Dimensions.font18,
                      color: const Color(0xFF06070D),
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Obx(() {
                      if (collectionController.isDataLoading.value) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      var items = collectionController.collectionItems!
                          .where((element) =>
                              element.name != widget.collection!.name &&
                              element.type_afisha!.name ==
                                  widget.collection!.type_afisha!.name)
                          .toList();
                      return SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                              items.length >= 10 ? 10 : items.length,
                              (index) => InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CollectionsEventsOutput(
                                                    collection: items[index],
                                                  )));
                                    },
                                    child: Stack(
                                      alignment: Alignment.bottomCenter,
                                      clipBehavior: Clip.none,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              right: 15.0),
                                          child: SizedBox(
                                            width: 200,
                                            height: 200,
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      10), // Ima
                                              child: SizedBox.fromSize(
                                                size: const Size.fromRadius(20),
                                                // Image radius
                                                child: Image.network(
                                                  decodeToLatin(
                                                      collectionController
                                                          .collectionItems![
                                                              index]
                                                          .img!),
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
                                                    if (loadingProgress ==
                                                        null) {
                                                      return child;
                                                    }
                                                    return Shimmer.fromColors(
                                                      baseColor: Colors.grey
                                                          .withOpacity(0.8),
                                                      highlightColor: Colors
                                                          .grey
                                                          .withOpacity(0.3),
                                                      child: Container(
                                                        width:
                                                            Dimensions.width152,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[300],
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  errorBuilder: (BuildContext
                                                          context,
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
                                                  left: 10,
                                                  bottom: 10,
                                                  right: 10),
                                              child: Text(
                                                decodeToLatin(
                                                    items[index].name!),
                                                maxLines: 3,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 18,
                                                    overflow:
                                                        TextOverflow.ellipsis),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  )),
                        ),
                      );
                    }),
                    SizedBox(
                      height: 10,
                    )
                  ],
                )),
          )
        ],
      ),
    );
  }
}
