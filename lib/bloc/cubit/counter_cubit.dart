import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial());

  void incrementCounter(int value) async {
    if(state is CounterInitial) {
      emit(CounterFilled(
        count: 0
      ));
    } else if(state is CounterFilled) {
      emit(CounterFilled(
        count: (state as CounterFilled).count + value
      ));
      await Future.delayed(Duration(milliseconds: 400));
      emit(CounterFilled(
        count: (state as CounterFilled).count + value
      ));
    }
  }
}
