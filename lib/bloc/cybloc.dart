import 'dart:async';

import 'dart:math';

abstract class Cybloc<T, R> {
  final _streamController = new StreamController<T>.broadcast();
  Stream<T> get stream => _streamController.stream;
  StreamSink<T> get inStream => _streamController.sink;
  
  void dispose() {
    _streamController?.close();
  }
}