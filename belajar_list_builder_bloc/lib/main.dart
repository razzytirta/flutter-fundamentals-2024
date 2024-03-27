import 'dart:math';

import 'package:belajar_list_builder_bloc/product_card.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(
        builder: (context) => ProductBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  final Random rand = Random();
  @override
  Widget build(BuildContext context) {
    ProductBloc bloc = BlocProvider.of<ProductBloc>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF44336),
        title: Text("Belajar ListView Builder Bloc"),
      ),
      body: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: () {
              bloc.dispatch(rand.nextInt(10) + 2);
            },
            color: Color(0xffF44336),
            child: Text(
              "Create Products",
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          BlocBuilder<ProductBloc, List<Product>>(
            builder: (context, products) => Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        (index == 0)
                            ? SizedBox(
                                width: 20,
                              )
                            : Container(),
                        ProductCard(
                          imageURL: products[index].imageUrl,
                          name: products[index].name,
                          price: products[index].price.toString(),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                      ],
                    );
                  }),
            ),
          )
        ],
      ),
    );
  }
}

class Product {
  String imageUrl;
  String name;
  int price;

  Product({this.imageUrl = "", this.name = "", this.price = 0});
}

class ProductBloc extends Bloc<int, List<Product>> {
  @override
  // TODO: implement initialState
  List<Product> get initialState => [];

  @override
  Stream<List<Product>> mapEventToState(int event) async* {
    List<Product> products = [];
    // TODO: implement mapEventToState
    for (var i = 0; i < event; i++) {
      products.add(
        Product(
          imageUrl:
              "https://i.pinimg.com/originals/ad/0d/02/ad0d023ce22d919f6ccf3bdb9341ef17.jpg",
          name: "Product " + i.toString(),
          price: (i + 1) * 5000,
        ),
      );
    }

    yield products;
  }
}
