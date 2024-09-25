import 'package:bloc/bloc.dart';
import 'package:travello/appBlocs/showHideBlocInvd/show_hide_event.dart';
import 'package:travello/appBlocs/showHideBlocInvd/show_hide_state.dart';


class ShowHideBloc extends Bloc<ShowHideEventI, ShowHideStateI> {
  ShowHideBloc() : super(ShowHideStateI()) {
    on<ShowHidePasswordEvent>(_showHidePassword);
  }
  void _showHidePassword(
      ShowHidePasswordEvent event, Emitter<ShowHideStateI> emit) {
    emit(state.copyWith(isShow: event.isShow));
  }
}
