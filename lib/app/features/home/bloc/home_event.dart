part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

sealed class HomeActionEvent extends HomeEvent {}

class HomeInitialEvent extends HomeEvent {}

class HomeRadioClickEvent extends HomeActionEvent {
  final String filterType;
  final BuildContext context;
  HomeRadioClickEvent(this.context, {required this.filterType});
}
