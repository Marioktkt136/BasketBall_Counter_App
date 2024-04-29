import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
  static HomeCubit instance(BuildContext context) =>
      BlocProvider.of(context, listen: false);

  int buttonPressedId = 0;

  void setButtonPressed({required int id}) {
    buttonPressedId = id;
    emit(ButtonIdUpdated());
  }

  void reSetButtonPressed() {
    buttonPressedId = 0;
    emit(ButtonIdReset());
  }
}
