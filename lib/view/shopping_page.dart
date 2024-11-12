import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:learn_getx/controller/cart_controller.dart';
import 'package:learn_getx/controller/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());
  ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: GetX<ShoppingController>(builder: (controller) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    return Card(
                      margin: const EdgeInsets.all(12),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.products[index].productName}',
                                      style: TextStyle(fontSize: 24),
                                    ),
                                    Text(
                                        '${controller.products[index].productDescription}'),
                                  ],
                                ),
                                Text('\$${controller.products[index].price}',
                                    style: TextStyle(fontSize: 24)),
                              ],
                            ),
                            ElevatedButton(
                              style: const ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.blue)),
                              onPressed: () {
                                cartController
                                    .addToCart(controller.products[index]);
                              },
                              child: const Text(
                                'Add to Cart',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            // Get Builder
            GetBuilder<CartController>(
              builder: (controller) {
                return Text(
                  "Total Amount :\$ ${controller.testprice}",
                  style: const TextStyle(color: Colors.black, fontSize: 24),
                );
              },
            ),
            // Using Getx whhich is reactive approach
            GetX<CartController>(builder: (controller) {
              return Text(
                "Total Amount :\$ ${controller.totalPrice}",
                style: const TextStyle(color: Colors.black, fontSize: 24),
              );
            }),
            Obx(() {
              return Text(
                "Total Amount :\$ ${cartController.totalPrice}",
                style: const TextStyle(color: Colors.black, fontSize: 24),
              );
            }),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
