import 'package:belajar_multibloc/bloc/color_bloc.dart';
import 'package:belajar_multibloc/bloc/counter_bloc.dart';
import 'package:belajar_multibloc/ui/main_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          builder: (context) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          builder: (context) => CounterBloc(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}
