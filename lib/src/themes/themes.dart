import 'package:flutter/material.dart';

import 'custom_text_theme.dart';

class Themes {
  Themes._();

  static final ThemeData baseTheme = ThemeData.light();

  static ThemeData buildLightTheme() {
    return ThemeData(
      fontFamily: 'Rubik',
      appBarTheme: _buildAppBarTheme(),
      textTheme: _buildLightTextTheme(),
      checkboxTheme: _buildCheckboxTheme(),
      timePickerTheme: _buildTimePickerTheme(),
      cardTheme: _buildCardTheme(),
      tabBarTheme: _buildTabBarTheme(),
      bottomSheetTheme: const BottomSheetThemeData(
        backgroundColor: AppColors.white,
        surfaceTintColor: AppColors.transparent,
      ),
      switchTheme: SwitchThemeData(
        overlayColor: MaterialStateProperty.resolveWith(
          (final Set<MaterialState> states) {
            return AppColors.white;
          },
        ),
        trackOutlineColor: MaterialStateProperty.resolveWith(
          (final Set<MaterialState> states) {
            return AppColors.transparent;
          },
        ),
      ).copyWith(
        thumbColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.black;
          }
          if (states.contains(MaterialState.selected)) {
            return null;
          }
          return AppColors.white;
        }),
        trackColor: MaterialStateProperty.resolveWith<Color?>(
            (Set<MaterialState> states) {
          if (states.contains(MaterialState.disabled)) {
            return AppColors.charcoal;
          }
          if (states.contains(MaterialState.selected)) {
            return null;
          }
          return null;
        }),
      ),
      iconTheme: _buildIconTheme(),
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.myrtleGreen,
      ).copyWith(
        primaryContainer: AppColors.myrtleGreen,
        secondary: AppColors.myrtleGreen,
        secondaryContainer: AppColors.myrtleGreen,
        background: AppColors.white,
        onPrimary: AppColors.antiFlashWhite,
        onSecondary: AppColors.steelTeal,
        onSurface: AppColors.steelTeal,
        error: AppColors.darkPastelRed,
      ),
    );
  }

  /// [_buildTimePickerTheme] use theme for clock ui to select time
  static TimePickerThemeData _buildTimePickerTheme() {
    return baseTheme.timePickerTheme.copyWith(
      backgroundColor: AppColors.white,
      dialBackgroundColor: AppColors.antiFlashWhite,
      dayPeriodBorderSide: const BorderSide(
        color: AppColors.myrtleGreen,
        width: 1.5,
      ),
      entryModeIconColor: AppColors.myrtleGreen,
      helpTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
      dayPeriodTextStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      ),
      hourMinuteTextStyle: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        letterSpacing: 0.25,
      ),
      hourMinuteShape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(4)),
        side: BorderSide(
          width: 2,
          color: AppColors.myrtleGreen,
        ),
      ),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }

  static AppBarTheme _buildAppBarTheme() {
    return const AppBarTheme(
      elevation: 0,
      backgroundColor: AppColors.myrtleGreen,
    );
  }

  static CheckboxThemeData _buildCheckboxTheme() {
    return CheckboxThemeData(
      fillColor: MaterialStateProperty.all(AppColors.myrtleGreen),
      side: const BorderSide(
        color: AppColors.myrtleGreen,
        width: 2,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4),
      ),
    );
  }

  static TextTheme _buildLightTextTheme() {
    return baseTheme.textTheme
        .copyWith(
          displayLarge: baseTheme.textTheme.displayLarge?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 96,
            fontWeight: FontWeight.w300,
          ),
          displayMedium: baseTheme.textTheme.displayMedium?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 60,
            fontWeight: FontWeight.w300,
          ),
          displaySmall: baseTheme.textTheme.displaySmall?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 48,
            fontWeight: FontWeight.w400,
          ),
          headlineMedium: baseTheme.textTheme.headlineMedium?.copyWith(
            fontSize: 34,
            color: AppColors.myrtleGreen,
            fontWeight: FontWeight.w400,
          ),
          headlineSmall: baseTheme.textTheme.headlineSmall?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 24,
            fontWeight: FontWeight.w400,
          ),
          titleLarge: baseTheme.textTheme.titleLarge?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 22,
            fontWeight: FontWeight.w400,
          ),
          titleMedium: baseTheme.textTheme.titleMedium?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 16,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: baseTheme.textTheme.titleSmall?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodyLarge: baseTheme.textTheme.bodyLarge?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
          bodyMedium: baseTheme.textTheme.bodyMedium?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 14,
            fontWeight: FontWeight.w400,
          ),
          labelLarge: baseTheme.textTheme.labelLarge?.copyWith(
            color: AppColors.myrtleGreen,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
          bodySmall: baseTheme.textTheme.labelLarge?.copyWith(
            color: AppColors.deepSpaceSparkle,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          labelSmall: baseTheme.textTheme.labelLarge?.copyWith(
            color: AppColors.deepSpaceSparkle,
            fontSize: 10,
            fontWeight: FontWeight.w400,
          ),
        )
        .apply(
          fontFamily: 'Rubik',
        );
  }

  static CardTheme _buildCardTheme() {
    return baseTheme.cardTheme.copyWith(
      color: AppColors.white,
    );
  }

  static IconThemeData _buildIconTheme() {
    return baseTheme.iconTheme.copyWith(
      color: AppColors.black,
    );
  }

  static TabBarTheme _buildTabBarTheme() {
    return const TabBarTheme(
        indicatorColor: AppColors.myrtleGreen,
        dividerHeight: 0,
        indicatorSize: TabBarIndicatorSize.tab,
        unselectedLabelColor: AppColors.cadetGrey,
        labelColor: AppColors.myrtleGreen);
  }
}
