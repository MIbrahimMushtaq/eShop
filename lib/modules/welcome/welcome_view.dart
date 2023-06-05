import 'package:e_com_shop/main.dart';
import 'package:e_com_shop/modules/welcome/welcome_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/loading.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../../utils/utils.dart';

class WelcomeView extends StatelessWidget {
  const WelcomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<WelcomeLogic>(
        init: WelcomeLogic(),
        builder: (logic){
      return Material(
        child: Scaffold(
          body: logic.isLoading ? const LoadingPro() : SafeArea(
            child: Container(
              width: deviceWidth,
              alignment: Alignment.center,
              padding: const EdgeInsets.all(Siz.standardPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Txt('Welcome',hasBold: true,fontSize: 26,hasItalic: true,),
                  const Txt('Buy any item from online store',hasItalic: true,),
                  const MyDivider(),
                  const MyDivider(),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(Images.welcome,height: deviceHeight *0.45,)),
                  const MyDivider(),
                  const MyDivider(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(Images.facebook,width: 40,height: 40,),
                      const MyVerticalDivider(),
                      Image.asset(Images.google,width: 40,height: 40,),
                    ],
                  ),
                  const MyDivider(),
                  const MyDivider(),
                  Btn(text:'Log in',onPressed:logic.onLoginTap,width: double.infinity,hasBorder: false,hasBold: true,),
                  const MyDivider(),
                  Btn(text:'Sign up',onPressed: logic.onSignUpTap,width: double.infinity,bgColor: Clr.colorWhite,textColor: Clr.colorPrimary,borderColor: Clr.colorPrimary,hasBold: true,),
                  const MyDivider(),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
