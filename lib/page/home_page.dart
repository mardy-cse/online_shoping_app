import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/login_page.dart';
import 'package:online_shoping_app/page/material/color.dart';
import 'package:online_shoping_app/page/widget/elevated_button.dart';
import 'model/product.dart';

class HomePage extends StatefulWidget {
  final Function(Product) onAddToCart;

  HomePage({required this.onAddToCart});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _auth = FirebaseAuth.instance;
  List<Product> productList = [
    Product(
      id: '1',
      imagePath: 'assets/img/black_headPhone.png',
      price: '249.50',
      title: 'SONY Premium  Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
    ),
    Product(
      id: '2',
      imagePath: 'assets/img/white headphone.png',
      price: '129.00',
      title: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
    ),
    Product(
      id: '3',
      imagePath: 'assets/img/laptop.png',
      price: '749.99',
      title: 'HP OMEN - 16.1" 144Hz Full HD ',
      subtitle: 'Gaming Laptop',
    ),
    Product(
      id: '4',
      imagePath: 'assets/img/samtv.png',
      price: '497.99',
      title: 'Samsung Led Tv Dual LED,Q-Symphony',
      subtitle: 'Q60C Series Quantum HDR,',
    ),
    Product(
      id: '5',
      imagePath: 'assets/img/black_headPhone.png',
      price: '249.50',
      title: 'SONY Premium  Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
    ),
    Product(
      id: '6',
      imagePath: 'assets/img/white headphone.png',
      price: '129.00',
      title: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
    ),
    Product(
      id: '7',
      imagePath: 'assets/img/laptop.png',
      price: '749.99',
      title: 'HP OMEN - 16.1" 144Hz Full HD ',
      subtitle: 'Gaming Laptop',
    ),
    Product(
      id: '8',
      imagePath: 'assets/img/samtv.png',
      price: '497.99',
      title: 'Samsung Led Tv Dual LED,Q-Symphony',
      subtitle: 'Q60C Series Quantum HDR,',
    ),
    // ... other products
  ];
  var size, height, width;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 60,
                  child: Text(
                    'Hello John',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 95,
                  child: CustomElevatedButton(buttonText: 'Logout', onPressed: ()async{
                    await _auth.signOut();
                    Navigator.push(context,
                    MaterialPageRoute(builder: (context)=>LoginScreen()));
                  }),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(left: 20, right: 20),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  mainAxisExtent: 280,
                ),
                itemCount: productList.length,
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(left: 5,right: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                            width: 150,
                            height: 155,
                            padding: EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              color: Color(0xffF5F5F5),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 2,
                                  spreadRadius: 1,
                                )
                              ],
                            ),
                            child: Image.asset(productList[index].imagePath ?? 'assets/placeholder_image.png',),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, bottom: 5, top: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '\$${productList[index].price ?? 0.0}',
                                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                              ),
                              Text(
                                productList[index].title ?? 'No title',
                                style: TextStyle(fontSize: 12),
                              ),
                              Text(
                                productList[index].subtitle ?? 'No subtitle',
                                style: TextStyle(fontSize: 8, color: Colors.grey),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          height: 25,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: colorOrange,
                            ),
                            onPressed: () {
                              widget.onAddToCart(productList[index]);
                            },
                            child: Text(
                              'Add To Cart',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<Product> cartList = [];

  // Function to add product to the cart
  void addToCart(Product product) {
    // Check if the product with the same ID is already in the cart
    var existingProductIndex =
    cartList.indexWhere((cartProduct) => cartProduct.id == product.id);

    if (existingProductIndex != -1) {
      // If the product is already in the cart, update the quantity and price
      setState(() {
        cartList[existingProductIndex].quantity++;
      });
    } else {
      // If the product is not in the cart, add it to the cart
      setState(() {
        // Clone the product to avoid modifying the original product in the list
        Product clonedProduct = Product(
          id: product.id,
          imagePath: product.imagePath,
          price: product.price,
          title: product.title,
          subtitle: product.subtitle,
          quantity: 1, // Set initial quantity to 1
        );
        cartList.add(clonedProduct);
      });
    }
  }


}
