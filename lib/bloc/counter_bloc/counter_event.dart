abstract class CounterEvent {}

// Ini pas ngeklik tambah trus ngirim event ini ke bloc
// misal kita ngeklik tombol tambah, nah kita ngirim IncrementEvent ke bloc
// dan sebaliknya
class IncrementEvent extends CounterEvent {
  final int count;
  IncrementEvent({
    this.count = 1
  });
}

class DecrementEvent extends CounterEvent {
  final int count;
  DecrementEvent({
    this.count = 1
  });
}

