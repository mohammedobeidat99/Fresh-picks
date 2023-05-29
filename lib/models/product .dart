class Product {
  final String id;
  final String name;
  final double price;
  final String ? image;
  int quantity;

  Product({required this.id, required this.name, required this.price, this.image,this.quantity = 1});
}