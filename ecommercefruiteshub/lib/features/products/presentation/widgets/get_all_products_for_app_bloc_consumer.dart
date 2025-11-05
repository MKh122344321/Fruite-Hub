import 'package:flutter/material.dart';

import 'products_screen_bloc_consumer.dart';

class GetAllProductsForAppBlocConsumer extends StatelessWidget {
  const GetAllProductsForAppBlocConsumer({super.key});

  @override
  Widget build(BuildContext context) {
    return ProductsScreenBlocConsumer();
  }
}
