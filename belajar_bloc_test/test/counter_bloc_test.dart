import 'package:belajar_bloc_test/bloc/counter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group("Testing Counter Bloc", () {
    blocTest(
      "Inisialisasi Counter Bloc",
      build: () => CounterBloc(),
      expect: [0],
    );

    blocTest(
      "Add Event",
      build: () => CounterBloc(),
      act: (bloc) async {
        bloc.add(Add(2));
      },
      expect: [0, 2],
    );

    blocTest(
      "Subtract Event",
      build: () => CounterBloc(),
      act: (bloc) async {
        bloc.add(Subtract(2));
      },
      expect: [0, -2],
    );

    blocTest(
      "Add & Subtract Event",
      build: () => CounterBloc(),
      act: (bloc) async {
        bloc.add(Add(2));
        bloc.add(Subtract(5));
        bloc.add(DoingNothing());
        bloc.add(Add(10));
      },
      expect: [0, 2, -3, 7],
    );
  });
}
