import 'package:bloc/bloc.dart';
import 'package:travello/appBlocs/showHideBloc/show_hide_event.dart';
import 'package:travello/appBlocs/showHideBloc/show_hide_state.dart';

class ShowHideBloc extends Bloc<ShowHideEvent, ShowHideState> {
  ShowHideBloc() : super(ShowHideState()) {
    on<ShowHidePasswordEvent>(_showHidePassword);
  }
  void _showHidePassword(
      ShowHidePasswordEvent event, Emitter<ShowHideState> emit) {
    emit(state.copyWith(isShow: event.isShow));
  }
}
