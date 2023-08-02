import 'package:flutter/material.dart';
import 'package:travel_app/core/constant/color_palatte.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/constant/textstyle_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/model/room_model.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_room_booking_widget.dart';

class CheckOutScreen extends StatefulWidget {
  const CheckOutScreen({super.key, required this.roomModel});

  static const String routeName = '/check_out_screen';
  final RoomModel roomModel;

  @override
  State<CheckOutScreen> createState() => _CheckOutScreenState();
}

class _CheckOutScreenState extends State<CheckOutScreen> {
  List<String> listStep = [
    'Book and review',
    'Payment',
    'Confirm',
  ];

  Widget _buildItemOptionCheckout(
      String icon, String title, String value, BuildContext context) {
    return Container(
      padding: EdgeInsets.all(kDefaultPadding),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(kDefaultPadding)),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Row(
          children: [
            ImageHelper.loadFromAsset(icon),
            SizedBox(
              width: kItemPadding,
            ),
            Text(
              title,
              style: TextStyles.defaultStyle.bold,
            ),
          ],
        ),
        SizedBox(
          height: kDefaultPadding,
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.5,
          padding: EdgeInsets.all(kMinPadding),
          decoration: BoxDecoration(
            color: ColorPalette.primaryColor.withOpacity(0.15),
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                margin: EdgeInsets.all(2),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(kDefaultPadding),
                ),
                child: Icon(Icons.add),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Text(
                value,
                style: TextStyles.defaultStyle.bold
                    .setColor(ColorPalette.primaryColor),
              ),
            ],
          ),
        ),
      ]),
    );
  }

  Widget _buildItemCheckOutStep(
    int step,
    String nameStep,
    bool isEnd,
    bool isCheck,
  ) {
    return Row(
      children: [
        Container(
          width: kMediumPadding,
          height: kMediumPadding,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kMediumPadding),
            color: isCheck ? Colors.white : Colors.white.withOpacity(0.1),
          ),
          alignment: Alignment.center,
          child: Text(
            step.toString(),
            style: TextStyles.defaultStyle.copyWith(
              color: isCheck ? null : Colors.white,
            ),
          ),
        ),
        SizedBox(
          width: kMinPadding,
        ),
        Text(nameStep,
            style: TextStyles.defaultStyle.fontCaption.whiteTextColor),
        SizedBox(
          width: kMinPadding,
        ),
        if (!isEnd)
          SizedBox(
            width: kDefaultPadding,
            child: Divider(
              height: 1,
              thickness: 1,
              color: Colors.white,
            ),
          ),
        if (!isEnd)
          SizedBox(
            width: kMinPadding,
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      implementLeading: true,
      titleString: 'Checkout',
      child: Column(
        children: [
          Row(
            children: listStep
                .map((e) => _buildItemCheckOutStep(
                    listStep.indexOf(e) + 1,
                    e,
                    listStep.indexOf(e) == listStep.length - 1,
                    listStep.indexOf(e) == 0))
                .toList(),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  ItemRoomBookingWidget(
                    roomModel: widget.roomModel,
                    numberOfRoom: 1,
                  ),
                  _buildItemOptionCheckout(AssetHelper.icoUser,
                      'Contact Details', 'Add Contact', context),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  _buildItemOptionCheckout(AssetHelper.icoPromo, 'Promo Code',
                      'Add Promo Code', context),
                  SizedBox(
                    height: kDefaultPadding,
                  ),
                  ButtonWidget(
                      title: 'Payment',
                      onTap: () {
                        Navigator.of(context).popUntil((route) =>
                            route.settings.name == MainApp.routeName);
                      }),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
