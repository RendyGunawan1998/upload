import 'package:flutter/material.dart';

class MyDimensions {
  /// The height of the toolbar component of the [AppBar].
  static double kToolbarHeight = 56.0;

  /// The height of the bottom navigation bar.
  static double kBottomNavigationBarHeight = 56.0;

  /// The height of a tab bar containing text.
  static double kTextTabBarHeight = 48.0;
  // static double kWrapTextWidthLeft = 0.01;
  static double kWrapTextWidthRight = 0.65;

  static double kProfileAccountIcon = 60.0;
  static double kPaddingx8 = 8.0;
  static double kPaddingx16 = 16.0;
  static double kPaddingx20 = 20.0;
  static double kPaddingx24 = 24.0;

  /// The amount of time theme change animations should last.
  static Duration kThemeChangeDuration = Duration(milliseconds: 200);

  /// The radius of a circular material ink response in logical pixels.
  static double kRadialReactionRadius = 20.0;

  /// The amount of time a circular material ink response should take to expand to its full size.
  static Duration kRadialReactionDuration = Duration(milliseconds: 100);

  /// The value of the alpha channel to use when drawing a circular material ink response.
  static int kRadialReactionAlpha = 0x1F;

  /// The duration of the horizontal scroll animation that occurs when a tab is tapped.
  static Duration kTabScrollDuration = Duration(milliseconds: 300);

  /// The horizontal padding included by [Tab]s.
  static EdgeInsets kTabLabelPadding = EdgeInsets.symmetric(horizontal: 16.0);

  /// The padding added around material list items.
  static EdgeInsets kContainerPadding = EdgeInsets.only(left: 4.0, right: 4.0);
  static EdgeInsets kContainerPaddingx8 =
  EdgeInsets.only(left: 8.0, right: 8.0);
  static EdgeInsets kContainerPaddingInner = EdgeInsets.all(8.0);
  static EdgeInsets kAllPaddingx4 = EdgeInsets.all(4.0);
  static EdgeInsets kAllPaddingx6 = EdgeInsets.all(6.0);
  static EdgeInsets kAllPaddingx8 = EdgeInsets.all(8.0);
  static EdgeInsets kMaterialListPadding = EdgeInsets.symmetric(vertical: 8.0);
  static EdgeInsets kMaterialCardPadding = EdgeInsets.all(16.0);
  static EdgeInsets kPaddingBottom = EdgeInsets.only(bottom: 16.0);
  static EdgeInsets kPaddingTop = EdgeInsets.only(top: 16.0);
  static EdgeInsets kPaddingLeftRight = EdgeInsets.only(left: 8.0, right: 8.0);
  static EdgeInsets kPaddingBadge =
  EdgeInsets.only(top: 6.0, bottom: 6.0, left: 12.0, right: 12.0);
}
