import 'package:bloc/bloc.dart';
import 'package:bloc_try/bloc/counter_bloc/counter_event.dart';
import 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterState()) {
    on<IncrementEvent>(_increment);
    on<DecrementEvent>(_decrement);
  }
  
  
  void _increment(IncrementEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter + 1));
  }
  
  void _decrement(DecrementEvent event, Emitter<CounterState> emit){
    emit(state.copyWith(counter: state.counter - 1));
  }
  
}
