import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { toAmber, toLightLblue }

class ColorBloc {
  Color _color = Colors.amber;

  final StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

  final StreamController<Color> _stateControlller = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateControlller.sink;
  Stream<Color> get stateStream => _stateControlller.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.toAmber) {
      _color = Colors.amber;
    } else {
      _color = Colors.lightBlue;

      _stateSink.add(_color);
    }
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _eventController.close();
    _stateControlller.close();
  }
}
