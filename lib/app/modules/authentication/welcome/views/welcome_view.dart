import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:restaurants_app/app/core/constants/app_color.dart';
import 'package:restaurants_app/app/core/constants/app_size..dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/food_hero.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/reveal.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_action_card.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_background.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_header_section.dart';
import 'package:restaurants_app/app/modules/authentication/welcome/widgets/welcome_terms_text.dart';

import '../controllers/welcome_controller.dart';

class WelcomeView extends GetView<WelcomeController> {
  const WelcomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final isDark = theme.brightness == Brightness.dark;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: isDark ? Brightness.light : Brightness.dark,
        statusBarBrightness: isDark ? Brightness.dark : Brightness.light,
        systemNavigationBarColor:
        isDark ? AppColor.darkScaffold : AppColor.scaffold,
        systemNavigationBarIconBrightness:
        isDark ? Brightness.light : Brightness.dark,
      ),
      child: Scaffold(
        body: Stack(
          children: [
            WelcomeBackground(isDark: isDark),

            SafeArea(
              child: LayoutBuilder(
                builder: (context, constraints) {
                  final heroHeight =
                  (constraints.maxHeight * 0.26).clamp(120.0, 220.0);

                  return SingleChildScrollView(
                    child: Center(
                      child: ConstrainedBox(
                        constraints: BoxConstraints(
                          maxWidth: 480,
                          minHeight: constraints.maxHeight,
                        ),
                        child: Padding(
                          padding: EdgeInsets.all(AppSize.xl),
                          child: IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(height: constraints.maxHeight * 0.04),

                                // Header
                                Reveal(
                                  begin: 0.0,
                                  child: WelcomeHeaderSection(
                                    textTheme: textTheme,
                                    colorScheme: colorScheme,
                                  ),
                                ),

                                const Spacer(),

                                // Hero Icon Stack
                                Reveal(
                                  begin: 0.15,
                                  child: FoodHero(
                                    height: heroHeight.toDouble(),
                                    isDark: isDark,
                                  ),
                                ),

                                const Spacer(),

                                // Action Card
                                Reveal(
                                  begin: 0.3,
                                  child: WelcomeActionCard(
                                    textTheme: textTheme,
                                    isDark: isDark,
                                    colorScheme: colorScheme,
                                    controller: controller,
                                  ),
                                ),

                                const SizedBox(height: 20),

                                // Terms & Conditions Text
                                Reveal(
                                  begin: 0.5,
                                  child: WelcomeTermsText(
                                    textTheme: textTheme,
                                    colorScheme: colorScheme,
                                  ),
                                ),

                                const SizedBox(height: 8),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}