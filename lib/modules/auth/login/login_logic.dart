
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

import '../../dashboard/dashboard_view.dart';

class LoginLogic extends GetxController{
  var email = TextEditingController();
  var password = TextEditingController();
  bool isLoading = false;


  Future<void> onLoginTap() async {
    if(email.text.isEmpty){
      pShowToast(message: 'Please enter email');
      return;
    }
    if(password.text.isEmpty){
      pShowToast(message: 'Please enter password');
      return;
    }
    isLoading = true;
    update();

    try {
      UserCredential credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email.text,
          password: password.text
      );
      if(credential.user?.uid !=null){
        pSetRout(page: ()=>const DashboardView(),routeType: RouteType.pushReplaceAll);
      }
      isLoading = true;
      update();

    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        pShowToast(message: 'No user found for that email');
      } else if (e.code == 'wrong-password') {
        pShowToast(message: 'Wrong password provided for that user');
      }else{
        debugPrint(e.toString());
      }
      isLoading = true;
      update();
    }
  }

}