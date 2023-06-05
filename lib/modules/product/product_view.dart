import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_com_shop/modules/product/product_model.dart';
import 'package:e_com_shop/modules/welcome/welcome_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_widgets/my_widgets.dart';
import 'package:my_widgets/widgets/btn.dart';
import 'package:my_widgets/widgets/dividers.dart';
import 'package:my_widgets/widgets/get_images.dart';
import 'package:my_widgets/widgets/input.dart';
import 'package:my_widgets/widgets/txt.dart';

import '../../utils/utils.dart';
import 'products_logic.dart';

class ProductView extends StatelessWidget {
  const ProductView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductLogic>(
        init: ProductLogic(),
        builder: (logic){
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.all(Siz.standardPadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TxtFormInput(hintText: 'Search...',hasBorder: true,controller: logic.search,onChanged: logic.onSearch,),
              const MyDivider(),
              const Txt('Our Products',hasBold: true,fontSize: 18,),
              const MyDivider(),
              Expanded(child: StreamBuilder(
                stream: FirebaseFirestore.instance
                    .collection('products')
                    .snapshots(),
                builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  }
                  List<Product> products = snapshot.data!.docs.map((DocumentSnapshot doc) {
                    return Product.fromMap(doc.data() as Map<String, dynamic>);}).toList();
                  if (logic.searchValue.isNotEmpty) {
                    products = products
                        .where((product) => (product.name??'').toLowerCase().contains(logic.searchValue))
                        .toList();
                  }
                  return GridView.builder(
                    itemCount: products.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      mainAxisExtent: 190
                    ), itemBuilder: (BuildContext context, int index) {
                      final item = products[index];
                    return InkWell(
                      onTap:()=>logic.onProductItemTap(item),
                      child: Container(
                        decoration: pBoxDecoration(
                          color: Clr.colorWhite,
                          shadowRadius: 1,
                          shadowColor: Clr.colorGreyLight
                        ),
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                GetImage(
                                  imagePath: item.image,
                                  isAssets: false,
                                  height: 100,
                                  width: double.infinity,
                                  onTap:()=>logic.onProductItemTap(item),
                                ),
                                Positioned(
                                  top: 3,
                                    right: 3,
                                    child: CircleAvatar(
                                      backgroundColor: Clr.colorBlack.withOpacity(0.2),
                                      radius: 16,
                                      child: Icon( item.isFav == true ? Icons.favorite : Icons.favorite_border ,color: Colors.red,),
                                    ))
                              ],
                            ),
                            Container(
                              padding: const EdgeInsets.all(8),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Txt(item.name,fontSize: 13,hasBold: true,maxLine: 1,),
                                  const MyDivider(height: 3,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Txt('Price',fontSize: 12,hasBold: true,),
                                      Txt(item.price.toString(),fontSize: 12,),
                                    ],
                                  ),
                                  const MyDivider(height: 3,),
                                  Btn(text: 'Buy',onPressed: (){},height: 30,hasBorder: false,width: double.infinity,borderColor: Clr.colorPrimary,)

                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },);
                },
              ))
            ],
          ),
        ),
      );
    });
  }
}
