import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../widget/big-text-widget.dart';
import '../../widget/small-text-widget.dart';

class SearchPageBody extends StatefulWidget {
  const SearchPageBody({Key? key}) : super(key: key);

  @override
  _SearchPageBodyState createState() => _SearchPageBodyState();
}

class _SearchPageBodyState extends State<SearchPageBody> {
  bool showPage = false;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: showPage
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: 80,),
          Image.asset("assets/icons/search.png"),
          SizedBox(height: 50,),
          BigTextWidget(
            text: "Начните поиск здесь",
            size: 24,
            fontWeight: FontWeight.w900,
          ),
        ],
      )
          : Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 250,
            child: BigTextWidget(
              text: "Вот что нам удалось найти по Вашему запросу",
              size: 20,
              fontWeight: FontWeight.w800,
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
                itemCount: 4,
                itemBuilder: (BuildContext context, index) {
                  return Container(
                    height: 220,
                    child: Stack(
                      //alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: 172,
                            height: 208,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                image: DecorationImage(
                                    image: AssetImage(
                                      'assets/images/image1-home.png',
                                    ),
                                    fit: BoxFit.cover)
                            ),
                            child: SmallTextWidget(text: "Постоянные", size: 11, color: Colors.white.withOpacity(0.8)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: 55,
                              width: 172,
                              margin: EdgeInsets.only(
                                right: 10,
                              ),
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10),
                                    topRight: Radius.circular(10),
                                    bottomRight: Radius.circular(10),
                                    bottomLeft: Radius.circular(10)),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: BigTextWidget(
                                  text: "«Отечественная война 1812 года»",
                                  size: 12 , color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                          ),
                        )
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
