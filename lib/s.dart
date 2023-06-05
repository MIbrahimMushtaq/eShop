import 'modules/product/product_model.dart';

class S{
  static List<Product> sCartList = [];
  static List<Product> sWishList = [];

  static sAddToCart(Product item){
    sCartList.add(item);
  }
  static sRemoveFromCart(Product item){
    sCartList.remove(item);
  }

  static sAddToWishList(Product item){
    sWishList.add(item);
  }
  static sRemoveFromWishList(Product item){
    sWishList.remove(item);
  }

  static Product get getsCartList => S.getsCartList ;
}