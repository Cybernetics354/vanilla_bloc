import 'dart:async';

import 'dart:math';

abstract class Cybloc<T, R> {
  final _streamController = new StreamController<T>.broadcast();
  Stream<T> get stream => _streamController.stream;
  StreamSink<T> get inStream => _streamController.sink;

  final _eventController = new StreamController<R>.broadcast();
  StreamSink<R> get eventListen => _eventController.sink;

  mapEventToState(R event);

  emit(T data) {
    inStream.add(data);
  }

  addEvent(R event) {
    eventListen.add(event);
  }
  
  void dispose() {
    _streamController?.close();
    _eventController?.close();
  }
}