import 'package:belajar_multibloc/bloc/color_bloc.dart';
import 'package:belajar_multibloc/bloc/counter_bloc.dart';
import 'package:belajar_multibloc/ui/draft_page.dart';
import 'package:belajar_multibloc/ui/second_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CounterBloc counterBloc = BlocProvider.of<CounterBloc>(context);
    return BlocBuilder<ColorBloc, Color>(
      builder: (context, color) => DraftPage(
        backgroundColor: color,
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              BlocBuilder<CounterBloc, int>(
                builder: (context, number) => GestureDetector(
                  onTap: () => counterBloc.dispatch(number + 1),
                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              RaisedButton(
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecondPage(),
                    ),
                  ),
                },
                child: Text(
                  "Click to Change",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                color: color,
                shape: StadiumBorder(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
