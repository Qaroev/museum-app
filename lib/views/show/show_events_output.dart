import 'package:flutter/material.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/models/exhibitions.dart';
import 'package:shimmer/shimmer.dart';

import '../../controller/exhibitions_controller.dart';
import '../../utils/dimensions.dart';
import '../../utils/utils.dart';
import '../../widget/big-text-widget.dart';
import '../../widget/small-text-widget.dart';

class ShowEventsOutput extends StatefulWidget {
  final ExhibitionsModel? exhibitionsModel;

  const ShowEventsOutput({Key? key, this.exhibitionsModel}) : super(key: key);

  @override
  _ShowEventsOutputState createState() => _ShowEventsOutputState();
}

class _ShowEventsOutputState extends State<ShowEventsOutput> {
  PageController controller =
      PageController(viewportFraction: 1, keepPage: true);
  int pageIdx = 0;
  ExhibitionsController exhibitionsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF3F8F9),
      body: CustomScrollView(
        scrollDirection: Axis.vertical,
        slivers: [
          SliverAppBar(
            expandedHeight: 400.0,
            toolbarHeight: 50,
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
                          widget.exhibitionsModel!.name ?? '',
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
                              title: widget.exhibitionsModel!.name ?? '',
                              text: widget.exhibitionsModel!.name ?? '',
                              linkUrl: widget.exhibitionsModel!.name ?? '',
                              chooserTitle: widget.exhibitionsModel!.name ?? '');
                        },
                        child: Icon(
                          Icons.ios_share,
                          size: Dimensions.iconSize20,
                        ),
                      ),
                      SizedBox(
                        width: Dimensions.width5,
                      ),
                    ],
                  ),
                  background: Stack(children: [
                    widget.exhibitionsModel!.gallery == null
                        ? Image.network(
                            widget.exhibitionsModel!.img ?? '',
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
                            errorBuilder: (BuildContext context,
                                Object exception, StackTrace? stackTrace) {
                              return Image.asset('assets/images/show1.png');
                            },
                          )
                        : PageView.builder(
                            itemCount:
                                widget.exhibitionsModel!.gallery.length ?? 0,
                            controller: controller,
                            onPageChanged: (val) {
                              setState(() {
                                pageIdx = val;
                              });
                            },
                            itemBuilder: (BuildContext context, int itemIndex) {
                              return Image.network(
                                widget.exhibitionsModel!.gallery[itemIndex],
                                fit: BoxFit.fill,
                                headers: const {
                                  'Cookie':
                                      'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                },
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
                                    highlightColor:
                                        Colors.grey.withOpacity(0.3),
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
                              );
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
                                            title: widget.exhibitionsModel!.name ?? '',
                                            text: widget.exhibitionsModel!.name ?? '',
                                            linkUrl: widget.exhibitionsModel!.name ?? '',
                                            chooserTitle: widget.exhibitionsModel!.name ?? '');
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
                            height: 95,
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                                image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                "assets/images/Rectangle 2.png",
                              ),
                            )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                BigTextWidget(
                                  text: widget.exhibitionsModel!.name ?? '',
                                  size: Dimensions.font15,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500,
                                ),
                                SizedBox(
                                  height: Dimensions.height10,
                                ),
                                BigTextWidget(
                                  text: widget.exhibitionsModel!.type_afisha!
                                          .name ??
                                      '',
                                  size: Dimensions.font20,
                                  color: const Color(0xFFFFFFFF),
                                  fontWeight: FontWeight.w800,
                                ),
                              ],
                            ))
                      ],
                    ),
                    if (widget.exhibitionsModel!.gallery != null)
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            widget.exhibitionsModel!.gallery.length > 15
                                ? 15
                                : widget.exhibitionsModel!.gallery.length,
                            (index) => buildDot(index, context),
                          ),
                        ),
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
                    Text(widget.exhibitionsModel!.description ?? ''),
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
                    GetBuilder<ExhibitionsController>(
                        init: ExhibitionsController(),
                        builder: (evt) {
                          if (evt.isDataLoading.value) {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                          var items = exhibitionsController.exhibitions!.where(
                                  (element) => element.name != widget.exhibitionsModel!.name &&element.type_afisha!.name==widget.exhibitionsModel!.type_afisha!.name).toList();
                          print(items);
                          return Container(
                              height: 200,
                              child: ListView.builder(
                                  itemCount: items.length >= 10
                                      ? 10
                                      : items.length,
                                  scrollDirection: Axis.horizontal,
                                  itemBuilder: (context, index) {
                                    return InkWell(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ShowEventsOutput(
                                                      exhibitionsModel: items[index],
                                                    )));
                                      },
                                      child: Container(
                                        height: Dimensions.height220,
                                        padding:
                                             EdgeInsets.only(left: index==0?0:5),
                                        child: Stack(
                                          alignment:
                                              AlignmentDirectional.bottomCenter,
                                          children: [
                                            SizedBox(
                                              width: Dimensions.width172,
                                              height: Dimensions.height208,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        10), // Ima
                                                child: SizedBox.fromSize(
                                                  size:
                                                      const Size.fromRadius(20),
                                                  // Image radius
                                                  child: Image.network(
                                                    items[index]
                                                        .img!,
                                                    fit: BoxFit.cover,
                                                    headers: const {
                                                      'Cookie':
                                                          'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                                    },
                                                    height:
                                                        Dimensions.height158,
                                                    loadingBuilder: (BuildContext
                                                            context,
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
                                                          width: Dimensions
                                                              .width152,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors
                                                                .grey[300],
                                                          ),
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
                                            Align(
                                              alignment: Alignment.bottomCenter,
                                              child: Container(
                                                  height: Dimensions.height55,
                                                  width:
                                                      Dimensions.width172 + 5,
                                                  padding:
                                                      const EdgeInsets.all(10),
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.only(
                                                        topLeft:
                                                            Radius.circular(
                                                                Dimensions
                                                                    .radius10),
                                                        topRight:
                                                            Radius.circular(
                                                                Dimensions
                                                                    .radius10),
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
                                                  child: Center(
                                                    child: Text(
                                                      items[index]
                                                              .name ??
                                                          '',
                                                      maxLines: 2,
                                                      style: const TextStyle(
                                                          color: Colors.black,
                                                          fontSize: 12,
                                                          overflow: TextOverflow
                                                              .ellipsis),
                                                    ),
                                                  )),
                                            )
                                          ],
                                        ),
                                      ),
                                    );
                                  }));
                        }),
                  ],
                )),
          )
        ],
      ),
    );
  }

  Container buildDot(int index, BuildContext context) {
    return Container(
      height: 4,
      width: pageIdx == index ? 20 : 5,
      margin: const EdgeInsets.only(right: 5, bottom: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: pageIdx == index ? Colors.white : const Color(0xFFD1D1D1),
      ),
    );
  }
}
