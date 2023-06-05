import 'package:e_com_shop/modules/product/product_model.dart';
import 'package:e_com_shop/modules/product_detail/product_detail_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';

class ProductLogic extends GetxController{
  var search = TextEditingController();
  String searchValue = '';

  onProductItemTap(Product item) {
    pSetRout(page: ()=>ProductDetailView(productItem: item));
  }


  void onSearch(String value) {
    searchValue = value.toLowerCase();
    update();
  }
}
