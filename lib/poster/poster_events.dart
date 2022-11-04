import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
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
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BigTextWidget(
                    text: "Афиша событий",
                    size: 20,
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
                                  height: 500,
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                        topRight: Radius.circular(30)),
                                  ),
                                  child: Column(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.pop(context);
                                        },
                                        child: SizedBox(
                                          width: 30,
                                          child: Divider(
                                            thickness: 5,
                                            color: Color(0xFFB2B2B2),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      BigTextWidget(
                                        text: "Выбрать дату события",
                                        size: 24,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF120D26),
                                      ),
                                      TableCalendar(
                                        focusedDay: DateTime.now(),
                                        firstDay: DateTime(2000),
                                        lastDay: DateTime(2025),
                                        startingDayOfWeek: StartingDayOfWeek.sunday,
                                        sixWeekMonthsEnforced: true,
                                        calendarFormat: CalendarFormat.month,
                                        headerStyle: HeaderStyle(
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
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                    (index) => Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Выставка",
                          style: TextStyle(color: Color(0xFF434670)),
                        ),
                        onPressed: () => print("it's pressed"),
                        style: ElevatedButton.styleFrom(
                          elevation: 1,
                          primary: Color(0xFFF3F8F9),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50.0),
                              side: BorderSide(
                              color: Color(0xFF12153D).withOpacity(0.5))),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        margin: EdgeInsets.only(bottom: 10),
                        child: Row(
                          children: [
                            Container(
                              width: 92,
                              height: 92,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/picture.png"))),
                            ),
                            Expanded(
                                child: Container(
                              height: 91,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                        10,
                                      ),
                                      bottomRight: Radius.circular(10)),
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
                                            size: 11),
                                        BigTextWidget(
                                          text: "Пушкинская карта",
                                          size: 11,
                                        ),
                                      ],
                                    ),
                                    Spacer(),
                                    BigTextWidget(
                                      text:
                                          "«Цикл лекций по изобразительному искусству «Идем в музей»",
                                      size: 12,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                    ),
                                    Spacer(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        BigTextWidget(
                                          text: "Выставка",
                                          size: 12,
                                        ),
                                        AppIcon(
                                          icon: Icons.arrow_forward,
                                          size: 26,
                                          backgroundColor: Color(0xFFE1E3E4),
                                          iconSize: 15,
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
