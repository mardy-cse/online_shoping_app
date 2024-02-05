import 'package:flutter/material.dart';
import 'package:online_shoping_app/page/widget/cart_items.dart';
import 'model/product.dart';

class CartPage extends StatefulWidget {
  final List<Product> selectedProducts;

  CartPage({required this.selectedProducts, required product});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    double totalPrice = widget.selectedProducts.fold(
        0, (previousValue, product) =>
    previousValue + double.parse(product.price ?? '0.0') * product.quantity);
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 70),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: Text(
                  'My Cart',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              // Display the selected products using CartItems widget
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: widget.selectedProducts.length,
                itemBuilder: (context, index) {
                  return CartProduct(
                    product: widget.selectedProducts[index],
                    onRemove: () {
                      // Handle removal of the product from the list
                      setState(() {
                        widget.selectedProducts.removeAt(index);
                      });
                    },
                    onChange: (){
                      print("cart item changed");
                      setState(() {

                      });
                    }
                  );
                },
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  Text('Total Price: \$${totalPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
