import 'package:fresh_picks/models/product%20.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:share/share.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../consts/consts.dart';
import '../../controller/cart_control.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  ItemDetails(this.product);
  final CartController _cartController = Get.put(CartController());

  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: product.name.text.color(redColor).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {
              shareProduct();
            },
            icon: const Icon(Icons.share),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                    autoPlay: true,
                    aspectRatio: 16 / 9,
                    height: 280,
                    itemCount: 3,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset(
                          product.image ?? imgnot,
                          width: double.infinity,
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  product.name.text
                      .size(20)
                      .color(mainColor)
                      .fontFamily(semibold)
                      .make(),
                  const SizedBox(height: 10),
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  const SizedBox(height: 10),
                  "${product.price}\$"
                      .text
                      .color(mainColor)
                      .fontFamily(bold)
                      .size(18)
                      .make(),
                  const SizedBox(height: 10),
                  Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            "Contact the merchant".tr
                                .text
                                .white
                                .fontFamily(semibold)
                                .make(),
                            const SizedBox(height: 5),
                            "Not available to chat now".tr
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                          ],
                        ),
                      ),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(Icons.message, color: mainColor),
                      ),
                    ],
                  )
                      .box
                      .height(60)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .color(textfieldGrey)
                      .make(),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            height: 60,
            
            width: 200,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                elevation: 0, // Remove button elevation
              ),
              onPressed: () {
                addToCart(product);
                // player.play('add_to_cart_sound.mp3'); // Play sound effect
                showSnackbar('Product added to cart'.tr); // Show snackbar
              },
              child: "Add to Cart".tr
                  .text
                  .color(whiteColor)
                  .fontFamily(semibold)
                  .size(18)
                  .make(),
            ),
          ),
        ],
      ),
    );
  }

  void addToCart(Product product) async {
    _cartController.addToCart(product);
  }

  void showSnackbar(String message) {
    Get.showSnackbar(
      GetSnackBar(
        message: message,
        icon: const Icon(Icons.done, color: whiteColor),
        backgroundColor: mainColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  void shareProduct() {
    Share.share('Check out this product: ${product.name}');
  }
}
