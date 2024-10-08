import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'bottom_navigation_event.dart';
part 'bottom_navigation_state.dart';

class BottomNavigationBloc extends Bloc<BottomNavigationEvent, BottomNavigationState> {
  BottomNavigationBloc() : super(BottomNavigationState()) {
    on<ChangePageIndexEvent>(_changeIndex);
  }
  void _changeIndex(
      ChangePageIndexEvent event, Emitter<BottomNavigationState> emit) {
    emit(state.copyWith(currentIndex: event.currentIndex));
  }
}
