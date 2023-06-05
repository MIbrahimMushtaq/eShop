import 'package:e_com_shop/modules/cart/cart_view.dart';
import 'package:e_com_shop/modules/product/product_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardLogic extends GetxController{
  int selectedIndex = 0;
   List<Widget> widgetOptions = <Widget>[
    ProductView(),
    CartView(),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
    Text('Profile Page', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold)),
  ];

  void onItemTapped(int index) {
      selectedIndex = index;
      update();
  }
}