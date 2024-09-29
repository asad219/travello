import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:http/http.dart';
import 'package:travello/appBlocs/homeBloc/home_event.dart';
import 'package:travello/appBlocs/homeBloc/home_state.dart';
import 'package:travello/appBlocs/showHideBlocInvd/show_hide_event.dart';
import 'package:travello/appBlocs/showHideBlocInvd/show_hide_state.dart';
import 'package:travello/models/Place.dart';

import '../../helper/Utils.dart';
import '../../helper/api_client.dart';
import '../../models/res.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {

    on<GetPlacesEvent>((event,emit) async {
         emit(HomeLoading());
         String url = ApiClient.getPlaces;

         print(url);

         print(event.type.toString());
         var response =  await post(Uri.parse(url), body: {"type": event.type.toString()});

         print("resp: "+response.body);
         // if(response.body.contains("status") && response.body.contains("failed")){
         //   Res res = Res.fromJson(jsonDecode(response.body));
         //   emit(HomeFailure(res.message.toString()));
         //
         // }else{
         //
         //   List<dynamic> list = json.decode(response.body);
         //
         //   List<Place> placesList = [];
         //   for(int i=0;i<list.length;i++){
         //     placesList.add(Place.fromJson(list[i]));
         //   }
         //   emit(HomeGetPlacesSuccess(placesList));
         //
         //
         //
         // }

    });


  }



}
