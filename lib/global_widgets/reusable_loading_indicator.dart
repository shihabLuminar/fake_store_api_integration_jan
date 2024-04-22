import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ReusableLoadinIndicator extends StatelessWidget {
  const ReusableLoadinIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset("assets/animations/loading.json"),
    );
  }
}
