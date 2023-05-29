import 'package:fresh_picks/models/product%20.dart';
import 'package:get/get.dart';
import 'package:audioplayers/audioplayers.dart';

import '../../consts/consts.dart';
import '../../controller/cart_control.dart';
import '../cart_screen/cart_screen.dart';

class ItemDetails extends StatelessWidget {
  final Product product;
  ItemDetails(this.product);
  final CartController _cartController =
      Get.put(CartController()); // Instantiate your cart controller

  final player = AudioCache();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: product.name.text.color(redColor).fontFamily(bold).make(),
        actions: [
          IconButton(
            onPressed: () {},
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
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(8),
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
                            product.image == null ? imgnot : product.image!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    product.name.text
                        .size(20)
                        .color(mainColor)
                        .fontFamily(semibold)
                        .make(),
                    SizedBox(height: 10),
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      count: 5,
                      size: 25,
                      stepInt: true,
                    ),
                    SizedBox(height: 10),
                    "${product.price}\$"
                        .text
                        .color(mainColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    SizedBox(height: 10),
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              "Contact the merchant"
                                  .text
                                  .white
                                  .fontFamily(semibold)
                                  .make(),
                              SizedBox(height: 5),
                              "Not available to chat now"
                                  .text
                                  .fontFamily(semibold)
                                  .color(darkFontGrey)
                                  .make(),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.white,
                          child: Icon(Icons.message),
                        ),
                      ],
                    )
                        .box
                        .height(60)
                        .padding(EdgeInsets.symmetric(horizontal: 16))
                        .color(textfieldGrey)
                        .make(),
                    SizedBox(height: 10),
                    Container(
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            "Description:".text
                                .color(Colors.black)
                                .fontFamily(semibold)
                                .size(18)
                                .make(),
                            SizedBox(height: 10),
                            "This is a dummy item and the description goes here."
                                .text
                                .color(Colors.black)
                                .fontFamily(regular)
                                .make(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 60,
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: mainColor,
                elevation: 0, // Remove button elevation
              ),
              onPressed: () {
                addToCart(product);
               // player.play('add_to_cart_sound.mp3'); // Play sound effect
                showSnackbar('Product added to cart'); // Show snackbar
              },
              child: "Add to Cart"
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
       const GetSnackBar(
                                
                                message:  'The product has been added to the cart.',
                                icon:   Icon(Icons.done),
                                backgroundColor: mainColor,
                                duration:  Duration(seconds: 4),
                              ),
       
     
      
    );
  }
}
