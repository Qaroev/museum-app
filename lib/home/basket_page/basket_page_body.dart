import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../utils/dimensions.dart';
import '../../widget/big-text-widget.dart';

class BasketPageBody extends StatefulWidget {
  const BasketPageBody({Key? key}) : super(key: key);

  @override
  _BasketPageBodyState createState() => _BasketPageBodyState();
}

class _BasketPageBodyState extends State<BasketPageBody> {
  bool showPage = false;
  @override
  Widget build(BuildContext context) {

    return ListView(
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          child: showPage
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Моя корзина",
                size: Dimensions.font20,
                fontWeight: FontWeight.w800,
              ),
              Container(
                margin: const EdgeInsets.all(80),
                child: BigTextWidget(
                  text: "Пока тут пусто.Но Вы всегда можете что-тозаказать в наших сувенирах.",
                  size: Dimensions.font16,
                  fontWeight: FontWeight.w400,
                  color: const Color(0xFF120D26),
                  textAlign: TextAlign.center,

                ),
              ),
            ],
          )
              : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Моя корзина",
                size: Dimensions.font20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: Dimensions.height20,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        width: Dimensions.width380,
                        height: Dimensions.height106,
                        margin: EdgeInsets.only(bottom: Dimensions.height10),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(Dimensions.radius15)
                        ),
                        child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: Dimensions.width73,
                                        height: Dimensions.height96,
                                        decoration: BoxDecoration(
                                            color: const Color(0xFFBEBEBE),
                                            borderRadius: BorderRadius.circular(Dimensions.radius15)
                                        ),
                                      ),
                                      Positioned(
                                        right: 3,
                                        top: 1,
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                            width: Dimensions.width73,
                                            height: Dimensions.height96,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(Dimensions.radius15),
                                              image: const DecorationImage(
                                                  image: AssetImage("assets/images/image3-home.png"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: Dimensions.width40,),
                                  Container(
                                    width: Dimensions.width180,
                                    height: Dimensions.height80,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BigTextWidget(text: "Колокольчики", size: Dimensions.font13, color: const Color(0xFF747688), fontWeight: FontWeight.w400,),
                                        BigTextWidget(text: "Настенные часы в технике Фьюзинг", size: Dimensions.font16, fontWeight: FontWeight.w400,),
                                        BigTextWidget(text: "2500 руб.", size: Dimensions.font16, fontWeight: FontWeight.w600,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: Dimensions.width10,top: Dimensions.height10),
                                  child: Image.asset("assets/icons/delete.png")
                              )
                            ]
                        ),
                      ),
                    );
                  }),
              Container(
                height: Dimensions.height87,
                decoration: const BoxDecoration(
                    color: Colors.transparent
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: Text(
                      "Перейти к оформлению",
                      style: TextStyle(color: Colors.white, fontSize: Dimensions.font13),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: Dimensions.height500,
                              padding: const EdgeInsets.all(20),
                              decoration: BoxDecoration(
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
                                      child: const Divider(
                                        thickness: 5,
                                        color: Color(0xFFB2B2B2),
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height10,),
                                  BigTextWidget(
                                    text: "Заказать сувенир",
                                    size: Dimensions.font24,
                                    fontWeight: FontWeight.w500,
                                    color: const Color(0xFF120D26),
                                  ),
                                  SizedBox(height: Dimensions.height20,),
                                  Form(
                                    child: Column(
                                      children: [
                                        TextField(
                                            decoration: InputDecoration(
                                                hintText: "Как вас зовут?",
                                                hintStyle: TextStyle(fontSize: Dimensions.font18, color: const Color(0xFF120D26), fontWeight: FontWeight.w400)
                                            ),
                                            keyboardType: TextInputType.text
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Контактный телефон",
                                              hintStyle: TextStyle(fontSize: Dimensions.font18, color: const Color(0xFF120D26), fontWeight: FontWeight.w400)
                                          ),
                                          keyboardType: TextInputType.phone,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Контактный email",
                                              hintStyle: TextStyle(fontSize: Dimensions.font18, color: const Color(0xFF120D26), fontWeight: FontWeight.w400)
                                          ),
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: Dimensions.height40,),
                                  GestureDetector(
                                    onTap: (){
                                        showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            elevation: 0,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Container(
                                                alignment: Alignment.center,
                                                height: Dimensions.height500,
                                                padding: const EdgeInsets.all(20),
                                                decoration: BoxDecoration(
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
                                                        child: const Divider(
                                                          thickness: 5,
                                                          color: Color(0xFFB2B2B2),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(height: Dimensions.height10,),
                                                    BigTextWidget(
                                                      text: "Заказать сувенир",
                                                      size: Dimensions.font24,
                                                      fontWeight: FontWeight.w500,
                                                      color: const Color(0xFF120D26),
                                                    ),
                                                    SizedBox(height: Dimensions.height100,),
                                                    SizedBox(
                                                      width:204,
                                                      child: BigTextWidget(
                                                        text: "Спасибо. Мы получили Вашу заявку и очень скоро с Вами свяжемся",
                                                        size: Dimensions.font16,
                                                        fontWeight: FontWeight.w400,
                                                        color: const Color(0xFF120D26),
                                                        textAlign: TextAlign.center,
                                                      ),
                                                    ),
                                                  ],
                                                )
                                              );
                                            });
                                    },
                                    child: Container(
                                      width: double.maxFinite,
                                      height:48,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(14),
                                        color: const Color(0xFF2F3A4B),
                                      ),
                                      child: Center(child: BigTextWidget(text: "Заказать", size: Dimensions.font15, fontWeight: FontWeight.w500, color: Colors.white,)),
                                    ),
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 80),
                      elevation: 1,
                      primary: Color(0xFF2F3A4B),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(14.0),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
