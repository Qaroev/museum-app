import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/poster/poster_events_output.dart';
import 'package:table_calendar/table_calendar.dart';

import '../utils/dimensions.dart';
import '../widget/app_Icon.dart';
import '../widget/big-text-widget.dart';

class PosterEvents extends StatefulWidget {
  const PosterEvents({Key? key}) : super(key: key);

  @override
  _PosterEventsState createState() => _PosterEventsState();
}

class _PosterEventsState extends State<PosterEvents> {
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
                                  decoration:  BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(Dimensions.radius30),
                                        topRight: Radius.circular(Dimensions.radius30)),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          width: Dimensions.width30,
                                          child: Divider(
                                            thickness: 5,
                                            color: Color(0xFFB2B2B2),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: Dimensions.height10,),
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
                                        startingDayOfWeek: StartingDayOfWeek.sunday,
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
                      icon: Image.asset("assets/icons/icon-calendar.png")
                  )
                ],
              ),
              SizedBox(height: Dimensions.height20,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                    (index) => Container(
                      margin: EdgeInsets.only(right: Dimensions.width20),
                      child: ElevatedButton(
                        child: Text(
                          "Выставка",
                          style: TextStyle(color: Color(0xFF434670)),
                        ),
                        onPressed: (){},
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: const Color(0xFFF3F8F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(Dimensions.radius50),
                              side: BorderSide(
                              color: const Color(0xFF12153D).withOpacity(0.5))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: Dimensions.height20,),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PosterEventsOutput()));
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        child: Row(
                          children: [
                            Container(
                              width: Dimensions.width92,
                              height: Dimensions.height92,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/picture.png"))),
                            ),
                            Expanded(
                                child: Container(
                              height: Dimensions.height91,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        Dimensions.radius10,
                                      ),
                                      bottomRight: Radius.circular(Dimensions.radius10,)),
                                  color: Colors.white),
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigTextWidget(
                                            text: "с 17 апреля по 21 мая",
                                            size: Dimensions.font11),
                                        BigTextWidget(
                                          text: "Пушкинская карта",
                                          size: Dimensions.font11,
                                        ),
                                      ],
                                    ),
                                    const Spacer(),
                                    BigTextWidget(
                                      text:
                                          "«Цикл лекций по изобразительному искусству «Идем в музей»",
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
                                          text: "Выставка",
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
                      ),
                    );
                  }),
            ],
          ),
        ),
      ],
    );
  }
}
