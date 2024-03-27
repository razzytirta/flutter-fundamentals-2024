import 'package:belajar_flutter_bloc_hydrated/color_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  BlocSupervisor.delegate = await HydratedBlocDelegate.build();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<ColorBloc>(
        builder: (context) => ColorBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc bloc = BlocProvider.of<ColorBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Flutter Bloc Hydrated"),
      ),
      body: Center(
        child: BlocBuilder<ColorBloc, Color>(
          builder: (context, currentColor) {
            print(currentColor);
            return AnimatedContainer(
              duration: Duration(milliseconds: 500),
              width: 100,
              height: 100,
              color: currentColor,
            );
          },
        ),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.toAmber);
            },
            backgroundColor: Colors.amber,
          ),
          SizedBox(width: 10),
          FloatingActionButton(
            onPressed: () {
              bloc.dispatch(ColorEvent.toLightBlue);
            },
            backgroundColor: Colors.lightBlue,
          ),
        ],
      ),
    );
  }
}
