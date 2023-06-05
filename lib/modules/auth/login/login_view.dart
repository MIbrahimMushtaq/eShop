import 'package:e_com_shop/main.dart';
import 'package:e_com_shop/modules/auth/login/login_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/input.dart';
import 'package:my_widgets/widgets/loading.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../../utils/utils.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginLogic>(
        init: LoginLogic(),
        builder: (logic){
      return Scaffold(

        appBar: AppBar(backgroundColor: Clr.colorTransparent,elevation: 0,iconTheme: IconThemeData(color: Clr.colorPrimary)),

        body: SafeArea(
          child: Container(
            width: deviceWidth,
            padding: const EdgeInsets.all(Siz.standardPadding),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Txt('Welcome back',fontSize: 22,hasBold: true,),
                  const Txt('Please login to access eCommerce Shop',),
                  Align(
                      alignment: Alignment.center,
                      child: Image.asset(Images.login,height: deviceHeight * 0.3,fit: BoxFit.fill,)),
                  const MyDivider(),
                  TxtFormInput(hintText: 'Email',hasBorder: true,controller: logic.email,preFix: const Icon(Icons.email_outlined),),
                  const MyDivider(),
                  TxtFormInput(hintText: 'Password',hasBorder: true,controller: logic.password,preFix: const Icon(Icons.lock_open_outlined),postFix: Icon(Icons.visibility_outlined),),
                  const MyDivider(),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Txt('Forgot password?')
                    ],
                  ),
                  const MyDivider(),
                  const MyDivider(),
                  logic.isLoading ? const LoadingPro() : Btn(text:'Log in',onPressed:logic.onLoginTap,width: double.infinity,hasBorder: false,hasBold: true,),
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
