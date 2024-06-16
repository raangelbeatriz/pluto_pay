import 'package:flutter/material.dart';
import '../payment_module.dart';

class PaymentPage extends StatelessWidget {
  const PaymentPage({super.key});

  static const String routeName = '/payment-page';
  static const String routePath = PaymentModule.moduleName + routeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment'),
      ),
      body: Container(),
    );
  }
}
