import 'package:fake_store_api_integration_jan/controller/cart_scren_controller.dart';
import 'package:fake_store_api_integration_jan/controller/home_screen_controller.dart';
import 'package:fake_store_api_integration_jan/view/home_screen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeScreenController()),
        ChangeNotifierProvider(create: (context) => CartScreenController())
      ],
      child: MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
