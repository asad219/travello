part of 'bottom_navigation_bloc.dart';

abstract class BottomNavigationEvent extends Equatable {
  const BottomNavigationEvent();

  @override
  List<Object> get props => [];
}

class ChangePageIndexEvent extends BottomNavigationEvent {
  int currentIndex;
  ChangePageIndexEvent(this.currentIndex);
}
