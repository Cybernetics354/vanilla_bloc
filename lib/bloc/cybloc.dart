import 'dart:async';

import 'dart:math';

abstract class Cybloc<T, R> {
  final _streamController = new StreamController<T>.broadcast();
  Stream<T> get stream => _streamController.stream;
  StreamSink<T> get inStream => _streamController.sink;

  final _eventController = new StreamController<R>.broadcast();
  StreamSink<R> get eventController => _eventController.sink;
  
  void dispose() {
    _streamController?.close();
    _eventController?.close();
  }
}