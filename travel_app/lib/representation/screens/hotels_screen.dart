import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/data/model/hotel_model.dart';
import 'package:travel_app/representation/screens/hotel_detail_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_hotel.dart';


class HotelsScreen extends StatefulWidget {
  const HotelsScreen({super.key});

  static const String routeName = '/hotel_screen';

  @override
  State<HotelsScreen> createState() => _HotelsScreenState();
}

class _HotelsScreenState extends State<HotelsScreen> {
  final List<HotelModel> listHotel = [
    HotelModel(
      hotelImage: AssetHelper.hotel1,
      hotelName: 'Royal Palm Heritage',
      location: 'Purwokerto, Jateng',
      awayKilometer: '364 m',
      star: 4.5,
      numberOfReview: 3241,
      price: 143,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel2,
      hotelName: 'Grand Luxury\'s',
      location: 'Banyumas, Jateng',
      awayKilometer: '2.3 km',
      star: 4.2,
      numberOfReview: 3241,
      price: 234,
    ),
    HotelModel(
      hotelImage: AssetHelper.hotel3,
      hotelName: 'The Orlando House',
      location: 'Ajibarang, Jateng',
      awayKilometer: '1.1 km',
      star: 3.8,
      numberOfReview: 1234,
      price: 132,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementTraling: true,
      implementLeading: true,
      titleString: 'Hotels',
      child: SingleChildScrollView(
        child: Column(
          children: listHotel.map((e) => ItemHotel(hotelModel: e, onTap: () {
            Navigator.of(context).pushNamed(HotelDetailScreen.routeName, arguments: e);
          },)).toList(),
        ),
      ),
    );
  }
}
