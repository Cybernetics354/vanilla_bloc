part of 'counter_cubit.dart';

@immutable
abstract class CounterState {}

class CounterInitial extends CounterState {}

class CounterFilled extends CounterState {
  final int count;
  CounterFilled({
    this.count
  });
}
