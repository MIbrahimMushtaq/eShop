import 'package:get/get.dart';

import '../../s.dart';
import '../product/product_model.dart';

class ProductDetailLogic extends GetxController{
  double qty = 1;
  final Product productItem;

  ProductDetailLogic(this.productItem);


  void onRemoveTap() {
    if(qty >= 1 ){
      qty--;
      productItem.qty = qty;
      update();
    }
  }

  void onAddTap() {
    qty++;
    productItem.qty = qty;
    update();
  }

  onAddToCartTap(Product productItem) {
    S.sAddToCart(productItem);
  }
}