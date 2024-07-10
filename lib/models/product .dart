class Product {
  final String id;
  final String name;
  final double price;
  final String  image;
  int quantity;
  final String ?urlMap;
  final String ?city;
  final String ?storeName;
  final String ?storeDis;
  final String ? storeImage;
  

  Product({required this.id, required this.name, required this.price,required this.image,this.quantity = 1,this.urlMap, this.city ,this.storeName ,this.storeDis , this.storeImage});

  static fromMap(item) {}
}





