// ignore_for_file: non_constant_identifier_names

import 'package:basket_ball/cubits/counter/counter_state.dart';
import 'package:bloc/bloc.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(counterAIncrementState());

  int teamAPoints = 0;
  int teamBPoints = 0;
  bool isPressed = false;

  void TeamIncrement({required String team, required int points}) {
    if (team == 'A') {
      teamAPoints += points;
      isPressed = true;
      emit(counterAIncrementState());
    } else if (team == 'B') {
      teamBPoints += points;
      isPressed = true;

      emit(counterBIncrementState());
    }
  }

  void TeamReset() {
    teamAPoints = 0;
    teamBPoints = 0;
    emit(counterResetState());
  }
}
