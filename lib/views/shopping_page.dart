import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shopping_app/controllers/cart_controller.dart';
import 'package:shopping_app/controllers/shopping_controller.dart';

class ShoppingPage extends StatelessWidget {
  ShoppingPage({super.key});

  final shoppingController = Get.put(ShoppingController());
  final cartController = Get.put(CartController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: const Icon(Icons.add_shopping_cart_rounded, color: Colors.black,),
        backgroundColor: Colors.amber,
        label: GetX<CartController>(
          builder: (controller) {
            return Text(controller.count.toString(), style: const TextStyle(color: Colors.black, fontSize: 24),);
          }
        ),
      ),
      body: SafeArea(child: Column(
        children: [
          Expanded(
            child: GetX<ShoppingController>(
              builder: (controller) {
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
                                    Text(controller.products[index].productName, style: const TextStyle(fontSize: 24)),
                                    Text(controller.products[index].productDescription, style: const TextStyle(fontSize: 24))
                                  ],
                                ),
                                Text('\$${controller.products[index].price}', style: const TextStyle(fontSize: 24),)
                              ],
                            ),
                            ElevatedButton(
                              onPressed: () {
                                cartController.addToCart(controller.products[index]);
                              },
                              style: const ButtonStyle(backgroundColor: MaterialStatePropertyAll<Color>(Colors.blue), textStyle: MaterialStatePropertyAll(TextStyle(color: Colors.black))),
                              child: const Text('Add To Cart')
                            )
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
          GetX<CartController>(
            builder: (controller) {
              return Text('Total Amount: \$${controller.totalPrice}', style: const TextStyle(fontSize: 32, color: Colors.white));
            }
          ),
          const SizedBox(height: 100,)
        ],
      )),
    );
  }
}