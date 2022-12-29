import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/controller/news_controller.dart';
import 'package:museum_resource_center/utils/dimensions.dart';
import 'package:shimmer/shimmer.dart';

import '../../widget/big-text-widget.dart';
import 'news_events_output.dart';

class NewsEvents extends StatefulWidget {
  const NewsEvents({Key? key}) : super(key: key);

  @override
  _NewsEventsState createState() => _NewsEventsState();
}

class _NewsEventsState extends State<NewsEvents> {
  NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Obx(() => newsController.isDataLoading.value
        ? const Center(child: CircularProgressIndicator())
        : ListView(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BigTextWidget(
                      text: "Новости музея",
                      size: Dimensions.font20,
                      fontWeight: FontWeight.w800,
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: newsController.newsItems!.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => NewsEventsOutput(
                                            newsItem: newsController
                                                .newsItems![index],
                                          )));
                            },
                            child: Container(
                              width: Dimensions.width380,
                              height: Dimensions.height106,
                              margin:
                                  EdgeInsets.only(bottom: Dimensions.height10),
                              padding: const EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(
                                      Dimensions.radius15)),
                              child: Stack(children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: Dimensions.width73,
                                      height: Dimensions.height96,
                                      alignment: Alignment.bottomLeft,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                      ),
                                      child: Image.network(
                                        newsController.newsItems![index].img ??
                                            '',
                                        fit: BoxFit.cover,
                                        height: 300,
                                        headers: const {
                                          'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
                                        },
                                        loadingBuilder: (BuildContext context,
                                            Widget child,
                                            ImageChunkEvent? loadingProgress) {
                                          if (loadingProgress == null) {
                                            return child;
                                          }
                                          return Shimmer.fromColors(
                                            baseColor:
                                                Colors.grey.withOpacity(0.8),
                                            highlightColor:
                                                Colors.grey.withOpacity(0.3),
                                            child: Container(
                                              width: Dimensions.width92,
                                              height: Dimensions.height92,
                                              decoration: BoxDecoration(
                                                color: Colors.grey[300],
                                              ),
                                            ),
                                          );
                                        },
                                        errorBuilder: (BuildContext context,
                                            Object exception,
                                            StackTrace? stackTrace) {
                                          return Image.asset(
                                              'assets/images/picture.png');
                                        },
                                      ),
                                    ),
                                    SizedBox(
                                      width: Dimensions.width30,
                                    ),
                                    Expanded(
                                      child: Text(
                                          newsController
                                                  .newsItems![index].name ??
                                              '',
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w500)),
                                    ),
                                  ],
                                ),
                              ]),
                            ),
                          );
                        }),
                  ],
                ),
              ),
            ],
          ));
  }
}
