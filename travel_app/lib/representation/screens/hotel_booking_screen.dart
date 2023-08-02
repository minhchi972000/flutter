import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/guest_and_room_booking_screen.dart';
import 'package:travel_app/representation/screens/hotels_screen.dart';
import 'package:travel_app/representation/screens/select_date_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_booking_widget.dart';
import 'package:travel_app/core/extensions/date_ext.dart';

class HotelBookingScreen extends StatefulWidget {
  const HotelBookingScreen({super.key, this.destination});

  static const String routeName = '/hotel_booking_screen';

  final String? destination;

  @override
  State<HotelBookingScreen> createState() => _HotelBookingScreenState();
}

class _HotelBookingScreenState extends State<HotelBookingScreen> {
  String? selectDate;

  final List<Map<String, String>> listImageLeft = [
    {
      'icon': AssetHelper.icoLocation,
      'title': 'Korea',
      'description': 'South Korea'
    },
    {
      'title': 'Select Date',
      'icon': AssetHelper.dubai,
      'description': '13 Feb - 18 Feb 2021'
    },
    {
      'title': 'Turkey',
      'icon': AssetHelper.turkey,
      'description': 'South Korea'
    },
    {
      'title': 'Guest and Room',
      'icon': AssetHelper.japan,
      'description': '2 Guest, 1 Room'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Hotel Booking',
      child: Column(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: kMediumPadding * 2,
                ),
                ItemOptionsBookingWidget(
                  title: 'Destination',
                  value: widget.destination ?? 'Viet Nam',
                  icon: AssetHelper.icoLocation,
                  onTap: () {},
                ),
                ItemOptionsBookingWidget(
                  title: 'Select Date',
                  value: selectDate ?? 'Select date',
                  icon: AssetHelper.icoCalendal,
                  onTap: () async {
                    final result = await Navigator.of(context)
                        .pushNamed(SelectDateScreen.routeName);
                    if (result is List<DateTime?>) {
                      setState(() {
                        selectDate =
                            '${result[0]?.getStartDate} - ${result[1]?.getEndDate}';
                      });
                    }
                  },
                ),
                ItemOptionsBookingWidget(
                  title: 'Guest and Room',
                  value: '2 Guest, 1 Room',
                  icon: AssetHelper.icoBed,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(GuestAndRoomBookingScreen.routeName);
                  },
                ),
                SizedBox(
                  height: kBottomBarIconSize,
                ),
                ButtonWidget(title: 'Search', onTap: () {
                  Navigator.of(context).pushNamed(HotelsScreen.routeName);
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
