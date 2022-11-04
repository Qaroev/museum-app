import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../utils/app_colors.dart';
import '../widget/big-text-widget.dart';

class CollectionsEvents extends StatefulWidget {
  const CollectionsEvents({Key? key}) : super(key: key);

  @override
  _CollectionsEventsState createState() => _CollectionsEventsState();
}

class _CollectionsEventsState extends State<CollectionsEvents> {
  @override
  Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Наши коллекции",
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(height: 10,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    7,
                        (index) => Container(
                      margin: EdgeInsets.only(right: 20),
                      child: ElevatedButton(
                        child: Text(
                          "Конкурс",
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
              Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          width: 178,
                          height: 186,
                          alignment: Alignment.bottomLeft,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(15),
                            image: DecorationImage(
                              image: AssetImage("assets/images/image2-home.png"),
                              fit: BoxFit.cover
                            ),
                          ),
                          child: BigTextWidget(
                            text: "Вещевая коллекция и этнография",
                            size: 13,
                            fontWeight: FontWeight.w700,
                            color: Colors.white
                          ),
                        );
                      }),
              )
            ],
          )
        );
  }
}
