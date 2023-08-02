import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/color_palatte.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_add_guest_and_room.dart';

class GuestAndRoomBookingScreen extends StatefulWidget {
  const GuestAndRoomBookingScreen({super.key});

  static const String routeName = '/guest_and_room_booking_screen';

  @override
  State<GuestAndRoomBookingScreen> createState() =>
      _GuestAndRoomBookingScreenState();
}

class _GuestAndRoomBookingScreenState extends State<GuestAndRoomBookingScreen> {
  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      titleString: 'Add \nguest and room',
      implementLeading: true,
      child: Column(
        children: [
          SizedBox(
            height: kMediumPadding * 1.5,
          ),
          ItemAddGuestAndRoom(
              title: 'Guest', icon: AssetHelper.icoGuest, initData: 2),
          ItemAddGuestAndRoom(
              title: 'Room', icon: AssetHelper.icoRoom, initData: 2),
          // Button Select
          ButtonWidget(
              title: 'Select',
              onTap: () {
                Navigator.of(context).pop();
              }),

          // height
          SizedBox(
            height: kDefaultPadding,
          ),

          // Button Cancel
          ButtonWidget(
              title: 'Cancel',
              color: ColorPalette.primaryColor.withOpacity(0.1),
              onTap: () {
                Navigator.of(context).pop();
              }),
        ],
      ),
    );
  }
}
