import 'package:flutter/material.dart';
import 'product_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ProductState>(
      create: (_) => ProductState(),
      builder: (context, _) => MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            title: Text(
              "Belajar Product Card",
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: primaryColor,
          ),
          body: Container(
            margin: EdgeInsets.all(20),
            child: Align(
              alignment: Alignment.topCenter,
              child: ProductCard(
                imageURL:
                    "https://i.pinimg.com/originals/ad/0d/02/ad0d023ce22d919f6ccf3bdb9341ef17.jpg",
                name: "Buah Buahan mix 1 Kg",
                price: "Rp25.000",
                quantity: context.read<ProductState>().quantity,
                notification: (context.watch<ProductState>().quantity > 5)
                    ? "Diskon 10%"
                    : null,
                onAddCartTap: () {
                  print("Add To Cart");
                },
                onIncTap: () {
                  print("tambah");
                  context.read<ProductState>().increment();
                },
                onDecTap: () {
                  context.read<ProductState>().decrement();
                  print("kurang");
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ProductState with ChangeNotifier {
  int _quantity = 0;

  int get quantity => _quantity;
  void increment() {
    _quantity++;
    notifyListeners();
  }

  void decrement() {
    _quantity--;
    notifyListeners();
  }
}
