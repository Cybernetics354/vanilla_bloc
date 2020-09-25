import 'dart:async';

abstract class Cybloc<T, R> {
  final _streamController = new StreamController<T>.broadcast();
  
}