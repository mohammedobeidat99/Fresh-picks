import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fresh_picks/consts/firebase_const.dart';
import 'package:fresh_picks/controller/auth_control.dart';
import 'package:fresh_picks/view/cart_screen/out_pay.dart';
import 'package:get/get.dart';

import '../consts/consts.dart';
import '../models/product .dart';

class CartController extends GetxController {
  // Get the current user using GetX (assuming you have an AuthController)

  var cartItems = <Product>[].obs;

  double get totalAmount =>
      cartItems.fold(0, (sum, item) => sum + (item.price * item.quantity));

  void addToCart(Product product) {
    final index = cartItems.indexWhere((item) => item.name == product.name);
    if (index != -1) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(product);
    }
  }

  void removeFromCart(Product product) {
    if (product.quantity > 1) {
      product.quantity--;
    } else {
      cartItems.remove(product);
    }
  }

  Future<void> uploadOrder() async {
    final orderData = {
      'items': cartItems
          .map((product) => {
                'name': product.name,
                'image': product.image,
                'price': product.price,
              })
          .toList(),
      'total': totalAmount,
      'timestamp': FieldValue.serverTimestamp(),
    };
//Order -> userid -> MyOrder->OrdersID -> products
//collection -> doc -> collection -> doc -> data
    try {
      await FirebaseFirestore.instance
          .collection('orders')
          .doc(currntUser!.uid)
          .collection('MyOrder') // Subcollection using the current user's UID
          .add(orderData);
      cartItems.clear();
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Order placed successfully.',
          icon: Icon(Icons.done),
          backgroundColor: mainColor,
          duration: Duration(seconds: 4),
        ),
         
      );
      
    } catch (error) {
      Get.showSnackbar(
        const GetSnackBar(
          message: 'Error, Failed to place the order.',
          icon: Icon(Icons.done),
          backgroundColor: mainColor,
          duration: Duration(seconds: 4),
        ),
      );
    }
  }

  bool get isCartEmpty => cartItems.isEmpty;
}
