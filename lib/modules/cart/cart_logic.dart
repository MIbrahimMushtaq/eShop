
import 'package:get/get.dart';
import 'package:my_widgets/dialogs/dialogs.dart';

import '../../s.dart';
import '../product/product_model.dart';

class CartLogic extends GetxController{
  int totalPrice = 0;

  onRemoveItemFromCartTap(Product item) async {
    bool result = await Dialogs.showNativeDialog(title: 'Confirmation',message: 'Are you sure you want to remove item from cart?',okBtn: 'Remove',cancelBtn: 'Cancel');
    if(!result){
      return;
    }
    S.sRemoveFromCart(item);
    update();
  }

  Future<void> onClearCartListTap() async {
    bool result = await Dialogs.showNativeDialog(title: 'Confirmation',message: 'Are you sure you want to clear cart list?',okBtn: 'Clear',cancelBtn: 'Cancel');
    if(!result){
      return;
    }
    S.sCartList.clear();
    update();

  }

  addRemoveTap(Product item) {
    if(item.qty >1){
      item.qty--;
    }
    update();
  }

  onAddTap(Product item) {
    item.qty++;
    update();
  }
}