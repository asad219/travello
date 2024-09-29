import 'package:flutter/material.dart';

class ApiClient {

//  static  String live_domain = "http://192.168.0.109/travel_api/";
    static  String live_domain =  "https://api.spectrumxllc.com/";


    static  String signup =  "$live_domain"+"signup.php";
    static String login =  "$live_domain"+"login.php";
    static String getPlaces =  "$live_domain"+"getPlaces.php";
    static String getHotels =  "$live_domain"+"getHotels.php";
    static String getSingleHotel =  "$live_domain"+"getSingleHotel.php";
    static String addBooking = "$live_domain"+ "addBooking.php";
    static String getBookings =  "$live_domain"+"getBookings.php";
    static String getMyBookings = "$live_domain"+ "getMyBookings.php";

    static String addRating =  "$live_domain"+"addRating.php";
    static String addComment = "$live_domain"+ "addComment.php";
    static String getComments =  "$live_domain"+"getComments.php";
    static String updateBookingStatus =  "$live_domain"+"updateBookingStatus.php";
}