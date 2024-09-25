import 'package:equatable/equatable.dart';

class ShowHideStateI extends Equatable {
  bool isShow;

  ShowHideStateI({this.isShow = true});

  ShowHideStateI copyWith({bool? isShow}) {
    return ShowHideStateI(isShow: isShow ?? this.isShow);
  }

  @override
  List<Object> get props => [isShow];


}
