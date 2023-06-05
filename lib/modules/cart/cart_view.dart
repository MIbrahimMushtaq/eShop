import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../../main.dart';
import '../../../utils/utils.dart';
import '../../s.dart';
import 'cart_logic.dart';

class CartView extends StatelessWidget {

  const CartView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartLogic>(
        init: CartLogic(),
        builder: (logic){
         // logic.totalPrice = S.sCartList.asMap().entries.fold(0, (total, entry) => total + double.parse(entry.value.qty) * (entry.value.price));
          return Scaffold(
            appBar: AppBar(
              title: const Txt('Cart',hasBold: true,),
              centerTitle: false,
              backgroundColor: Clr.colorWhite,
              iconTheme: const IconThemeData(
                  color: Clr.colorBlack
              ),
              elevation: 0,
              actions: [
                if(S.sCartList.isNotEmpty)
                CircleAvatar(backgroundColor: Clr.colorPrimary,child: IconButton(onPressed:logic.onClearCartListTap, icon: const Icon(Icons.delete, color: Clr.colorWhite,))),
                const MyVerticalDivider(),
              ],
            ),
            body: Column(
              children: [
                Expanded(child: ListView.builder(
                  itemCount: S.sCartList.length,
                  itemBuilder: (BuildContext context, int index) {
                    final item = S.sCartList[index];
                    return Container(
                      padding: const EdgeInsets.all(12),
                      margin: const EdgeInsets.all(12),
                      width: deviceWidth,
                      height: 100,
                      decoration: pBoxDecoration(
                          color: Clr.colorWhite,
                          shadowColor: Clr.colorGrey,
                          shadowRadius: 3
                      ),
                      child: Row(
                        children: [
                           GetImage(
                            width: 90,
                            height: 170,
                            imagePath: item.image,
                            isAssets: false,
                            fit: BoxFit.scaleDown,
                          ),
                          const MyVerticalDivider(width: 12,),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Expanded(child: Txt(item.name,hasBold: true,maxLine: 1,)),
                                    InkWell(
                                      onTap:()=>logic.onRemoveItemFromCartTap(item),
                                      child: const Icon(Icons.close),
                                    ),
                                  ],
                                ),
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Txt('${item.price} x ${item.qty}',textColor: Clr.colorGrey,),
                                    const MyVerticalDivider(),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      GestureDetector(
                                        onTap: ()=>logic.addRemoveTap(item),
                                        child: Container(
                                          decoration: pBoxDecoration(
                                            color: Clr.colorPrimary,
                                            radius: 6,
                                          ),
                                          height: 25,
                                          width: 25,
                                          child: const Icon(Icons.remove, color: Clr.colorWhite,),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                                        child: Txt(item.qty.toString()),
                                      ),
                                      GestureDetector(
                                        onTap:()=>logic.onAddTap(item),
                                        child: Container(
                                          decoration: pBoxDecoration(
                                            color: Clr.colorPrimary,
                                            radius: 6,
                                          ),
                                          height: 25,
                                          width: 25,
                                          child: const Icon(Icons.add, color: Clr.colorWhite,),
                                        ),
                                      ),
                                    ],),
                                    Txt('${'Pkr'} ${(double.parse('${item.price}') * item.qty )}',hasBold: true,textAlign: TextAlign.right,),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  },)),
                if(S.sCartList.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(Siz.standardPadding),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const Txt('Total',hasBold: true,),
                          Txt('(${S.sCartList.length} ${'items'})',textColor: Clr.colorGrey,),
                          const Spacer(),
                          Txt('${'PKR'} 300',hasBold: true,),
                        ],
                      ),
                      const MyDivider(),
                      Btn(text: 'Proceed to checkout',onPressed:(){}, width: double.infinity,hasBorder: false,),
                      const MyDivider(),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

}