import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constant/color_palatte.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/constant/textstyle_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/data/model/hotel_model.dart';
import 'package:travel_app/representation/screens/select_room_screen.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/dash_line_widget.dart';
import 'package:travel_app/representation/widgets/item_utility_hotel_widget.dart';

class HotelDetailScreen extends StatefulWidget {
  const HotelDetailScreen({super.key, required this.hotelModel});
  static const String routeName = '/hotel_detail';

  final HotelModel hotelModel;

  @override
  State<HotelDetailScreen> createState() => _HotelDetailScreenState();
}

class _HotelDetailScreenState extends State<HotelDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // use to positioned fill to fix over full screen
          Positioned.fill(
            child: ImageHelper.loadFromAsset(
              AssetHelper.hotelScreen,
              fit: BoxFit.fill,
            ),
          ),
          Positioned(
            top: kMediumPadding * 3,
            left: kMediumPadding,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).pop();
              },
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.arrowLeft,
                  size: 18,
                ),
              ),
            ),
          ),

          Positioned(
            top: kMediumPadding * 3,
            right: kMediumPadding,
            child: GestureDetector(
              onTap: () {},
              child: Container(
                padding: EdgeInsets.all(kItemPadding),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(kDefaultPadding),
                  ),
                ),
                child: Icon(
                  FontAwesomeIcons.solidHeart,
                  color: Colors.red,
                  size: 18,
                ),
              ),
            ),
          ),

          DraggableScrollableSheet(
              initialChildSize: 0.3,
              maxChildSize: 0.8,
              minChildSize: 0.3,
              builder: (context, ScrollController) {
                return Container(
                  padding: EdgeInsets.symmetric(horizontal: kMediumPadding),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(kDefaultPadding * 2),
                      topRight: Radius.circular(kDefaultPadding * 2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: kDefaultPadding),
                        child: Container(
                          height: 5,
                          width: 80,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(kItemPadding),
                            ),
                            color: Colors.black,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding,
                      ),
                      Expanded(
                        child: ListView(
                          controller: ScrollController,
                          children: [
                            Row(
                              children: [
                                Text(
                                  widget.hotelModel.hotelName,
                                  style: TextStyles.defaultStyle.bold,
                                ),
                                Spacer(),
                                Text(
                                  '\$${widget.hotelModel.price}',
                                  style: TextStyles.defaultStyle.bold,
                                ),
                                Text(' /night'),
                              ],
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(
                                    AssetHelper.icoLocationBlank),
                                SizedBox(
                                  width: kMinPadding,
                                ),
                                Text(
                                  widget.hotelModel.location,
                                ),
                              ],
                            ),
                            DashLineWidget(),
                            Row(
                              children: [
                                ImageHelper.loadFromAsset(AssetHelper.icoStar),
                                SizedBox(
                                  width: kMinPadding,
                                ),
                                Text(
                                  '${widget.hotelModel.star}/5',
                                ),
                                Text(
                                  ' (${widget.hotelModel.numberOfReview} reviews)',
                                  style: TextStyle(
                                    color: ColorPalette.subTitleColor,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  'See all',
                                  style: TextStyles
                                      .defaultStyle.bold.primaryTextColor,
                                ),
                              ],
                            ),
                            DashLineWidget(),
                            Text(
                              'Information',
                              style: TextStyles.defaultStyle.bold,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              '''You will find every comfort because many of the 
services that the hotel offers for travellers and of 
course the hotel is very comfortable.''',
                              style: TextStyles.defaultStyle.text1Color,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            ItemUtilityHotelWidget(),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              'Location',
                              style: TextStyles.defaultStyle.bold,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            Text(
                              '''Located in the famous neighborhood of Seoul, 
Grand Luxury’s is set in a building built in the 
2010s.''',
                              style: TextStyles.defaultStyle.text1Color,
                            ),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            ImageHelper.loadFromAsset(AssetHelper.imageMap),
                            SizedBox(
                              height: kDefaultPadding,
                            ),
                            ButtonWidget(
                                title: 'Select Room',
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(SelectRoomScreen.routeName);
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              }),
        ],
      ),
    );
  }
}
