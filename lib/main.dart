import 'package:flutter/material.dart';
import 'ui/screens.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Lato',
          colorScheme: ColorScheme.fromSwatch(
            primarySwatch: Colors.blue,
          ).copyWith(
            secondary: Colors.deepOrange,
          )),
      // home: const SafeArea(
      //   // child: ProductDetailScreen(
      //   //   ProductsManager().items[0],
      //   //),
      //   //   child: ProductsOverviewScreen(),
      //   // ),
      //   // child: UserProductScreen(),
      //   // child: CartScreen(),
      //   child: OrdersScreen(),
      // ),
      home: const ProductsOverviewScreen(),
      routes: {
        CartScreen.routeName: (ctx) => const CartScreen(),
        OrdersScreen.routeName: (ctx) => const OrdersScreen(),
        UserProductScreen.routeName: (ctx) => const UserProductScreen(),
      },
      onGenerateRoute: (settings) {
        if (settings.name == ProductDetailScreen.routeName) {
          final productId = settings.arguments as String;
          return MaterialPageRoute(
            builder: (ctx) {
              return ProductDetailScreen(
                ProductsManager().findById(productId),
              );
            },
          );
        }
        return null;
      },
    );
  }
}
