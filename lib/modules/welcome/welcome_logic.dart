import 'dart:async';

import 'package:e_com_shop/modules/welcome/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

import '../auth/login/login_view.dart';
import '../auth/signup/signup_view.dart';
import '../dashboard/dashboard_view.dart';

class WelcomeLogic extends GetxController{


  FirebaseAuth auth = FirebaseAuth.instance;
  bool isLoading = false;
  @override
  void onInit() {
    callInit();
    super.onInit();
  }

  callInit() async {
    isLoading = true;
    update();
    User? user = await auth.currentUser;
    if(user != null){
      pSetRout(page: ()=> const DashboardView(),routeType: RouteType.pushReplaceAll);
      isLoading = false;
      update();
    }else{
      await Future.delayed(2.seconds);
      pSetRout(page: ()=>const WelcomeView());
      isLoading = false;
      update();
    }
  }

  void onLoginTap() {
    pSetRout(page: ()=>const LoginView());
  }

  void onSignUpTap() {
    pSetRout(page: ()=>const SignUpView());

  }
}