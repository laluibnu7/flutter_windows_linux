import 'dart:async';

import 'package:flutter/material.dart';

enum ColorEvent { to_amber, to_light_blue }

class ColorBloc {
  Color _color = Colors.amber;

// event

  StreamController<ColorEvent> _eventController =
      StreamController<ColorEvent>();
  StreamSink<ColorEvent> get eventSink => _eventController.sink;

// state
  StreamController<Color> _stateController = StreamController<Color>();
  StreamSink<Color> get _stateSink => _stateController.sink;
  Stream<Color> get stateStream => _stateController.stream;

  void _mapEventToState(ColorEvent colorEvent) {
    if (colorEvent == ColorEvent.to_amber)
      _color = Colors.amber;
    else
      _color = Colors.lightBlue;

    // menyambungkan
    _stateSink.add(_color);
  }

  ColorBloc() {
    _eventController.stream.listen(_mapEventToState);
  }

// membereskan selang-selang sblumnya
// ketika membuat string controller itu akan memakan memori, jika tidak kita memakai lagi, misal si bloc udah beres atau page udah di tutup, colorBloc harus di dispose, jika tidak string controller ini akan terus memakan memori akhirnya memori akan semakin membesar pada aplikasi android
  void dispose() {
    _eventController.close();
    _stateController.close();
  }
}
