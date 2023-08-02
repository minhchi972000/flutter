import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/constant/textstyle_constants.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/model/room_model.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/dash_line_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_hotel_widget.dart';

class ItemRoomBookingWidget extends StatelessWidget {
  const ItemRoomBookingWidget({
    super.key,
    required this.roomModel,
    this.onTap,
    this.numberOfRoom,
  });

  final RoomModel roomModel;
  final Function()? onTap;
  final int? numberOfRoom;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom:kItemPadding*2 ),
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(kItemPadding),
        ),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    roomModel.roomName,
                    style: TextStyles.defaultStyle.text1Color.bold,
                  ),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text(
                    'Room sized: ${roomModel.size} m2',
                  ),
                  SizedBox(
                    height: kMinPadding,
                  ),
                  Text(roomModel.utility),
                ],
              ),
              Spacer(),
              ImageHelper.loadFromAsset(
                roomModel.roomImage,
                radius: BorderRadius.all(
                  Radius.circular(kMinPadding),
                ),
              ),
            ],
          ),
          ItemUtilityHotelWidget(),
          DashLineWidget(),
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '\$${roomModel.price}',
                      style: TextStyles.defaultStyle.fontHeader.bold,
                    ),
                    SizedBox(
                      height: kMinPadding,
                    ),
                    Text(
                      '/night',
                    ),
                  ],
                ),
              ),
              Expanded(
                child: numberOfRoom == null
                    ? ButtonWidget(title: 'Choose', onTap: onTap)
                    : Text(
                        '$numberOfRoom room',
                        textAlign: TextAlign.end,
                      ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
