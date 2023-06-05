import 'package:e_com_shop/main.dart';
import 'package:e_com_shop/modules/product_detail/product_detail_logic.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../utils/utils.dart';
import '../cart/cart_view.dart';
import '../product/product_model.dart';

class ProductDetailView extends StatelessWidget {
  final Product productItem;
  const ProductDetailView({required this.productItem,Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailLogic>(
        init: ProductDetailLogic(productItem),
        builder: (logic){
      return Scaffold(
        backgroundColor: Clr.colorPrimary,
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          backgroundColor: Clr.colorTransparent,
          elevation: 0,
          leading: InkWell(
            onTap: (){},
            child: const Padding(
              padding: EdgeInsets.all(8.0),
              child: CircleAvatar(
                  backgroundColor: Clr.colorWhite,
                  child: BackButton(color: Clr.colorBlack,)),
            ),
          ),
          iconTheme: const IconThemeData(
            color: Clr.colorBlack
          ),
          actions: [
            CircleAvatar(
                backgroundColor: Clr.colorWhite,
                child: IconButton(onPressed: (){
                  Get.to(()=>const CartView());
                }, icon: const Icon(Icons.shopping_cart,color: Clr.colorBlack,))),
            const MyVerticalDivider(width: 5,),
          ],
        ),
        body: Column(
          children: [
            const MyDivider(height: 50,),
            GetImage(imagePath:productItem.image,width: deviceWidth * 0.7,height: 200,radius: 0,fit: BoxFit.scaleDown,),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: Siz.standardPadding,left: Siz.standardPadding,right: Siz.standardPadding),
                decoration: pBoxDecoration(
                color: Clr.colorWhite,
                borderRadius: const BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20),)
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Txt(productItem.name,hasBold: true,fontSize: 18,)),
                        IconButton(onPressed: (){
                          productItem.isFav = !productItem.isFav;
                          logic.update();
                        }, icon: Icon( productItem.isFav == true ? Icons.favorite : Icons.favorite_border ,color: Colors.red,))
                      ],
                    ),
                    const MyDivider(height: 5,),
                    Expanded(child: SingleChildScrollView(child: Txt(productItem.description,textColor: Clr.colorGrey,))),
                    const MyDivider(),
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      decoration: pBoxDecoration(
                        color: Clr.colorPrimary,
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          OutlinedButton(onPressed:logic.onRemoveTap, child: const Icon(Icons.remove,color: Clr.colorGrey,)),
                            Container(
                              width: 60,
                              alignment: Alignment.center,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Txt(logic.qty.toString()),
                              ),
                            ),
                          OutlinedButton(onPressed:logic.onAddTap, child: const Icon(Icons.add,color: Clr.colorGrey,),)

                          ],)),
                          InkWell(
                            onTap: ()=>logic.onAddToCartTap(productItem),
                            child: Container(
                              padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 12),
                              decoration: pBoxDecoration(
                                color: Clr.colorBlack,
                                borderRadius: const BorderRadius.only(topLeft: Radius.circular(8),bottomLeft: Radius.circular(8),)
                              ),
                              child: const Txt('Add to cart',textColor: Clr.colorWhite,hasBold: true,),
                            ),
                          ),
                        ],
                      ),
                    )


                  ],
                ),

              ),
            )
          ],
        ),
      );
    });
  }
}
