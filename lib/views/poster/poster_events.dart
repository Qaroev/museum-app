import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:museum_resource_center/views/poster/poster_events_output.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../controller/afisha_controller.dart';
import '../../models/afish_model.dart';
import '../../utils/dimensions.dart';
import '../../widget/app_Icon.dart';
import '../../widget/big-text-widget.dart';

class PosterEvents extends StatefulWidget {
  const PosterEvents({Key? key}) : super(key: key);

  @override
  _PosterEventsState createState() => _PosterEventsState();
}

class _PosterEventsState extends State<PosterEvents> {
  AfishaController dataController = Get.find();
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Афиша событий",
                    size: Dimensions.font20,
                    fontWeight: FontWeight.w800,
                  ),
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            backgroundColor: Colors.transparent,
                            elevation: 0,
                            context: context,
                            builder: (BuildContext context) {
                              return Container(
                                  height: Dimensions.height500,
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(
                                            Dimensions.radius30),
                                        topRight: Radius.circular(
                                            Dimensions.radius30)),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          width: Dimensions.width30,
                                          child: const Divider(
                                            thickness: 5,
                                            color: Color(0xFFB2B2B2),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: Dimensions.height10,
                                      ),
                                      BigTextWidget(
                                        text: "Выбрать дату события",
                                        size: Dimensions.font24,
                                        fontWeight: FontWeight.w500,
                                        color: const Color(0xFF120D26),
                                      ),
                                      TableCalendar(
                                        focusedDay: DateTime.now(),
                                        firstDay: DateTime(2000),
                                        lastDay: DateTime(2025),
                                        startingDayOfWeek:
                                            StartingDayOfWeek.sunday,
                                        sixWeekMonthsEnforced: true,
                                        calendarFormat: CalendarFormat.month,
                                        headerStyle: const HeaderStyle(
                                          formatButtonVisible: false,
                                          titleCentered: true,
                                          headerMargin: EdgeInsets.all(10),
                                        ),
                                      )
                                    ],
                                  ));
                            });
                      },
                      icon: Image.asset("assets/icons/icon-calendar.png"))
                ],
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                    (index) => Container(
                      margin: EdgeInsets.only(right: Dimensions.width20),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          backgroundColor: const Color(0xFFF3F8F9),
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimensions.radius50),
                              side: BorderSide(
                                  color: const Color(0xFF12153D)
                                      .withOpacity(0.5))),
                        ),
                        child: const Text(
                          "Выставка",
                          style: TextStyle(color: Color(0xFF434670)),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              Obx(() => dataController.isDataLoading.value
                  ? const Center(child: CircularProgressIndicator())
                  : ListView.builder(
                      itemCount: dataController.afishaList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PosterEventsOutput(
                                          afishaList:
                                              dataController.afishaList[index],
                                        )));
                          },
                          child: Container(
                            margin:
                                EdgeInsets.only(bottom: Dimensions.height10),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: Dimensions.width92,
                                  height: Dimensions.height92,
                                  child: Image.network(
                                    decodeToLatin(
                                        dataController.afishaList[index].img ??
                                            ''),
                                    fit: BoxFit.fill,
                                    height: Dimensions.height208,
                                    loadingBuilder: (BuildContext context,
                                        Widget child,
                                        ImageChunkEvent? loadingProgress) {
                                      if (loadingProgress == null) {
                                        return child;
                                      }
                                      return Shimmer.fromColors(
                                        baseColor:
                                            Colors.white.withOpacity(0.8),
                                        highlightColor:
                                            Colors.white.withOpacity(0.3),
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
                                Expanded(
                                    child: Container(
                                  height: Dimensions.height91,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          topRight: Radius.circular(
                                            Dimensions.radius10,
                                          ),
                                          bottomRight: Radius.circular(
                                            Dimensions.radius10,
                                          )),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigTextWidget(
                                                text: getNameMonth(
                                                    dataController
                                                        .afishaList[index]),
                                                size: Dimensions.font11),
                                            if (dataController.afishaList[index]
                                                    .pushkin_card ==
                                                true)
                                              BigTextWidget(
                                                text: "Пушкинская карта",
                                                size: Dimensions.font11,
                                              ),
                                          ],
                                        ),
                                        const Spacer(),
                                        BigTextWidget(
                                          text: decodeToLatin(dataController
                                              .afishaList[index].name!),
                                          size: Dimensions.font12,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                        const Spacer(),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigTextWidget(
                                              text: decodeToLatin(dataController
                                                  .afishaList[index]
                                                  .type_afisha['name']),
                                              size: Dimensions.font12,
                                            ),
                                            AppIcon(
                                              icon: Icons.arrow_forward,
                                              size: Dimensions.font26,
                                              backgroundColor:
                                                  Color(0xFFE1E3E4),
                                              iconSize: Dimensions.iconSize15,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ))
                              ],
                            ),
                          ),
                        );
                      }))
            ],
          ),
        ),
      ],
    );
  }

  getNameMonth(AfishaModel afishaItems) {
    if (afishaItems.seanses2 != null) {
      var month1 = getMonth(afishaItems.seanses2[0]['date']);
      var month2 = getMonth(
          afishaItems.seanses2[afishaItems.seanses2.length - 1]['date']);
      return 'c $month1 по $month2';
    }
    return '';
  }
}
