import 'dart:async';

import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/representation/screens/main_app.dart';
import 'package:travel_app/representation/widgets/button_widget.dart';
import 'package:travel_app/representation/widgets/item_intro_widget.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  static const routeName = '/intro_screen';

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  final PageController _pageController = PageController();

  // Use stream to listener event
  final StreamController<int> _pageStreamController =
      StreamController.broadcast();

  @override
  void initState() {
    super.initState();
    _pageController.addListener(() {
      print(_pageController.page);
      _pageStreamController.add(_pageController.page!.toInt());
    });
  }

  final List<Widget> listPage = const [
    ItemIntroWidget(
      title: 'Book a flight',
      description:
          'Found a flight that matches your destination and schedule? Book it instantly.',
      sourceImage: AssetHelper.slide1,
      aligment: Alignment.centerRight,
    ),
    ItemIntroWidget(
      title: 'Find a hotel room',
      description:
          'Select the day, book your room. We give you the best price.',
      sourceImage: AssetHelper.slide2,
      aligment: Alignment.center,
    ),
    ItemIntroWidget(
      title: 'Enjoy your trip',
      description:
          'Easy discovering new places and share these between your friends and travel together.',
      sourceImage: AssetHelper.slide3,
      aligment: Alignment.centerLeft,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            children: listPage,
          ),
          Positioned(
            left: kMediumPadding,
            right: kMediumPadding,
            bottom: kMediumPadding * 2,
            child: Row(
              children: [
                Expanded(
                  flex: 6,
                  child: SmoothPageIndicator(
                    controller: _pageController,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                      dotWidth: kMinPadding,
                      dotHeight: kMinPadding,
                      activeDotColor: Colors.orange,
                    ),
                  ),
                ),

                // Just build in StreamBuilder
                StreamBuilder<int>(
                  initialData: 0,
                  stream: _pageStreamController.stream,
                  builder: (context, snapshot) {
                    return Expanded(
                      flex: 4,
                      child: ButtonWidget(
                        title: snapshot.data != 2 ? 'Next' : 'Get started',
                        onTap: () {
                          if (_pageController.page != 2) {
                            _pageController.nextPage(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeIn);
                          } else {
                            Navigator.of(context).pushNamed(MainApp.routeName);
                          }
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
