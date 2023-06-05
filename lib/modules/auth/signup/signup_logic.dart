import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

import '../../dashboard/dashboard_view.dart';

class SignUpLogic extends GetxController{
  var email = TextEditingController();
  var password = TextEditingController();
  var formKey = GlobalKey<FormState>();
  bool isLoading = false;


  Future<void> onSignUpTap() async {
    if (!formKey.currentState!.validate()) {
     return;
    }
    isLoading = true;
    update();

    try {
      UserCredential credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email.text,
        password: password.text,
      );
      if(credential.user?.uid != null){
        pSetRout(page: ()=>const DashboardView(),routeType: RouteType.pushReplaceAll);
      }
      isLoading = false;
      update();
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        pShowToast(message: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        pShowToast(message: 'The account already exists for that email.');
      }
      isLoading = false;
      update();
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading = false;
    update();
  }

}