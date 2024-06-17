import 'package:flutter/material.dart';
import 'package:lets_shop/core/config/app_routes.dart';
import 'package:lets_shop/core/config/pathprovider.dart';
import 'package:lets_shop/core/theme/app_assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lets_shop/core/theme/app_colors.dart';
import 'package:lets_shop/core/theme/app_styles.dart';
import 'package:lets_shop/core/utils/extentions/app_localization_extension.dart';
import 'package:lets_shop/core/utils/extentions/num_extension.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //When showing the splash screen, after 600ms we push it to the HomeScreen while initializing the path for our Application Document Directory
    Future.delayed(Durations.extralong2, () {
      AppPathProvider.initPath().then(
        (value) =>
            Navigator.of(context).pushReplacementNamed(RoutesPath.homeScreen),
      );
    });
    return Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox.expand(
        child: Stack(
          children: [
            //Aligning the Bene Bono logo in the center of the app
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset(AppAssets.beneBonoLogo),
            ),
            //Positioning the texts on the bottom
            Positioned(
              bottom: 32.h(context),
              left: 116.w(context),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //Using RichText to diversify the style of the text on show
                  RichText(
                    text: TextSpan(
                        // using context.tr (translate) to keep it multilanguage
                        text: context.tr("app.developed_by"),
                        // Using pre-determined TextStyle with AppStyle then copy with to make it more customizable
                        style: AppStyles.contentStyle.copyWith(
                          // Using pre-determined Colors with AppColors
                          color: AppColors.primaryColor.withOpacity(0.8),
                        ),
                        children: [
                          TextSpan(
                            text: context.tr("app.author"),
                            style: AppStyles.contentStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                          )
                        ]),
                  ),
                  RichText(
                    text: TextSpan(
                        text: context.tr("app.sponsored_by"),
                        style: AppStyles.contentStyle.copyWith(
                          color: AppColors.primaryColor.withOpacity(0.8),
                        ),
                        children: [
                          TextSpan(
                            text: context.tr("app.sponsor"),
                            style: AppStyles.contentStyle.copyWith(
                                color: AppColors.primaryColor,
                                fontWeight: FontWeight.w500),
                          ),
                        ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
