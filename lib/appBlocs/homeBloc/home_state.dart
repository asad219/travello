import 'package:equatable/equatable.dart';

import '../../models/Place.dart';

abstract class HomeState  {

}

class HomeInitial extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeFailure extends HomeState {
  final String error;
  HomeFailure(this.error);

  @override
  List<Object?> get props => [error];
}

// we can write different  success states
class HomeGetPlacesSuccess extends HomeState {
  List<Place> placesList = [];
  HomeGetPlacesSuccess(this.placesList);

  @override
  List<Object?> get props => [placesList];
}




