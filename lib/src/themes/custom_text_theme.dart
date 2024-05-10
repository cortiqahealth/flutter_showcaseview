import 'dart:ui';

import 'package:flutter/material.dart';

/// [ThemeTextExtension] all text style define here
extension ThemeTextExtension on TextTheme {
  TextStyle? get secondaryHeadline6 => titleLarge?.copyWith(
        color: AppColors.myrtleGreen,
      );

  TextStyle? get onboardingTitle => titleLarge?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w400,
      );
  TextStyle? get cardDateText => headlineSmall?.copyWith(
        fontSize: 15,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get authHeadings => titleMedium!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get tNc => labelSmall!.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.myrtleGreen,
        decoration: TextDecoration.underline,
      );

  TextStyle? get errorMessage => bodySmall!.copyWith(
        color: AppColors.darkPastelRed,
      );

  TextStyle? get inputLabel => bodySmall!.copyWith(
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get textInput => bodyLarge!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get inputHint => bodyMedium!.copyWith(
        fontSize: 15,
        color: AppColors.pastelBlue,
      );

  TextStyle? get toast => bodySmall!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get toastBold => toast!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.0,
      );

  TextStyle? get selectedData => bodyMedium?.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get bodyText2DeepSpaceSparkle => bodyMedium?.copyWith(
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get unSelectData => bodyMedium?.copyWith(
        color: AppColors.deepSpaceSparkle,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get buttonTextActive => titleSmall?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get buttonTextInActive => headlineSmall?.copyWith(
        color: AppColors.steelTeal,
        fontSize: 14,
      );

  TextStyle? get textButton => labelLarge!.copyWith(
        color: AppColors.myrtleGreen,
        fontWeight: FontWeight.w500,
        fontSize: 10,
      );

  TextStyle? get textButtonSteelTeal => textButton!.copyWith(
        color: AppColors.steelTeal,
      );

  TextStyle? get textButtonBlack => textButton!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get bottomBarLabel => titleMedium!.copyWith(
        color: AppColors.deepSpaceSparkle,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get buttonBold => labelLarge!.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get buttonWithCadetGrey => buttonBold!.copyWith(
        color: AppColors.cadetGrey,
      );

  TextStyle? get subtitle2WithAeroBlue => titleSmall?.copyWith(
        fontSize: 10,
        color: AppColors.aeroBlue,
      );

  TextStyle? get subtitle2DeepSpaceSparkle => titleSmall?.copyWith(
        color: AppColors.deepSpaceSparkle,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get subtitle1WithWhite => titleMedium?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get headline6WithWhite => titleLarge?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get profileHeader => titleLarge?.copyWith(
        fontSize: 18,
        color: AppColors.white,
      );

  TextStyle? get profileSubtitle => labelSmall?.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get subtitle1WithBlack => titleMedium?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get subtitle2WithBlack => titleSmall?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get titleSmallWithBlack => titleSmall?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get textWithUnderLine => bodySmall!.copyWith(
        decoration: TextDecoration.underline,
        color: AppColors.myrtleGreen,
      );

  TextStyle? get titleMediumText => labelSmall?.copyWith(
        color: AppColors.slateBlue,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get superScriptText => bodyLarge?.copyWith(
        color: AppColors.fireEngineRed,
        fontWeight: FontWeight.w400,
        fontFeatures: const [
          FontFeature.superscripts(),
        ],
        fontSize: 15,
      );

  TextStyle? get subScriptText => tag?.copyWith(
        color: AppColors.black,
        fontFeatures: const [
          FontFeature.subscripts(),
        ],
      );

  TextStyle? get tag => headlineSmall?.copyWith(
        color: AppColors.midnightGreen,
        fontWeight: FontWeight.w500,
        fontSize: 9,
      );

  TextStyle? get tagDeepSpaceSparkle => tag?.copyWith(
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get formStageTitleText => labelSmall?.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get customSelectorNotSelectedText => bodyLarge?.copyWith(
        color: AppColors.cadetGrey,
      );

  TextStyle? get customSelectorSelectedText => bodyLarge?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get customSelectorInitialGettingResult => displaySmall?.copyWith(
        color: AppColors.lightSilver,
      );

  TextStyle? get customSelectorGettingResult => displaySmall?.copyWith(
        fontWeight: FontWeight.w400,
      );

  TextStyle? get overlineBlack => labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.black,
      );

  TextStyle? get customSelectorGettingResultText => labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.midnightGreen,
      );

  TextStyle? get headline7 => titleLarge?.copyWith(
        fontSize: 18,
        color: AppColors.black,
      );

  TextStyle? get headline7PrimaryViolet => headline7?.copyWith(
        color: AppColors.primaryViolet,
      );

  TextStyle? get captionWhite => bodySmall!.copyWith(
        color: AppColors.white,
      );

  TextStyle? get buttonBlack => labelLarge?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get labelSlateBlue => labelSmall?.copyWith(
        color: AppColors.slateBlue,
        fontWeight: FontWeight.w600,
        fontSize: 9,
      );

  TextStyle? get inviteText => titleSmall?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get appBarTitleText => titleLarge!.copyWith(
        fontSize: 18,
        color: AppColors.white,
      );

  TextStyle? get listTileTitleText => bodyMedium!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get listTileTitleTextDarkPastelRed => bodyMedium!.copyWith(
        color: AppColors.darkPastelRed,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get listTileSubTitleText => bodySmall!.copyWith(
        color: AppColors.cadetGrey,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get searchText => bodyMedium!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get textHeight => searchText!.copyWith(
        color: AppColors.black,
        height: 1.5,
      );

  TextStyle? get subtitle1Bold => titleMedium?.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get subtitle2Bold => titleSmall?.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get subtitle2LightSliver => subtitle2Bold?.copyWith(
        color: AppColors.lightSilver,
      );

  TextStyle? get captionWithCadetGrey => bodySmall!.copyWith(
        color: AppColors.cadetGrey,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get completeText => labelSmall!.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get captionPastelBlue => bodySmall!.copyWith(
        color: AppColors.pastelBlue,
      );

  TextStyle? get tagSteelTealTitle => tag!.copyWith(
        color: AppColors.steelTeal,
        fontSize: 12,
      );

  TextStyle? get tagCadetGrey => tag!.copyWith(
        fontSize: 10,
        letterSpacing: 1.5,
        color: AppColors.cadetGrey,
      );

  TextStyle? get tagCadetGreyBold => tagCadetGrey!.copyWith(
        fontWeight: FontWeight.w800,
      );

  TextStyle? get tagSlateBlue => tag!.copyWith(
        fontSize: 10,
        letterSpacing: 1.5,
        color: AppColors.slateBlue,
      );

  TextStyle? get overlineWithCharcoal => labelSmall?.copyWith(
        color: AppColors.charcoal,
        fontWeight: FontWeight.w600,
      );
  TextStyle? get captionSteelTeal => bodySmall?.copyWith(
        color: AppColors.steelTeal,
      );

  TextStyle? get captionWithWhite => bodySmall?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get tagWithAeroBlue => tag?.copyWith(
        color: AppColors.aeroBlue,
        letterSpacing: 1.5,
      );

  TextStyle? get tagWithLightSilver => tagWithAeroBlue?.copyWith(
        color: AppColors.lightSilver,
      );

  TextStyle? get overlineLightSilver => labelSmall?.copyWith(
        color: AppColors.lightSilver,
      );

  TextStyle? get tagWithSteelTeal => tag?.copyWith(
        color: AppColors.steelTeal,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get tagMidnightGreen => tag?.copyWith(
        color: AppColors.midnightGreen,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );

  TextStyle? get tagMyrtleGreen => tag?.copyWith(
        color: AppColors.myrtleGreen,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );

  TextStyle? get tagSteelTeal => tag?.copyWith(
        color: AppColors.steelTeal,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );

  TextStyle? get overlinePastelBlue => labelSmall?.copyWith(
        color: AppColors.pastelBlue,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get buttonDeepSpaceSparkle => labelLarge?.copyWith(
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get overlineCadetGrey => labelSmall?.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        color: AppColors.cadetGrey,
      );

  TextStyle? get overlineSlateBlue => labelSmall?.copyWith(
        fontSize: 9,
        fontWeight: FontWeight.w500,
        color: AppColors.slateBlue,
      );

  TextStyle? get logOutText => labelLarge!.copyWith(
        color: AppColors.myrtleGreen,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get captionWithBlack => bodySmall!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get overlineWithMyrtleGreen => labelSmall!.copyWith(
        color: AppColors.myrtleGreen,
      );

  TextStyle? get overlineSlateBlueBold => labelSmall!.copyWith(
        color: AppColors.slateBlue,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get slateBlueWithSpace => overlineSlateBlueBold!.copyWith(
        letterSpacing: 1.5,
      );

  TextStyle? get captionDeepSpaceSparkle => bodySmall!.copyWith(
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get bodyText2WithBlack => bodyMedium?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get unSelectedData => bodyMedium?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get headline6Black => titleLarge?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get inputLabelBlack => bodySmall!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get tagBlack => tag!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get captionBlack => bodySmall!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get headline5Black => headlineSmall?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get headline5White => headlineSmall?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get headline5LightSilver => headlineSmall?.copyWith(
        color: AppColors.lightSilver,
      );

  TextStyle? get headingSymbol => buttonTextInActive?.copyWith(
        fontSize: 18,
      );

  TextStyle? get headingSymbolWhite => captionWhite?.copyWith(
        fontSize: 18,
      );

  TextStyle? get bodyText2BlackBold => bodyMedium?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get overSteelTeal => labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.steelTeal,
      );

  TextStyle? get overlineWhite => labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.white,
        fontSize: 12,
      );

  TextStyle? get buttonBlackBold => labelLarge?.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get buttonBlackDarkPastelRedBold => labelLarge?.copyWith(
        color: AppColors.darkPastelRed,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get overlineBlackBold => labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      );

  TextStyle? get tagDeepSpaceSparkleSpace => tag?.copyWith(
        color: AppColors.deepSpaceSparkle,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );

  TextStyle? get bodyText2CadetGrey => bodyMedium?.copyWith(
        color: AppColors.cadetGrey,
      );

  TextStyle? get bodyText2White => bodyMedium?.copyWith(
        color: AppColors.white,
      );
  TextStyle? get bodyText2PastelBlue => bodyMedium?.copyWith(
        color: AppColors.pastelBlue,
      );

  TextStyle? get headline4MyrtleGreen => headlineMedium?.copyWith(
        color: AppColors.myrtleGreen,
      );
  TextStyle? get headline4Black => headlineMedium?.copyWith(
        color: AppColors.black,
      );

  TextStyle? get accountUserName => headline7!.copyWith(
        color: AppColors.aeroBlue,
        overflow: TextOverflow.ellipsis,
      );

  TextStyle? get buttonWhite => labelLarge?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get overlinePrimaryViolet => labelSmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.primaryViolet,
      );
  TextStyle? get captionMyrtleGreen => bodySmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.myrtleGreen,
      );
  TextStyle? get captionMyrtleGreenSmall => bodySmall?.copyWith(
        fontWeight: FontWeight.w500,
        color: AppColors.myrtleGreen,
        fontSize: 9,
      );
  TextStyle? get captionPrimaryViolet => bodySmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.primaryViolet,
      );

  TextStyle? get headline7SteelTeal => headline7?.copyWith(
        color: AppColors.steelTeal,
      );

  TextStyle? get headline2CadetGrey => displayMedium?.copyWith(
        color: AppColors.cadetGrey,
      );

  TextStyle? get headline2White => displayMedium?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get bpmText => labelSmall!.copyWith(
        color: AppColors.white,
        fontSize: 10,
        letterSpacing: 1,
      );

  TextStyle? get tagWhite => tag?.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w500,
        letterSpacing: 1.5,
      );

  TextStyle? get subtitle2White => titleSmall?.copyWith(
        color: AppColors.white,
        letterSpacing: 0.1,
      );

  TextStyle? get overlineMyrtleGreenBold => overlineWithMyrtleGreen!.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get overlineMidnightGreenBold => labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.midnightGreen,
      );

  TextStyle? get overlineWhiteBold => labelSmall?.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.white,
      );

  TextStyle? get captionBlackBold => bodySmall!.copyWith(
        color: AppColors.black,
        fontWeight: FontWeight.w500,
      );

  TextStyle? get tagSteelTealBold => tag?.copyWith(
        color: AppColors.steelTeal,
        fontWeight: FontWeight.w600,
        letterSpacing: 1.5,
      );

  TextStyle? get headline7White => headline7?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get headline2WhiteLite => displayMedium?.copyWith(
        fontSize: 50,
        color: AppColors.white,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
      );

  TextStyle? get headline2CadetGreyLite => displayMedium?.copyWith(
        color: AppColors.cadetGrey,
        fontWeight: FontWeight.w300,
        letterSpacing: 0.5,
      );

  TextStyle? get overlineMidnightGreen => overlineSlateBlue?.copyWith(
        color: AppColors.midnightGreen,
      );

  TextStyle? get pastelBlueCaption => captionDeepSpaceSparkle?.copyWith(
        color: AppColors.pastelBlue,
      );

  TextStyle? get slateBlueLabel => labelSlateBlue?.copyWith(
        color: AppColors.slateBlue.withOpacity(0.7),
      );

  TextStyle? get pastelBlueTag => tagDeepSpaceSparkle?.copyWith(
        color: AppColors.pastelBlue,
      );

  TextStyle? get cadetGreySubtitle1 => subtitle1WithBlack?.copyWith(
        color: AppColors.cadetGrey,
      );

  TextStyle? get bottomBarLabelBlack => bottomBarLabel!.copyWith(
        color: AppColors.black,
      );

  TextStyle? get bodyText1PastelBlue => bodyLarge?.copyWith(
        color: AppColors.pastelBlue,
      );

  TextStyle? get captionCharcoal => bodySmall!.copyWith(
        color: AppColors.charcoal,
      );

  TextStyle? get headline3White => displaySmall?.copyWith(
        fontWeight: FontWeight.w400,
        color: AppColors.white,
      );

  TextStyle? get overlineAeroBlue => labelSmall!.copyWith(
        fontWeight: FontWeight.w600,
        color: AppColors.aeroBlue,
      );

  TextStyle? get captionBold => bodySmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get pieChartLabel => labelSmall?.copyWith(
        color: AppColors.white,
      );

  TextStyle? get touchedPieChartLabel => labelSmall?.copyWith(
        color: AppColors.white,
        fontWeight: FontWeight.w600,
      );

  TextStyle? get tagMidnightGreen2 => tag?.copyWith(
        color: AppColors.midnightGreen,
        fontWeight: FontWeight.w400,
      );

  TextStyle? get bodySmallDeepSpaceSparkle => bodySmall!.copyWith(
        color: AppColors.deepSpaceSparkle,
      );

  TextStyle? get graphAxisLabel => const TextStyle(
        color: AppColors.pastelBlue,
        fontWeight: FontWeight.bold,
        fontSize: 8,
      );

  TextStyle? get healTitle => titleSmall?.copyWith(
        fontWeight: FontWeight.bold,
        fontSize: 14,
        color: AppColors.myrtleGreen,
      );

  TextStyle? get healPrimaryViolet => displaySmall!.copyWith(
      color: AppColors.primaryViolet,
      fontWeight: FontWeight.w400,
      fontSize: 12);
  TextStyle? get smalldeepSparkle => bottomBarLabel!.copyWith(
        fontSize: 12,
      );
  TextStyle? get bodySmallDeepSpaceSparkleBold =>
      bodySmallDeepSpaceSparkle!.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get bodySmallBold => bodySmall!.copyWith(
        fontWeight: FontWeight.w600,
      );

  TextStyle? get tagCadetGreyLarge => tag!.copyWith(
        fontSize: 22,
        letterSpacing: 1.5,
        color: AppColors.steelTeal,
      );
}

class AppColors {
  AppColors._();

  static const Color myrtleGreen = Color(0xFF226D7B);
  static const Color darkPastelRed = Color(0xFFC63F17);
  static const Color pastelPurple = Color(0xFFB7A0CE);
  static const Color white = Color(0xFFFFFFFF);
  static const Color lightSilver = Color(0xFFCFD8DC);
  static const Color steelTeal = Color(0xFF607D8B);
  static const Color black = Color(0xFF000000);
  static const Color deepSpaceSparkle = Color(0xFF4C626D);
  static const Color midnightGreen = Color(0xFF00424F);
  static const Color pastelBlue = Color(0xFFB0BEC5);
  static const Color charcoal = Color(0xFF354B56);
  static const Color antiFlashWhite = Color(0xFFF1F5F8);
  static const Color aliceBlue = Color(0xFFF1FAFC);
  static const Color maximumGreen = Color(0xFF558B24);
  static const Color saffron = Color(0xFFFBC02D);
  static const Color slateBlue = Color(0xFF724BC0);
  static const Color paleLavender = Color(0xFFE2D4EF);
  static const Color charcoalWithOpacity = Color(0xFF2D4550);
  static const Color aeroBlue = Color(0xFFCEFFF0);
  static const Color transparent = Color(0x00000000);
  static const Color blueSapphire = Color(0xFF13697C);
  static const Color ghostWhite = Color(0xFFF6FBFF);
  static const Color gunmetal = Color(0xFF263238);
  static const Color cadetGrey = Color(0xFF90A4AE);
  static const Color fireEngineRed = Color(0xFFC61F2B);
  static const Color lavender = Color(0xFFE9E9F9);
  static const Color linen = Color(0xFFF9ECE8);
  static const Color alabaster = Color(0xFFEEF3E9);
  static const Color floralWhite = Color(0xFFFFF9EC);
  static const Color gunMetal = Color(0xFF263238);
  static const Color raisinBlack = Color(0xFF1D192B);
  static const Color lavenderWeb = Color(0xFFEAE1F3);
  static const Color primaryViolet = Color(0xFF592BB4);
  static const Color mercury = Color(0xFFE5E5E5);
  static const Color mercurySolid = Color(0xFFE5E5E5);
  static const Color sazerac = Color(0xFFFFF6E5);
  static const Color grayChateau = Color(0xFF9AA5AA);
  static const Color loblolly = Color(0xFFBCC8CE);
  static const Color powderBlue = Color(0xFFBBE6D9);
  static const Color jellyBeanBlue = Color(0xFF3F8D9B);
  static const Color lightPastelPurple = Color(0xFFB7A0CD);
  static const bigFootFeet = Color(0XFFF88B5A);
}
