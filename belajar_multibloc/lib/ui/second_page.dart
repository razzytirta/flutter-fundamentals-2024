import 'package:belajar_multibloc/bloc/color_bloc.dart';
import 'package:belajar_multibloc/bloc/counter_bloc.dart';
import 'package:belajar_multibloc/ui/draft_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ColorBloc colorBloc = BlocProvider.of<ColorBloc>(context);
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
                  onTap: () {
                    counterBloc.dispatch(number + 1);
                  },
                  child: Text(
                    number.toString(),
                    style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  RaisedButton(
                    onPressed: () => {colorBloc.dispatch(ColorEvent.toPink)},
                    color: Colors.pink,
                    shape: (color == Colors.pink)
                        ? CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          )
                        : CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () => {colorBloc.dispatch(ColorEvent.toAmber)},
                    color: Colors.amber,
                    shape: (color == Colors.amber)
                        ? CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          )
                        : CircleBorder(),
                  ),
                  RaisedButton(
                    onPressed: () => {colorBloc.dispatch(ColorEvent.toPurple)},
                    color: Colors.purple,
                    shape: (color == Colors.purple)
                        ? CircleBorder(
                            side: BorderSide(
                              color: Colors.black,
                              width: 3,
                            ),
                          )
                        : CircleBorder(),
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
