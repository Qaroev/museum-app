import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:museum_resource_center/collections/collections_events_output.dart';
import 'package:museum_resource_center/utils/dimensions.dart';

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
          margin: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Наши коллекции",
                size: Dimensions.font20,
                fontWeight: FontWeight.w800,
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
                        child: Text("Конкурс", style: TextStyle(color: Color(0xFF434670)),),
                        onPressed: () {},
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
              Expanded(
                  child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 1,
                          crossAxisSpacing: 20,
                          mainAxisSpacing: 20),
                      itemCount: 10,
                      itemBuilder: (BuildContext context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => CollectionsEventsOutput()));
                          },
                          child: Container(
                            width: Dimensions.width178,
                            height: Dimensions.height186,
                            alignment: Alignment.bottomLeft,
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(Dimensions.radius15),
                              image: const DecorationImage(
                                image: AssetImage("assets/images/image2-home.png"),
                                fit: BoxFit.cover
                              ),
                            ),
                            child: BigTextWidget(
                              text: "Вещевая коллекция и этнография",
                              size: Dimensions.font13,
                              fontWeight: FontWeight.w700,
                              color: Colors.white
                            ),
                          ),
                        );
                      }),
              )
            ],
          )
        );
  }
}
