import 'dart:async';
import 'package:flutter/material.dart';

enum ColorEvent { colorRed, colorGreen }

class ColorBloc {
  Color _color = Colors.red;

  final _inputEventController = StreamController<ColorEvent>();
  StreamSink<ColorEvent> get inputEventSink => _inputEventController.sink;

  final _outputStateController = StreamController<Color>();
  Stream<Color> get outputStateStream => _outputStateController.stream;

  void _mapEventToState(ColorEvent event) {
    if (event == ColorEvent.colorGreen) {
      _color = Colors.green;
    } else if (event == ColorEvent.colorRed) {
      _color = Colors.red;
    } else {
      throw Exception('Wrong type of event');
    }
    _outputStateController.sink.add(_color);
  }

  ColorBloc() {
    _inputEventController.stream.listen(_mapEventToState);
  }

  void dispose() {
    _inputEventController.close();
    _outputStateController.close();
  }
}
