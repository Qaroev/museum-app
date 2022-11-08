import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
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
      padding: const EdgeInsets.all(20),
      child: showPage
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(height: Dimensions.height80,),
          Image.asset("assets/icons/search.png"),
          SizedBox(height: Dimensions.height50,),
          BigTextWidget(
            text: "Начните поиск здесь",
            size: Dimensions.font24,
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
              size: Dimensions.font20,
              fontWeight: FontWeight.w800,
            ),
          ),
          SizedBox(
            height: Dimensions.height20,
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
                    height: Dimensions.height220,
                    child: Stack(
                      //alignment: AlignmentDirectional.bottomCenter,
                      children: [
                        GestureDetector(
                          child: Container(
                            width: Dimensions.width172,
                            height: Dimensions.height208,
                            alignment: Alignment.topRight,
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(Dimensions.radius10),
                                image: const DecorationImage(
                                    image: AssetImage(
                                      'assets/images/image1-home.png',
                                    ),
                                    fit: BoxFit.cover)
                            ),
                            child: SmallTextWidget(text: "Постоянные", size: Dimensions.font11, color: Colors.white.withOpacity(0.8)),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                              height: Dimensions.height55,
                              width: Dimensions.width172,
                              margin: EdgeInsets.only(
                                right: Dimensions.width10,
                              ),
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(Dimensions.radius10),
                                    topRight: Radius.circular(Dimensions.radius10),
                                    bottomRight: Radius.circular(Dimensions.radius10),
                                    bottomLeft: Radius.circular(Dimensions.radius10)),
                                color: Colors.white,
                              ),
                              child: Center(
                                child: BigTextWidget(
                                  text: "«Отечественная война 1812 года»",
                                  size: Dimensions.font12 , color: Colors.black,
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
