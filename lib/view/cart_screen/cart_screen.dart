import 'package:flutter/material.dart';
import 'package:fresh_picks/consts/colors.dart';
import 'package:fresh_picks/consts/consts.dart';
import 'package:fresh_picks/view/home_screen/home_screen.dart';
import 'package:get/get.dart';

import '../../controller/cart_control.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(           automaticallyImplyLeading: false,

        title: Text('Cart'.tr, style: TextStyle(color: mainColor,fontFamily: semibold)),
      ),
      body: Obx(
        () => cartController.isCartEmpty
            ?  Center(
                child: Text(
                  'Cart is empty'.tr,
                  style: TextStyle(color: mainColor),
                ),
              )
            : Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: cartController.cartItems.length,
                      itemBuilder: (context, index) {
                        final product = cartController.cartItems[index];
                        return ListTile(

                          leading: Image.asset(
                              width: 80, fit: BoxFit.cover, product.image!),
                          title: Padding(
                            padding: const EdgeInsets.only(top: 10.0),
                            child: Text(product.name ),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.heightBox,
                                  'Price: \$${product.price.toStringAsFixed(2)}'.text.color(redColor).make(),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(Icons.remove ,color: redColor,),
                                    onPressed: () {
                                      setState(() {
                                        cartController.removeFromCart(product);
                                      });
                                      
                                    },
                                  ),
                                  Text(product.quantity.toString(),style:const TextStyle(fontFamily: semibold),),
                                  IconButton(
                                    icon: const Icon(Icons.add, color: redColor ,),
                                    onPressed: () {
                                      setState(() {
                                         cartController.addToCart(product);
                                      });
                                     
                                    },
                                  ),
                                ],
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              cartController.removeFromCart(product);
                            },
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        
                          'Total: \$${cartController.totalAmount.toStringAsFixed(2)}'.text.color(redColor).fontFamily(semibold).size(18).make(),
                          
                        
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                          ),
                          onPressed: () async {
                           await cartController.uploadOrder();
                           
                          
                          },
                          child:  const Text('Checkout'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
