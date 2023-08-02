import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/data/model/room_model.dart';
import 'package:travel_app/representation/screens/checkout_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/item_room_booking_widget.dart';

class SelectRoomScreen extends StatefulWidget {
  const SelectRoomScreen({super.key});

  static const String routeName = '/select_room_screen';

  @override
  State<SelectRoomScreen> createState() => _SelectRoomScreenState();
}

class _SelectRoomScreenState extends State<SelectRoomScreen> {
  final List<RoomModel> listRoom = [
    RoomModel(
      roomImage: AssetHelper.room1,
      roomName: 'Deluxe Room',
      size: 27,
      utility: 'Free Cancellation',
      price: 245,
    ),
    RoomModel(
      roomImage: AssetHelper.room2,
      roomName: 'Executive Suite',
      size: 32,
      utility: 'Non-refundable',
      price: 289,
    ),
    RoomModel(
      roomImage: AssetHelper.room3,
      roomName: 'King Bed Only Room',
      size: 24,
      utility: 'Non-refundable',
      price: 214,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Select room',
      child: SingleChildScrollView(
        child: Column(
          children: listRoom
              .map(
                (e) => ItemRoomBookingWidget(
                  roomModel: e,
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(CheckOutScreen.routeName, arguments: e);
                  },
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
