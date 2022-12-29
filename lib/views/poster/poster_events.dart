import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:museum_resource_center/utils/utils.dart';
import 'package:museum_resource_center/views/poster/poster_events_output.dart';
import 'package:shimmer/shimmer.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';
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
  int typeIndex = -1;
  var sortItems = [];
  DateTime? _selectedDay;

  @override
  void initState() {
    super.initState();
    initializeDateFormatting(); //very important
  }

  sortItemsByType(List<AfishaModel> afishaTypes, type) {
    sortItems = [];
    for (var element in afishaTypes) {
      if (element.type_afisha['name'] == type) {
        sortItems.add(element);
      }
    }
  }

  sortItemsByDate(List<AfishaModel> afishaTypes, DateTime date) {
    sortItems = [];
    for (var element in afishaTypes) {
      var dates = DateFormat('yyyy-MM-dd')
          .parse(element.seanses[0]['date'], true)
          .millisecondsSinceEpoch;
      var dates2 = DateFormat('yyyy-MM-dd')
          .parse('${date.year}-${date.month}-${date.day}', true)
          .millisecondsSinceEpoch;
      if (dates == dates2) {
        sortItems.add(element);
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<AfishaController>(
        init: AfishaController(),
        builder: (evt) {
          if (evt.isDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (evt.isDataLoading) {
            return const Center(child: CircularProgressIndicator());
          }
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
                                  bool b = false;
                                  return StatefulBuilder(
                                    builder: (BuildContext context, setState) =>
                                        Container(
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
                                                  color:
                                                      const Color(0xFF120D26),
                                                ),
                                                TableCalendar(
                                                  locale: 'ru_ru',
                                                  startingDayOfWeek:
                                                      StartingDayOfWeek.monday,
                                                  calendarStyle:
                                                      const CalendarStyle(
                                                    defaultTextStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Color(0xFF222B45),
                                                      height:
                                                          1.3333333333333333,
                                                    ),
                                                    weekendTextStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Color(0xFF222B45),
                                                      height:
                                                          1.3333333333333333,
                                                    ),
                                                    outsideTextStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Color(0xFF222B45),
                                                      height:
                                                          1.3333333333333333,
                                                    ),
                                                    todayTextStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Color(0xFF222B45),
                                                    ),
                                                  ),
                                                  onPageChanged: (focusedDay) {
                                                    _selectedDay = focusedDay;
                                                  },
                                                  daysOfWeekStyle:
                                                      const DaysOfWeekStyle(
                                                    weekdayStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Color(0xFF222B45),
                                                      height:
                                                          1.3333333333333333,
                                                    ),
                                                    weekendStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      fontSize: 12,
                                                      color: Color(0xFF222B45),
                                                      height:
                                                          1.3333333333333333,
                                                    ),
                                                  ),
                                                  headerStyle:
                                                      const HeaderStyle(
                                                    titleTextStyle: TextStyle(
                                                      fontFamily: 'Montserrat',
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 15,
                                                      color: Color(0xFF222B45),
                                                      height:
                                                          1.3333333333333333,
                                                    ),
                                                    leftChevronIcon: Icon(
                                                      Icons.keyboard_arrow_left,
                                                      size: 20,
                                                      color: Color(0xFF222B45),
                                                    ),
                                                    formatButtonTextStyle:
                                                        TextStyle(
                                                            color: Colors.blue),
                                                    rightChevronIcon: Icon(
                                                      Icons
                                                          .keyboard_arrow_right,
                                                      size: 20,
                                                      color: Color(0xFF222B45),
                                                    ),
                                                    formatButtonVisible: false,
                                                  ),
                                                  calendarBuilders:
                                                      CalendarBuilders(
                                                    selectedBuilder: (context,
                                                            date, events) =>
                                                        Container(
                                                      margin:
                                                          const EdgeInsets.all(
                                                              10.0),
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        color: const Color(
                                                            0xff735BF2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30.0),
                                                      ),
                                                      child: Text(
                                                        date.day.toString(),
                                                        style: const TextStyle(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          fontSize: 12,
                                                          color: Colors.white,
                                                        ),
                                                      ),
                                                    ),
                                                    todayBuilder:
                                                        (context, date,
                                                                events) =>
                                                            _selectedDay != null
                                                                ? Container(
                                                                    margin: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    child: Text(
                                                                      date.day
                                                                          .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            12,
                                                                        color: Color(
                                                                            0xFF222B45),
                                                                        height:
                                                                            1.3333333333333333,
                                                                      ),
                                                                    ),
                                                                  )
                                                                : Container(
                                                                    margin: const EdgeInsets
                                                                            .all(
                                                                        10.0),
                                                                    alignment:
                                                                        Alignment
                                                                            .center,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                            gradient:
                                                                                const RadialGradient(
                                                                              center: Alignment(-0.54, -1.0),
                                                                              radius: 1.137,
                                                                              colors: [
                                                                                Color(0xff735BF2),
                                                                                Color(0xffd735BF2),
                                                                                Color(0xffd735BF2)
                                                                              ],
                                                                              stops: [
                                                                                0.0,
                                                                                0.485,
                                                                                1.0
                                                                              ],
                                                                            ),
                                                                            borderRadius:
                                                                                BorderRadius.circular(30.0)),
                                                                    child: Text(
                                                                      date.day
                                                                          .toString(),
                                                                      style:
                                                                          const TextStyle(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        fontWeight:
                                                                            FontWeight.w600,
                                                                        fontSize:
                                                                            12,
                                                                        color: Color(
                                                                            0xFF222B45),
                                                                        height:
                                                                            1.3333333333333333,
                                                                      ),
                                                                    ),
                                                                  ),
                                                  ),
                                                  selectedDayPredicate: (day) {
                                                    return isSameDay(
                                                        _selectedDay, day);
                                                  },
                                                  onDaySelected: (selectedDay,
                                                      focusedDay) {
                                                    setState(() {
                                                      // clearDate();
                                                      // filterByEvt(evt, isF: isFilterByEvt);
                                                      // filterByDate(selectedDay,
                                                      //     isFilterByEvt ? listSearchItems : evt.afishaList);
                                                      _selectedDay =
                                                          selectedDay;
                                                      sortItemsByDate(
                                                          dataController
                                                              .afishaList,
                                                          _selectedDay!);
                                                      setState(() {});
                                                      Navigator.of(context)
                                                          .pop();
                                                    });
                                                  },
                                                  firstDay: DateTime.utc(
                                                      1950, 01, 01),
                                                  lastDay: DateTime.utc(
                                                      2050, 01, 01),
                                                  focusedDay: DateTime.now(),
                                                )
                                              ],
                                            )),
                                  );
                                },
                              );
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
                          dataController.afishaTypes!.length,
                          (index) => Container(
                            margin: EdgeInsets.only(right: Dimensions.width20),
                            child: ElevatedButton(
                              onPressed: () {
                                if (index == typeIndex) {
                                  typeIndex = -1;
                                  sortItems = [];
                                } else {
                                  typeIndex = index;
                                  sortItemsByType(dataController.afishaList,
                                      dataController.afishaTypes![index]);
                                }
                                setState(() {});
                              },
                              style: ElevatedButton.styleFrom(
                                elevation: 1,
                                backgroundColor: typeIndex == index
                                    ? const Color(0xFF4579FF).withOpacity(0.7)
                                    : const Color(0xFFF3F8F9),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        Dimensions.radius50),
                                    side: const BorderSide(
                                        color: Color(0xFF12153D))),
                              ),
                              child: Text(
                                decodeToLatin(
                                    dataController.afishaTypes![index]),
                                style:
                                    const TextStyle(color: Color(0xFF434670)),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: Dimensions.height20,
                    ),
                    ListView.builder(
                        itemCount: sortItems.isNotEmpty
                            ? sortItems.length
                            : dataController.afishaList.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PosterEventsOutput(
                                            afishaList: dataController
                                                .afishaList[index],
                                          )));
                            },
                            child: listItems(
                              sortItems.isNotEmpty
                                  ? sortItems[index]
                                  : dataController.afishaList[index],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          );
        });
  }

  listItems(afishaList) {
    return Container(
      margin: EdgeInsets.only(bottom: Dimensions.height10),
      child: Row(
        children: [
          SizedBox(
            width: Dimensions.width92,
            height: Dimensions.height92,
            child: Image.network(
              decodeToLatin(afishaList.img ?? ''),
              headers: const {
                'Cookie': 'bpc=06784db3c02ba52d5d279ccb5e944ce6',
              },
              fit: BoxFit.fill,
              height: Dimensions.height208,
              loadingBuilder: (BuildContext context, Widget child,
                  ImageChunkEvent? loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return Shimmer.fromColors(
                  baseColor: Colors.grey.withOpacity(0.8),
                  highlightColor: Colors.grey.withOpacity(0.3),
                  child: Container(
                    width: Dimensions.width92,
                    height: Dimensions.height92,
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                    ),
                  ),
                );
              },
              errorBuilder: (BuildContext context, Object exception,
                  StackTrace? stackTrace) {
                return Image.asset('assets/images/picture.png');
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
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(
                          text: getNameMonth(afishaList),
                          size: Dimensions.font11),
                      if (afishaList.pushkin_card == true)
                        BigTextWidget(
                          text: "Пушкинская карта",
                          size: Dimensions.font11,
                        ),
                    ],
                  ),
                  const Spacer(),
                  BigTextWidget(
                    text: decodeToLatin(afishaList.name!),
                    size: Dimensions.font12,
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                  ),
                  const Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      BigTextWidget(
                        text: decodeToLatin(afishaList.type_afisha['name']),
                        size: Dimensions.font12,
                      ),
                      AppIcon(
                        icon: Icons.arrow_forward,
                        size: Dimensions.font26,
                        backgroundColor: Color(0xFFE1E3E4),
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
