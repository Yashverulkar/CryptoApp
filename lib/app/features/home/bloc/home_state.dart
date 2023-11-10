part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

sealed class HomeActionState extends HomeState {}

final class HomeInitial extends HomeState {}

final class HomeLoadingState extends HomeState {}

final class HomeLoadingSuccessState extends HomeState {
  final List<CryptocurrencyList> cryptocurrencyList;
  HomeLoadingSuccessState({required this.cryptocurrencyList});
}

final class HomeErrorState extends HomeState {}

final class HomeActionRadioSelect extends HomeActionEvent {}
