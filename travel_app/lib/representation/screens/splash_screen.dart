import 'package:flutter/material.dart';
import 'package:travel_app/core/helpers/asset_helper.dart';
import 'package:travel_app/core/helpers/image_helper.dart';
import 'package:travel_app/core/helpers/local_storage_helper.dart';
import 'package:travel_app/representation/screens/intro_screen.dart';
import 'package:travel_app/representation/screens/main_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  static String routeName = '/splash_screen';

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    redirecIntroScreen();
  }

  void redirecIntroScreen() async {
    final ignoreIntro = LocalStorageHelper.getValue('ignoreIntro') as bool?;
    print('before $ignoreIntro');
    await Future.delayed(const Duration(milliseconds: 1000));
    print('after $ignoreIntro');

    if (ignoreIntro !=null && ignoreIntro) {
      Navigator.of(context).pushNamed(MainApp.routeName);
    } else {
      LocalStorageHelper.setValue('ignoreIntro', true);
      Navigator.of(context).pushNamed(IntroScreen.routeName);
      print('done $ignoreIntro');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        //  Positioned.fill full screenSplash
        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.backgroundSplash,
              fit: BoxFit.fitWidth),
        ),

        Positioned.fill(
          child: ImageHelper.loadFromAsset(AssetHelper.circleSplash,
              fit: BoxFit.fitWidth),
        ),
      ],
    );
  }
}
