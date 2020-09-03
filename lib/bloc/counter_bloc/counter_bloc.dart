import 'dart:async';

import 'package:vanilla_bloc/bloc/basic_bloc.dart';
import 'package:vanilla_bloc/bloc/counter_bloc/counter_event.dart';

class CounterBloc implements BasicBloc {
  // Simpan value counternya
  int counter = 0;

  // Buat Stream Controller untuk value nya
  final _streamController = StreamController<int>.broadcast();
  // Ada 2 jenis pipe dalam stream, stream dan sink.
  // kalau diibaratkan tu sink itu lubang pipa untuk memasukkan
  // sedangkan stream itu lubang pipa untuk mengeluarkan apa yang dimasukkan
  // dari sink tadi
  StreamSink<int> get _inStream => _streamController.sink;
  Stream<int> get stream => _streamController.stream;

  // Buat Stream Controller untuk event nya
  final _eventController = StreamController<CounterEvent>.broadcast();
  // Jadi nanti eventListen ini untuk memasukkan event berupa CounterEvent
  StreamSink<CounterEvent> get eventListen => _eventController.sink;

  // Buat callback untuk mengolah event menjadi state
  _mapEventToState(CounterEvent event) {
    if(event is IncrementEvent) {
      _incrementEvent(event.count);
    } else if(event is DecrementEvent) {
      _decrementEvent(event.count);
    }
  }

  _incrementEvent(int count) {
    counter += count;
    _inStream.add(counter);
  }

  _decrementEvent(int count) {
    counter -= count;
    _inStream.add(counter);
  }

  @override
  void dispose() {
    _streamController?.close();
    _eventController?.close();
  }

  CounterBloc() {
    _eventController.stream.listen(_mapEventToState);
    _inStream.add(counter);
  }
}