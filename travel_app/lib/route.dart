import 'package:flutter/material.dart';
import 'package:travel_app/data/model/hotel_model.dart';
import 'package:travel_app/data/model/room_model.dart';
import 'package:travel_app/representation/screens/checkout_screen.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/screens/splash_screen.dart';

final Map<String, WidgetBuilder> routes = {
  SplashScreen.routeName: (context) => const SplashScreen(),
  IntroScreen.routeName: (context) => const IntroScreen(),
  MainApp.routeName: (context) => const MainApp(),
  HotelsScreen.routeName: (context) => const HotelsScreen(),
  SelectDateScreen.routeName: (context) => const SelectDateScreen(),
  GuestAndRoomBookingScreen.routeName: (context) =>
      const GuestAndRoomBookingScreen(),
  SelectRoomScreen.routeName: (context) => const SelectRoomScreen(),
};

MaterialPageRoute<dynamic>? generateRoutes(RouteSettings settings) {
  switch (settings.name) {
    // HotelDetailScreen
    case HotelDetailScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final HotelModel hotelModel = (settings.arguments as HotelModel);
          return HotelDetailScreen(hotelModel: hotelModel);
        },
      );

    // CheckOutScreen
    case CheckOutScreen.routeName:
      return MaterialPageRoute(
        builder: (context) {
          final RoomModel roomModel = (settings.arguments as RoomModel);
          return CheckOutScreen(roomModel: roomModel);
        },
      );

    // HotelBookinngScreen
    case HotelBookingScreen.routeName:
      final String? destination = (settings.arguments as String?);
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => HotelBookingScreen(
          destination: destination,
        ),
      );

    default:
      return null;
  }
}
