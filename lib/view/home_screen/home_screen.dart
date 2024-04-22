import 'package:fake_store_api_integration_jan/controller/cart_scren_controller.dart';
import 'package:fake_store_api_integration_jan/controller/home_screen_controller.dart';
import 'package:fake_store_api_integration_jan/global_widgets/reusable_loading_indicator.dart';
import 'package:fake_store_api_integration_jan/view/cart_screen/cart_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      await Provider.of<HomeScreenController>(context, listen: false)
          .getProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final homeScreenState = context.watch<HomeScreenController>();
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CartScreen(),
                    ));
              },
              icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: homeScreenState.isLoading
          ? Center(child: ReusableLoadinIndicator())
          : ListView.builder(
              itemCount: homeScreenState.productsList.length,
              itemBuilder: (context, index) => Container(
                child: ListTile(
                  leading: Image.network(
                      homeScreenState.productsList[index].image ?? ""),
                  title: Text(
                      homeScreenState.productsList[index].title.toString()),
                  subtitle: Text(
                      homeScreenState.productsList[index].price.toString()),
                  trailing: IconButton(
                      onPressed: () {
                        Provider.of<CartScreenController>(context,
                                listen: false)
                            .addToCart(
                                homeScreenState.productsList[index], context);
                      },
                      icon: Icon(Icons.add_shopping_cart)),
                ),
              ),
            ),
    );
  }
}
