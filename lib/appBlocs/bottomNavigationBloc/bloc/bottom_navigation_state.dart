part of 'bottom_navigation_bloc.dart';

class BottomNavigationState extends Equatable {
  int currentIndex;

  BottomNavigationState({this.currentIndex = 0});

  BottomNavigationState copyWith({int? currentIndex}) {

    return BottomNavigationState(currentIndex: currentIndex ?? this.currentIndex);
  }

  @override
  List<Object> get props => [currentIndex];
}
