import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel_app/core/constant/color_palatte.dart';
import 'package:travel_app/core/constant/dimension_constants.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';

class AppBarContainerWidget extends StatelessWidget {
  const AppBarContainerWidget({
    super.key,
    required this.child,
    this.title,
    this.titleString,
    this.implementLeading = false,
    this.implementTraling = false,
    this.paddingContent = const EdgeInsets.symmetric(
      horizontal: kMediumPadding,
    ),
  });

  final Widget child;
  final Widget? title;
  final String? titleString;
  final bool implementLeading;
  final bool implementTraling;
  final EdgeInsets? paddingContent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: 186,
            child: AppBar(
              centerTitle: true,
              automaticallyImplyLeading: false,
              elevation: 0,
              toolbarHeight: 90,
              backgroundColor: ColorPalette.backgroundScaffoldColor,
              title: title ??
                  Row(
                    children: [
                      if (implementLeading)
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Container(
                            padding: EdgeInsets.all(kItemPadding),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.all(
                                Radius.circular(kDefaultPadding),
                              ),
                              color: Colors.white,
                            ),
                            child: Icon(
                              FontAwesomeIcons.arrowLeft,
                              color: const Color.fromARGB(255, 220, 180, 180),
                              size: kDefaultIconSize,
                            ),
                          ),
                        ),
                      Expanded(
                        child: Column(
                          children: [
                            Text(
                              textAlign: TextAlign.center,
                              titleString ?? '',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (implementTraling)
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(
                              kDefaultPadding,
                            ),
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(kItemPadding),
                          child: Icon(
                            FontAwesomeIcons.bars,
                            size: kDefaultPadding,
                            color: Colors.black,
                          ),
                        ),
                    ],
                  ),
              flexibleSpace: Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      gradient: Gradients.defaultGradientBackground,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.icoOvalTop),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: ImageHelper.loadFromAsset(AssetHelper.icoOvalBottom),
                  ),
                ],
              ),
            ),
          ),

          //Widget under Appbar
          Container(
            margin: EdgeInsets.only(top: 156),
            padding: paddingContent,
            child: child,
          ),
        ],
      ),
    );
  }
}
