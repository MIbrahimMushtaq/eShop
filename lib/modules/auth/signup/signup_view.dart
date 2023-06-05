import 'package:e_com_shop/main.dart';
import 'package:e_com_shop/modules/auth/signup/signup_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/input.dart';
import 'package:my_widgets/widgets/loading.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../../utils/utils.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SignUpLogic>(
        init: SignUpLogic(),
        builder: (logic){
      return Scaffold(

        appBar: AppBar(backgroundColor: Clr.colorTransparent,elevation: 0,iconTheme: IconThemeData(color: Clr.colorPrimary)),

        body: SafeArea(
          child: Container(
            width: deviceWidth,
            padding: const EdgeInsets.all(Siz.standardPadding),
            child: SingleChildScrollView(
              child: Form(
                key: logic.formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Txt('Create Account',fontSize: 22,hasBold: true,),
                    const Txt('Please create account to access eCommerce Shop',),
                    const MyDivider(),
                    TxtFormInput(hintText: 'Email',hasBorder: true,controller: logic.email,preFix: const Icon(Icons.email_outlined),),
                    const MyDivider(),
                    TxtFormInput(hintText: 'Password',hasBorder: true,controller: logic.password,preFix: const Icon(Icons.lock_open_outlined),postFix: Icon(Icons.visibility_outlined),),
                    const MyDivider(),
                    const MyDivider(),
                    logic.isLoading ? const LoadingPro() : Btn(text:'Log Up',onPressed:logic.onSignUpTap,width: double.infinity,hasBorder: false,hasBold: true,),
                    const MyDivider(),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
