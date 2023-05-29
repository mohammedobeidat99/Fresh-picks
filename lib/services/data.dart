import 'package:fresh_picks/consts/consts.dart';

import '../consts/images.dart';
import '../models/category.dart';
import '../models/product .dart';

List<Category> categories = [
  Category(
    id: '1',
    name: 'Vegetable',
    image: vegetable,
    products: [
      Product(id: '1', name: 'Carrot', price: 1.99, image: Carrot),
      Product(id: '2', name: 'Tomato', price: 0.99 ,image: Tomato),
      Product(id: '3', name: 'Spinach', price: 2.49 ,image: Spinach),
    ],
  ),
  Category(
    id: '2',
    name: 'Winterfruits',
    image: winterfruits,
    products: [
      Product(id: '4', name: 'Apple', price: 0.79,image:imgApples),
      Product(id: '5', name: 'Banana', price: 0.49,image: Banana),
      Product(id: '6', name: 'Orange', price: 0.69,image: imgOrange),
      Product(id: '7', name: 'Clementines', price: 0.55, image: imgClementines),
      Product(id: '8', name: 'Grapefruit', price: 0.55,image: imgGrapefruit),
    ],
  ),
  Category(
    id: '3',
    name: 'Summer fruits',
    image: summerfruits,
    products: [
      Product(id: '9', name: 'Watermelon', price: 0.50,image: imgWatermelon),
      Product(id: '10', name: 'Strawberry', price: 1.00,image: imgStrawberry),
      Product(id: '11', name: 'Blueberries', price: 1.69,image: imgBlueberries),
      Product(id: '12', name: 'Peaches', price: 1.79,image: imgPeaches),
      Product(id: '13', name: 'Mango', price: 2.49,image: imgMango),
      


      
    ],
  ),

  Category(
    id: '4',
    name: 'Dry fruit',
    image: dryfood,
    products: [
      Product(id: '14', name: 'Rice', price: 3.99,image: Rice ),
      Product(id: '15', name: 'Pasta', price: 2.49,image:Pasta  ),
      Product(id: '16', name: 'Oats', price: 1.99,image:  Oats),
      Product(id: '17', name: 'Raisins', price: 1.79,image: raisins),
      Product(id: '18', name: 'Dried apricots', price: 2.49,image: dried),
      


      
    ],
  ),
];
