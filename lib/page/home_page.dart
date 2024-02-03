import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/material/color.dart';
import 'model/product.dart';

class HomePage extends StatefulWidget {

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Product> productList = [
    Product(
      imagePath: 'assets/img/black_headPhone.png',
      price: 249.50,
      title: 'SONY Premium  Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
    ),
    Product(
      imagePath: 'assets/img/white headphone.png',
      price: 129.00,
      title: 'SONY Premium Wireless Headphones',
      subtitle: 'Model: WH-1000XM4, Black',
    ),
    Product(
      imagePath: 'assets/img/laptop.png',
      price: 749.99,
      title: 'HP OMEN - 16.1" 144Hz Full HD ',
      subtitle: 'Gaming Laptop',
    ),
    Product(
      imagePath: 'assets/img/samtv.png',
      price: 497.99,
      title: 'Samsung Led Tv Dual LED,Q-Symphony',
      subtitle: 'Q60C Series Quantum HDR,',
    ),
    // ... other products
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Product List'),
      ),
      body: Column(
        children: [
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
}
