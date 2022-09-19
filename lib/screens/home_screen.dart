import 'package:flutter/material.dart';
import 'package:productos_app/screens/screens.dart';
import 'package:productos_app/services/auth_service.dart';
import 'package:productos_app/services/product_service.dart';
import 'package:productos_app/models/models.dart';

import 'package:productos_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {

  static String routeName = 'home';

  const HomeScreen({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        final productsService = Provider.of<ProductsService>(context);
        final authServise = Provider.of<AuthService>(context, listen: false);

        if(productsService.isLoading) return const LoadingScreen();
        return Scaffold(
            appBar: AppBar(
              title: const Text('Productos'),
              leading: IconButton(
                onPressed: () async {
                  await authServise.logout();
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
                icon: const Icon(Icons.login_outlined),
              ),
            ),
            body: ListView.builder(
                itemCount: productsService.products.length,
                itemBuilder: (context, index) => GestureDetector(
                    child: ProductCard(
                      product: productsService.products[index],
                    ),
                    onTap: () {
                      productsService.selectedProduct = productsService.products[index].copy();
                      Navigator.pushNamed(context, ProductScreen.routeName);
                    },
                ),
            ),
            floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
            floatingActionButton:  FloatingActionButton(
              backgroundColor: Colors.lightGreen,
              child: const Icon(Icons.add),
              onPressed: () {
                productsService.selectedProduct = Product(
                    available: false,
                    name: 'Producto temporal',
                    price: 0
                );
                Navigator.pushNamed(context, ProductScreen.routeName);

              },

            ),//Center
        ); //Scaffold
    }
}