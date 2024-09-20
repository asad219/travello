import 'package:equatable/equatable.dart';

class ShowHideState extends Equatable {
  bool isShow;
  ShowHideState({this.isShow = true});

  ShowHideState copyWith({bool? isShow}) {
    return ShowHideState(isShow: isShow ?? this.isShow);
  }

  @override
  List<Object> get props => [isShow];
}
