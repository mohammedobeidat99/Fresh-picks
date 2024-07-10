import 'package:fresh_picks/consts/consts.dart';
import 'package:fresh_picks/view/cart_screen/out_pay.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Cart'.tr,
            style: TextStyle(color: mainColor, fontFamily: semibold)),
      ),
      body: Obx(
        () => cartController.isCartEmpty
            ? Center(
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
                            child: Text(product.name),
                          ),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              5.heightBox,
                              'JDO ${product.price.toStringAsFixed(2)}'
                                  .text
                                  .color(redColor)
                                  .make(),
                              Row(
                                children: [
                                  IconButton(
                                    icon: const Icon(
                                      Icons.remove,
                                      color: redColor,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        cartController.removeFromCart(product);
                                      });
                                    },
                                  ),
                                  Text(
                                    product.quantity.toString(),
                                    style:
                                        const TextStyle(fontFamily: semibold),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.green,
                                    ),
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
                            icon: const Icon(Icons.remove_circle),
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
                        'JOD ${cartController.totalAmount.toStringAsFixed(2)}'
                            .text
                            .color(redColor)
                            .fontFamily(semibold)
                            .size(18)
                            .make(),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: mainColor,
                          ),
                          onPressed: () async {
                            Get.to(() => PaymentScreen(
                                  products: cartController
                                      .cartItems, // Pass the list of products
                                  total: cartController
                                      .totalAmount, // Pass the total price
                                ));
                          },
                          child: Text(
                            'Checkout'.tr,
                            style: TextStyle(color: Colors.white),
                          ),
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
