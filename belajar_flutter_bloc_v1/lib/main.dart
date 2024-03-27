import 'package:belajar_flutter_bloc_v1/bloc/counter_bloc.dart';
import 'package:belajar_flutter_bloc_v1/bloc/counter_event.dart';
import 'package:belajar_flutter_bloc_v1/bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<CounterBloc>(
        builder: (context) => CounterBloc(),
        child: MainPage(),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc cBloc = BlocProvider.of<CounterBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Belajar Flutter BLoC V1"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<CounterBloc, CounterState>(
              builder: (context, counterState) => Text(
                counterState.value.toString(),
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FloatingActionButton(
                  onPressed: () {
                    cBloc.add(Decrement());
                  },
                  child: Icon(Icons.arrow_downward),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  onPressed: () {
                    cBloc.add(Increment());
                  },
                  child: Icon(Icons.arrow_upward),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
