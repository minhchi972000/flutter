import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/constant/textstyle_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/representation/screens/hotel_booking_screen.dart';
import 'package:travel_app/representation/widgets/app_bar_container.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, String>> listImageLeft = [
    {
      'name': 'Korea',
      'image': AssetHelper.korea,
      'reviews': '5.0',
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.dubai,
      'reviews': '4.0',
    },
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
      'reviews': '3.5',
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
      'reviews': '5.0',
    },
  ];
  final List<Map<String, String>> listImageRight = [
    {
      'name': 'Turkey',
      'image': AssetHelper.turkey,
      'reviews': '5.0',
    },
    {
      'name': 'Japan',
      'image': AssetHelper.japan,
      'reviews': '4.0',
    },
    {
      'name': 'Korea',
      'image': AssetHelper.korea,
      'reviews': '3.5',
    },
    {
      'name': 'Dubai',
      'image': AssetHelper.dubai,
      'reviews': '5',
    },
  ];

  Widget _buildItemCategory(
      Widget icon, Color color, Function() ontap, String title) {
    return GestureDetector(
      onTap: ontap,
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(vertical: kMediumPadding),
            decoration: BoxDecoration(
              color: color.withOpacity(0.2),
              borderRadius: BorderRadius.circular(kItemPadding),
            ),
            child: icon,
          ),
          SizedBox(
            height: kItemPadding,
          ),
          Text(title),
        ],
      ),
    );
  }

  Widget _buidlImageHomScreen(String name, String image, String startReview) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .pushNamed(HotelBookingScreen.routeName, arguments: name);
      },
      child: Container(
        margin: EdgeInsets.only(bottom: kDefaultPadding),
        child: Stack(
          children: [
            ImageHelper.loadFromAsset(
              image,
              width: double.infinity,
              fit: BoxFit.fitWidth,
              radius: BorderRadius.circular(kItemPadding),
            ),
            Container(
              alignment: Alignment.topRight,
              child: Padding(
                padding: const EdgeInsets.all(kDefaultPadding),
                child: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Positioned(
              left: kDefaultPadding,
              bottom: kDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyles.defaultStyle.bold.whiteTextColor,
                  ),
                  SizedBox(
                    height: kItemPadding,
                  ),
                  Container(
                    padding: EdgeInsets.all(kMinPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kMinPadding),
                      color: Colors.white.withOpacity(0.4),
                    ),
                    child: Row(
                      children: [
                        ImageHelper.loadFromAsset(AssetHelper.icoStar),
                        SizedBox(
                          width: kItemPadding,
                        ),
                        Text('${startReview}'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppBarContainerWidget(
      title: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: kDefaultPadding,
        ),
        child: Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hi Jame!',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                SizedBox(
                  height: kMediumPadding,
                ),
                Text(
                  'Where are go next? ',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ],
            ),
            Spacer(),
            Icon(
              FontAwesomeIcons.bell,
              size: kDefaultIconSize,
              color: Colors.white,
            ),
            SizedBox(
              width: kTopPadding,
            ),
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(kItemPadding),
                color: Colors.white,
              ),
              padding: EdgeInsets.all(kMinPadding),
              child: ImageHelper.loadFromAsset(AssetHelper.person),
            )
          ],
        ),
      ),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: 'Search your destination',
              prefixIcon: Padding(
                padding: EdgeInsets.all(kTopPadding),
                child: Icon(
                  FontAwesomeIcons.magnifyingGlass,
                  color: Colors.black,
                  size: kDefaultPadding,
                ),
              ),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(
                  Radius.circular(kItemPadding),
                ),
              ),
              contentPadding: EdgeInsets.symmetric(horizontal: kItemPadding),
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          Row(
            children: [
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoHotel,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  Color(0xffFE9C5E),
                  () {
                    Navigator.of(context)
                        .pushNamed(HotelBookingScreen.routeName);
                  },
                  'Hotels',
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoPlane,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  Color(0xffF77777),
                  () {},
                  'Flights',
                ),
              ),
              SizedBox(
                width: kDefaultPadding,
              ),
              Expanded(
                child: _buildItemCategory(
                  ImageHelper.loadFromAsset(
                    AssetHelper.icoHotelPlane,
                    width: kBottomBarIconSize,
                    height: kBottomBarIconSize,
                  ),
                  Color(0xff3EC8BC),
                  () {},
                  'All',
                ),
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Row(
            children: [
              Text(
                'Popular Destinations',
                style: TextStyles.defaultStyle.bold,
              ),
              Spacer(),
              Text(
                'See All',
                style: TextStyles.defaultStyle.bold.primaryTextColor,
              ),
            ],
          ),
          SizedBox(
            height: kMediumPadding,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      children: listImageLeft
                          .map(
                            (e) => _buidlImageHomScreen(
                              e['name']!,
                              e['image']!,
                              e['reviews']!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  SizedBox(
                    width: kDefaultPadding,
                  ),
                  Expanded(
                    child: Column(
                      children: listImageRight
                          .map(
                            (e) => _buidlImageHomScreen(
                              e['name']!,
                              e['image']!,
                              e['reviews']!,
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
