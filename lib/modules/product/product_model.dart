class Product {
  String id;
  String? name;
  String? image;
  String? description;
  int? price;
  bool isFav;
  double qty = 1.0;

  Product({required this.id, this.name, this.description, this.price,this.image,required this.isFav});

  factory Product.fromMap(Map<String, dynamic> map) {
    return Product(
      id: map['id'],
      name: map['name'],
      description: map['description'],
      image: map['image'],
      price: map['price'],
      isFav: map['isFav'],
    );
  }
}