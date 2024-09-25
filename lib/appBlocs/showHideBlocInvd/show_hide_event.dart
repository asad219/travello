import 'package:equatable/equatable.dart';

abstract class ShowHideEventI extends Equatable {
  const ShowHideEventI();

  @override
  List<Object> get props => [];
}

class ShowHidePasswordEvent extends ShowHideEventI {
  final bool isShow;
  const ShowHidePasswordEvent(this.isShow);
}
