import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';

enum ColorEvent { toAmber, toLightBlue }

class ColorBloc extends Bloc<ColorEvent, Color> {
  Color _color = Colors.amber;
  @override
  // TODO: implement initialState
  Color get initialState => Colors.amber;

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    // TODO: implement mapEventToState
    _color = (event == ColorEvent.toAmber) ? Colors.amber : Colors.lightBlue;

    yield _color;
  }
}
