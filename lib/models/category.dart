import 'package:fresh_picks/models/product%20.dart';

class Category {
  final String id;
  final String name;
  final String ? image;
  
  
final List<Product> products;
  Category( {required this.id, required this.name, required this.products , this.image});
}