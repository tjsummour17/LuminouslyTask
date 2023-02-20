import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:luminously/src/common/resources/assets.dart';
import 'package:luminously/src/common/utils/ui/build_context_x.dart';
import 'package:luminously/src/common/widgets/main_button.dart';
import 'package:luminously/src/features/login/view/login_page.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            width: context.screenWidth,
            height: context.screenHeight,
            decoration: const BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                matchTextDirection: true,
                image: AssetImage(
                  AppImages.landing,
                ),
              ),
            ),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
              child: ColoredBox(
                color: context.colorScheme.primary.withOpacity(0.25),
              ),
            ),
          ),
          Column(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.center,
                  child: SvgPicture.asset(
                    AppSvg.logo,
                    width: 200,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                context.localizations.careAndCure,
                textAlign: TextAlign.center,
                style: context.textTheme.titleLarge?.copyWith(
                  color: Colors.white,
                  wordSpacing: 3,
                  height: 1.8,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 180,
                child: AppButton.secondary(
                  onPressed: () => context.pushNamed(LoginPage.routeName),
                  label: context.localizations.getStarted,
                  textStyle: context.textTheme.labelLarge?.copyWith(
                    color: context.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                  color: Colors.white,
                ),
              ),
              const SafeArea(child: SizedBox()),
            ],
          ),
        ],
      ),
    );
  }
}
