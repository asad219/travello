

abstract class HomeEvent {
}

class GetPlacesEvent extends HomeEvent {

   String type = "";
   GetPlacesEvent(this.type);

   @override
   List<Object?> get props => [];
}
