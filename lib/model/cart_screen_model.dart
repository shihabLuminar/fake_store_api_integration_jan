import 'package:fake_store_api_integration_jan/model/products_res_model.dart';

class CartModel {
  ProductsResModel product;
  int qty;
  CartModel({required this.product, this.qty = 1});
}
