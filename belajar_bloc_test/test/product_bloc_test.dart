import 'package:belajar_bloc_test/bloc/product_bloc.dart';
import 'package:belajar_bloc_test/model/product.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group("Product Bloc Test", () {
    blocTest(
      "Initial Value",
      build: () => ProductBloc(),
      expect: [ProductInitial()],
    );
    blocTest("Add Product",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(AddProduct(Product("Apple", 2000)));
        },
        expect: [
          ProductInitial(),
          ProductLoaded([Product("Apple", 2000)])
        ]);

    blocTest("Add 2 Product",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(AddProduct(Product("Apple", 2000)));
          bloc.add(AddProduct(Product("Durian", 100000)));
        },
        expect: [
          ProductInitial(),
          ProductLoaded([Product("Apple", 2000)]),
          ProductLoaded([Product("Apple", 2000), Product("Durian", 100000)]),
        ]);

    blocTest("Remove Product",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(RemoveProduct(Product("Apple", 2000)));
        },
        expect: [
          ProductInitial(),
        ]);

    blocTest("Remove Products (Product Loaded)",
        build: () => ProductBloc(),
        act: (bloc) async {
          bloc.add(AddProduct(Product("Apple", 2000)));
          bloc.add(RemoveProduct(Product("Apple", 2000)));
        },
        expect: [
          ProductInitial(),
          ProductLoaded([Product("Apple", 2000)]),
          ProductLoaded([])
        ]);
  });
}
