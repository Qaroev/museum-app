import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
          padding: EdgeInsets.all(20),
          child: showPage
              ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BigTextWidget(
                text: "Моя корзина",
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              Container(
                margin: EdgeInsets.all(80),
                child: BigTextWidget(
                  text: "Пока тут пусто.Но Вы всегда можете что-тозаказать в наших сувенирах.",
                  size: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF120D26),
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
                size: 20,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(
                height: 20,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      child: Container(
                        width: 380,
                        height: 106,
                        margin: EdgeInsets.only(bottom: 10),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15)
                        ),
                        child: Stack(
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        width: 73,
                                        height: 96,
                                        decoration: BoxDecoration(
                                            color: Color(0xFFBEBEBE),
                                            borderRadius: BorderRadius.circular(15)
                                        ),
                                      ),
                                      Positioned(
                                        right: 3,
                                        top: 1,
                                        bottom: 0,
                                        left: 0,
                                        child: Container(
                                          width: 73,
                                          height: 96,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                  image: AssetImage("assets/images/image3-home.png"),
                                                  fit: BoxFit.cover
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(width: 40,),
                                  Container(
                                    width: 180,
                                    height: 80,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        BigTextWidget(text: "Колокольчики", size: 13, color: Color(0xFF747688), fontWeight: FontWeight.w400,),
                                        BigTextWidget(text: "Настенные часы в технике Фьюзинг", size: 16, fontWeight: FontWeight.w400,),
                                        BigTextWidget(text: "2500 руб.", size: 16, fontWeight: FontWeight.w600,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                  alignment: Alignment.topRight,
                                  margin: EdgeInsets.only(right: 10,top: 10),
                                  child: Image.asset("assets/icons/delete.png")
                              )
                            ]
                        ),
                      ),
                    );
                  }),
              Container(
                height: 87,
                decoration: BoxDecoration(
                    color: Colors.white
                ),
                child: Container(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    child: Text(
                      "Перейти к оформлению",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                    onPressed: () {
                      showModalBottomSheet(
                          isScrollControlled: true,
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              height: 500,
                              padding: EdgeInsets.all(20),
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
                                    text: "Заказать сувенир",
                                    size: 24,
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xFF120D26),
                                  ),
                                  SizedBox(height: 20,),
                                  Form(
                                    child: Column(
                                      children: [
                                        TextField(
                                            decoration: InputDecoration(
                                                hintText: "Как вас зовут?",
                                                hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400)
                                            ),
                                            keyboardType: TextInputType.text
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Контактный телефон",
                                              hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400)
                                          ),
                                          keyboardType: TextInputType.phone,
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              hintText: "Контактный email",
                                              hintStyle: TextStyle(fontSize: 18, color: Color(0xFF120D26), fontWeight: FontWeight.w400)
                                          ),
                                          keyboardType: TextInputType.emailAddress,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(height: 40,),
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
                                                height: 500,
                                                padding: EdgeInsets.all(20),
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
                                                      text: "Заказать сувенир",
                                                      size: 24,
                                                      fontWeight: FontWeight.w500,
                                                      color: Color(0xFF120D26),
                                                    ),
                                                    SizedBox(height: 100,),
                                                    SizedBox(
                                                      width:204,
                                                      child: BigTextWidget(
                                                        text: "Спасибо. Мы получили Вашу заявку и очень скоро с Вами свяжемся",
                                                        size: 16,
                                                        fontWeight: FontWeight.w400,
                                                        color: Color(0xFF120D26),
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
                                        color: Color(0xFF2F3A4B),
                                      ),
                                      child: Center(child: BigTextWidget(text: "Заказать", size: 15, fontWeight: FontWeight.w500, color: Colors.white,)),
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
