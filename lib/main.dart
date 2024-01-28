import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ShoppingApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class ShoppingApp extends StatefulWidget {
  @override
  _ShoppingAppState createState() => _ShoppingAppState();
}

class _ShoppingAppState extends State<ShoppingApp> {
  List<Product> products = [
    Product(name: 'Product 1', price: 10.0),
    Product(name: 'Product 2', price: 20.0),
    Product(name: 'Product 3', price: 15.0),
  ];

  List<Product> cart = [];

  void addToCart(Product product) {
    setState(() {
      cart.add(product);
    });
  }

  double calculateTotal() {
    double total = 0.0;
    for (var product in cart) {
      total += product.price;
    }
    return total;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart App'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: products.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(products[index].name),
                  subtitle: Text('\$${products[index].price.toStringAsFixed(2)}'),
                  trailing: ElevatedButton(
                    onPressed: () {
                      addToCart(products[index]);
                    },
                    child: Text('Add to Cart'),
                  ),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(16.0),
            color: Colors.blue,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Cart',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                for (var item in cart)
                  ListTile(
                    title: Text(item.name),
                    subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
                  ),
                SizedBox(height: 10),
                Text(
                  'Total: \$${calculateTotal().toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Product {
  final String name;
  final double price;

  Product({required this.name, required this.price});
}
