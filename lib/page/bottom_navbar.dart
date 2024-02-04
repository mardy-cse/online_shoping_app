import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/material/color.dart';
import 'cart_page.dart';
import 'home_page.dart';
import 'model/product.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _currentIndex = 0;
  List<Product> _selectedProducts = [];

  late List<Widget> _pages;
  @override
  void initState() {
    super.initState();

    _pages = [
      HomePage(onAddToCart: _handleAddToCart),
      CartPage(selectedProducts: _selectedProducts, product: null,),
    ];
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: colorOrange,
        selectedIconTheme: IconThemeData(color: colorOrange),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
          ),
        ],
      ),
    );
  }

  void _handleAddToCart(Product product) {
    setState(() {
      _selectedProducts.add(product);
    });
  }

}
