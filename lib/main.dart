import 'package:flutter/material.dart';
import 'package:shopping_app/screens/product_view.dart';
import 'package:flutter/rendering.dart';
import 'commons/constants.dart';
import 'screens/shop.dart';
import 'screens/my_cart.dart';

void main() {
  debugPaintSizeEnabled = false;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => MainPageState();
}

class MainPageState extends State<MainPage> {
  int currentIndex = 0;
  final screens = [
    const ProductScreen(),
    const CheckoutScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IndexedStack(
          index: currentIndex,
          children: screens,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: currentIndex,
          iconSize: 24.0,
          selectedItemColor: AppColors.PrimaryColor,
          unselectedItemColor: AppColors.Grey200,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          onTap: (index) => setState(() => currentIndex = index),
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'The Shop'),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_basket_rounded),
                label: 'Your Shopping Cart'),
          ]),
    );
  }
}
