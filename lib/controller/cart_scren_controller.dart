import 'package:fake_store_api_integration_jan/model/cart_screen_model.dart';
import 'package:fake_store_api_integration_jan/model/products_res_model.dart';
import 'package:fake_store_api_integration_jan/view/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';

class CartScreenController with ChangeNotifier {
  List<CartModel> cartList = [];

  addToCart(ProductsResModel product, BuildContext context) {
    final isCarted =
        cartList.any((element) => element.product.id == product.id);

    if (isCarted) {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CartScreen(),
          ));
      print("already in cart");
    } else {
      cartList.add(CartModel(product: product));
    }

    notifyListeners();
  }

  deleteFromCart(int index) {
    cartList.removeAt(index);
    notifyListeners();
  }
}
