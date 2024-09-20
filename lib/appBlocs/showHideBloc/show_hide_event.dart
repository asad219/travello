import 'package:equatable/equatable.dart';

abstract class ShowHideEvent extends Equatable {
  const ShowHideEvent();

  @override
  List<Object> get props => [];
}

class ShowHidePasswordEvent extends ShowHideEvent {
  final bool isShow;
  const ShowHidePasswordEvent(this.isShow);
}
