import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:gizmogrub_lints_localization/core/constants/color_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_constants.dart';
import 'package:gizmogrub_lints_localization/core/constants/text_style_constants.dart';
import 'package:gizmogrub_lints_localization/features/profile/presentation/widgets/profile_action_button.dart';
import 'package:gizmogrub_lints_localization/features/profile/presentation/widgets/text_form_field_widget.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            gradient: RadialGradient(
              center: Alignment(0, -0.15),
              radius: 0.85,
              colors: <Color>[ColorConstants.megentaPink, ColorConstants.red],
            ),
          ),
        ),

        // Overlay Image 1
        Positioned(
          top: 38,
          left: -50,
          child: Image.asset(
            TextConstants.overlayBurgerImage2,
            height: 196,
            width: 196,
            color: ColorConstants.white.withOpacity(0.16),
            colorBlendMode: BlendMode.modulate,
          ),
        ),

        // Overlay Image 2
        Positioned(
          top: 38,
          right: -50,
          child: Image.asset(
            TextConstants.overlayBurgerImage1,
            height: 196,
            width: 196,
            color: ColorConstants.white.withOpacity(0.16),
            colorBlendMode: BlendMode.modulate,
          ),
        ),

        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 38, horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                GestureDetector(
                  onTap: () => context.router.pop(),
                  child: Image.asset(
                    TextConstants.backArrowIconImage,
                    color: ColorConstants.white,
                    width: 28,
                    height: 28,
                  ),
                ),
                const Icon(
                  Icons.settings,
                  color: ColorConstants.white,
                  size: 24,
                ),
              ],
            ),
          ),
        ),

        Positioned.fill(
          top: 200,
          child: Container(
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 18),
            decoration: const BoxDecoration(
              color: ColorConstants.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(36)),
            ),
            child: ListView(
              children: <Widget>[
                TextFormFieldWidget(label: AppLocalizations.of(context)!.name),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  label: AppLocalizations.of(context)!.email,
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  label: AppLocalizations.of(context)!.deliveryAddress,
                  maxLines: 2,
                ),
                const SizedBox(height: 25),
                TextFormFieldWidget(
                  label:
                      '${AppLocalizations.of(context)!.password} ${TextConstants.passwordLockIcon}',
                  obscureText: true,
                ),
                const SizedBox(height: 50),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48),
                  child: Column(
                    children: <Widget>[
                      Container(height: 1, color: ColorConstants.lightGrey3),
                      const SizedBox(height: 33),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.paymentDetails,
                            style: TextStyleConstants.heading2.copyWith(
                              color: ColorConstants.mediumGrey,
                              fontFamily: TextConstants.robotoFontFamily,
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            size: 20,
                            color: ColorConstants.mediumGrey,
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            AppLocalizations.of(context)!.orderHistory,
                            style: TextStyleConstants.heading2.copyWith(
                              color: ColorConstants.mediumGrey,
                              fontFamily: TextConstants.robotoFontFamily,
                            ),
                          ),
                          const Icon(
                            CupertinoIcons.right_chevron,
                            size: 20,
                            color: ColorConstants.mediumGrey,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 63),
                Row(
                  // Action buttons
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Flexible(
                      child: ProfileActionButton(
                        label: AppLocalizations.of(context)!.editProfile,
                        icon: Image.asset(TextConstants.editIconPng),
                        isFilled: true,
                        backgroundColor: ColorConstants.darkChestnut,
                      ),
                    ),
                    Flexible(
                      child: ProfileActionButton(
                        label: AppLocalizations.of(context)!.logout,
                        icon: Image.asset(TextConstants.signOut),
                        isFilled: false,
                        borderColor: ColorConstants.red,
                        borderWidth: 3,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),

        Align(
          alignment: Alignment.topCenter,
          child: Padding(
            padding: const EdgeInsets.only(top: 130),
            child: Container(
              width: 139,
              height: 139,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: ColorConstants.red, width: 4),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(TextConstants.profileIcon),
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
