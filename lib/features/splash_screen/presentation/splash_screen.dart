import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/core/navigation/app_route.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future<void>.delayed(const Duration(seconds: 2), () async {
      await context.router.replace(const DashboardScreenRoute());
    });
    return Scaffold(
      body: DecoratedBox(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            transform: GradientRotation(171.57 * 3.1415926535 / 180),
            colors: <Color>[ColorConstants.lightRed, ColorConstants.red],
            stops: <double>[0.0066, 0.647],
          ),
        ),
        child: Stack(
          children: <Widget>[
            const Center(
              heightFactor: 10,
              child: Text(
                TextConstants.gizmoGrub,
                style: TextStyleConstants.splashScreenHeading,
              ),
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Image.asset(TextConstants.burgerImage1),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Image.asset(TextConstants.burgerImage2),
            ),
          ],
        ),
      ),
    );
  }
}
