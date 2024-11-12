import 'package:get/state_manager.dart';
import 'package:learn_getx/model/product.dart';

class CartController extends GetxController {
  var cartItems = <Product>[].obs;
  double get totalPrice => cartItems.fold(
        0,
        (sum, item) => sum + item.price,
      );

  var testprice = 0.0;

  addToCart(Product product) {
    cartItems.add(product);
    testprice = totalPrice;
    // GetBuilder is used without obs variable. So we need to update it using update method
    update();
  }
}
