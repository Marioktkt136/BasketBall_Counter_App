part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class ButtonIdUpdated extends HomeState {}

final class ButtonIdReset extends HomeState {}
