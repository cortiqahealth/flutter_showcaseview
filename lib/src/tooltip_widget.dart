/*
 * Copyright (c) 2021 Simform Solutions
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be
 * included in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';

import '../showcaseview.dart';
import 'extension.dart';
import 'get_position.dart';
import 'measure_size.dart';
import 'themes/custom_text_theme.dart';
import 'widget/tooltip_slide_transition.dart';

const _kDefaultPaddingFromParent = 14.0;

class ToolTipWidget extends StatefulWidget {
  final GetPosition? position;
  final Offset? offset;
  final Size screenSize;
  final String? title;
  final TextAlign? titleAlignment;
  final String? description;
  final TextAlign? descriptionAlignment;
  final TextStyle? titleTextStyle;
  final TextStyle? descTextStyle;
  final Widget? container;
  final Color? tooltipBackgroundColor;
  final Color? textColor;
  final bool showArrow;
  final double contentHeight;
  final double contentWidth;
  final VoidCallback? onTooltipTap;
  final EdgeInsets? tooltipPadding;
  final Duration movingAnimationDuration;
  final bool disableMovingAnimation;
  final bool disableScaleAnimation;
  final BorderRadius? tooltipBorderRadius;
  final Duration scaleAnimationDuration;
  final Curve scaleAnimationCurve;
  final Alignment? scaleAnimationAlignment;
  final bool isTooltipDismissed;
  final TooltipPosition? tooltipPosition;
  final EdgeInsets? titlePadding;
  final EdgeInsets? descriptionPadding;
  final TextDirection? titleTextDirection;
  final TextDirection? descriptionTextDirection;
  final double toolTipSlideEndDistance;

  /// context of the screen
  final BuildContext showCaseContext;

  /// text displayed in Button
  final String buttonText;

  /// used to hide skipButton
  final bool showSkipButton;

  /// to show double layers
  final bool showDoubleLayer;
  const ToolTipWidget({
    Key? key,
    required this.position,
    required this.offset,
    required this.screenSize,
    required this.title,
    required this.titleAlignment,
    required this.description,
    required this.titleTextStyle,
    required this.descTextStyle,
    required this.container,
    required this.tooltipBackgroundColor,
    required this.textColor,
    required this.showArrow,
    this.contentHeight = 10,
    this.contentWidth = double.infinity,
    required this.onTooltipTap,
    required this.movingAnimationDuration,
    required this.descriptionAlignment,
    this.tooltipPadding = const EdgeInsets.symmetric(vertical: 8),
    required this.disableMovingAnimation,
    required this.disableScaleAnimation,
    required this.tooltipBorderRadius,
    required this.scaleAnimationDuration,
    required this.scaleAnimationCurve,
    this.scaleAnimationAlignment,
    this.isTooltipDismissed = false,
    this.tooltipPosition,
    this.titlePadding,
    this.descriptionPadding,
    this.titleTextDirection,
    this.descriptionTextDirection,
    this.toolTipSlideEndDistance = 7,
    required this.showCaseContext,
    this.buttonText = 'Next',
    this.showSkipButton = true,
    this.showDoubleLayer = true,
  }) : super(key: key);

  @override
  State<ToolTipWidget> createState() => _ToolTipWidgetState();
}

class _ToolTipWidgetState extends State<ToolTipWidget>
    with TickerProviderStateMixin {
  Offset? position;

  bool isArrowUp = false;

  late final AnimationController _movingAnimationController;
  late final Animation<double> _movingAnimation;
  late final AnimationController _scaleAnimationController;
  late final Animation<double> _scaleAnimation;
  late final Animation<double> fadeInFadeOut2;
  late final Animation<double> fadeInFadeOut;
  late final AnimationController controller2;
  late final AnimationController controller;

  double tooltipWidth = 0;
  double tooltipScreenEdgePadding = 20;
  double tooltipTextPadding = 15;

  TooltipPosition findPositionForContent(Offset position) {
    var height = 120.0;
    height = height;
    final bottomPosition =
        position.dy + ((widget.position?.getHeight() ?? 0) / 2);
    final topPosition = position.dy - ((widget.position?.getHeight() ?? 0) / 2);
    final hasSpaceInTop = topPosition >= height;
    // TODO: need to update for flutter version > 3.8.X
    // ignore: deprecated_member_use
    final EdgeInsets viewInsets = EdgeInsets.fromWindowPadding(
      // ignore: deprecated_member_use
      ambiguate(WidgetsBinding.instance)?.window.viewInsets ??
          // ignore: deprecated_member_use
          WindowPadding.zero,
      // ignore: deprecated_member_use
      ambiguate(WidgetsBinding.instance)?.window.devicePixelRatio ?? 1,
    );
    final double actualVisibleScreenHeight =
        widget.screenSize.height - viewInsets.bottom;
    final hasSpaceInBottom =
        (actualVisibleScreenHeight - bottomPosition) >= height;
    return (hasSpaceInTop && !hasSpaceInBottom
        ? TooltipPosition.top
        : TooltipPosition.bottom);
  }

  void _getTooltipWidth() {
    final titleStyle = widget.titleTextStyle ??
        Theme.of(context)
            .textTheme
            .titleLarge!
            .merge(TextStyle(color: widget.textColor));
    final descriptionStyle = widget.descTextStyle ??
        Theme.of(context)
            .textTheme
            .titleSmall!
            .merge(TextStyle(color: widget.textColor));
    final titleLength = widget.title == null
        ? 0
        : _textSize(widget.title!, titleStyle).width +
            widget.tooltipPadding!.right +
            widget.tooltipPadding!.left +
            (widget.titlePadding?.right ?? 0) +
            (widget.titlePadding?.left ?? 0);
    final descriptionLength = widget.description == null
        ? 0
        : (_textSize(widget.description!, descriptionStyle).width +
            widget.tooltipPadding!.right +
            widget.tooltipPadding!.left +
            (widget.descriptionPadding?.right ?? 0) +
            (widget.descriptionPadding?.left ?? 0));
    var maxTextWidth = max(titleLength, descriptionLength);
    if (maxTextWidth > widget.screenSize.width - tooltipScreenEdgePadding) {
      tooltipWidth = widget.screenSize.width - tooltipScreenEdgePadding;
    } else {
      tooltipWidth = maxTextWidth + tooltipTextPadding;
    }
  }

  double? _getLeft() {
    if (widget.position != null) {
      final width = tooltipWidth;
      double leftPositionValue = widget.position!.getCenter() - (width * 0.5);
      if ((leftPositionValue + width) > widget.screenSize.width) {
        return null;
      } else if ((leftPositionValue) < _kDefaultPaddingFromParent) {
        return _kDefaultPaddingFromParent;
      } else {
        return leftPositionValue;
      }
    }
    return null;
  }

  double? _getRight() {
    if (widget.position != null) {
      final width = tooltipWidth;

      final left = _getLeft();
      if (left == null || (left + width) > widget.screenSize.width) {
        final rightPosition = widget.position!.getCenter() + (width * 0.5);

        return (rightPosition + width) > widget.screenSize.width
            ? _kDefaultPaddingFromParent
            : null;
      } else {
        return null;
      }
    }
    return null;
  }

  double _getSpace() {
    var space = widget.position!.getCenter() - (widget.contentWidth! / 2);
    if (space + widget.contentWidth! > widget.screenSize.width) {
      space = widget.screenSize.width - widget.contentWidth! - 8;
    } else if (space < (widget.contentWidth! / 2)) {
      space = 16;
    }
    return space;
  }

  double _getAlignmentX() {
    final calculatedLeft = _getLeft();
    var left = calculatedLeft == null
        ? 0
        : (widget.position!.getCenter() - calculatedLeft);
    var right = _getLeft() == null
        ? (widget.screenSize.width - widget.position!.getCenter()) -
            (_getRight() ?? 0)
        : 0;
    final containerWidth = tooltipWidth;

    if (left != 0) {
      return (-1 + (2 * (left / containerWidth)));
    } else {
      return (1 - (2 * (right / containerWidth)));
    }
  }

  double _getAlignmentY() {
    var dy = isArrowUp
        ? -1.0
        : (MediaQuery.of(context).size.height / 2) < widget.position!.getTop()
            ? -1.0
            : 1.0;
    return dy;
  }

  final GlobalKey _customContainerKey = GlobalKey();
  final ValueNotifier<double> _customContainerWidth = ValueNotifier<double>(1);

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      value: 0.0,
    );

    controller.forward();

    fadeInFadeOut = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );

    controller2 = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
      animationBehavior: AnimationBehavior.preserve,
      value: 0.0,
    );

    controller2.forward();

    fadeInFadeOut2 = CurvedAnimation(
      parent: controller,
      curve: Curves.easeOut,
    );
    _movingAnimationController = AnimationController(
      duration: widget.movingAnimationDuration,
      vsync: this,
    );
    _movingAnimation = CurvedAnimation(
      parent: _movingAnimationController,
      curve: Curves.easeOut,
    );
    _scaleAnimationController = AnimationController(
      duration: widget.scaleAnimationDuration,
      vsync: this,
      lowerBound: widget.disableScaleAnimation ? 1 : 0,
    );
    _scaleAnimation = CurvedAnimation(
      parent: _scaleAnimationController,
      curve: widget.scaleAnimationCurve,
    );
    if (widget.disableScaleAnimation) {
      movingAnimationListener();
    } else {
      _scaleAnimationController
        ..addStatusListener((scaleAnimationStatus) {
          if (scaleAnimationStatus == AnimationStatus.completed) {
            movingAnimationListener();
          }
        })
        ..forward();
    }
    if (!widget.disableMovingAnimation) {
      _movingAnimationController.forward();
    }
  }

  void movingAnimationListener() {
    _movingAnimationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _movingAnimationController.reverse();
      }
      if (_movingAnimationController.isDismissed) {
        if (!widget.disableMovingAnimation) {
          _movingAnimationController.forward();
        }
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _getTooltipWidth();
  }

  @override
  void didUpdateWidget(covariant ToolTipWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    _getTooltipWidth();
  }

  @override
  void dispose() {
    controller.dispose();
    controller2.dispose();
    _movingAnimationController.dispose();
    _scaleAnimationController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: maybe all this calculation doesn't need to run here. Maybe all or some of it can be moved outside?
    position = widget.offset;
    final contentOrientation = findPositionForContent(position!);
    final contentOffsetMultiplier =
        contentOrientation == TooltipPosition.bottom ? 1.0 : -1.0;
    isArrowUp = contentOffsetMultiplier == 1.0;

    final contentY = isArrowUp
        ? widget.position!.getBottom() + (contentOffsetMultiplier * 3)
        : widget.position!.getTop() + (contentOffsetMultiplier * 3);

    final num contentFractionalOffset =
        contentOffsetMultiplier.clamp(-1.0, 0.0);

    var paddingTop = isArrowUp ? 22.0 : 0.0;
    var paddingBottom = isArrowUp ? 0.0 : 22.0;

    if (!widget.showArrow) {
      paddingTop = 10;
      paddingBottom = 10;
    }

    const arrowWidth = 18.0;
    const arrowHeight = 9.0;

    if (!widget.disableScaleAnimation && widget.isTooltipDismissed) {
      _scaleAnimationController.reverse();
    }

    if (widget.container == null) {
      return Stack(
        children: [
          Positioned(
            top: contentY,
            left: _getLeft(),
            right: _getRight(),
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: widget.scaleAnimationAlignment ??
                  Alignment(
                    _getAlignmentX(),
                    _getAlignmentY(),
                  ),
              child: FractionalTranslation(
                translation: Offset(0.0, contentFractionalOffset as double),
                child: ToolTipSlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(
                      0,
                      widget.toolTipSlideEndDistance * contentOffsetMultiplier,
                    ),
                  ).animate(_movingAnimation),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Stack(
                      alignment: isArrowUp
                          ? Alignment.topLeft
                          : _getLeft() == null
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                      children: [
                        GestureDetector(
                          onTap: widget.onTooltipTap,
                          child: Transform.scale(
                            scale: 1.2,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: widget.tooltipBackgroundColor,
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              // padding: widget.tooltipPadding,
                              child: Center(
                                child: Padding(
                                  padding: widget.descriptionPadding ??
                                      EdgeInsets.zero,
                                  child: Text(
                                    "tooltip",
                                    textAlign: widget.descriptionAlignment,
                                    textDirection:
                                        widget.descriptionTextDirection,
                                    style: widget.descTextStyle ??
                                        Theme.of(context)
                                            .textTheme
                                            // TODO: replace once support for 3.1.0 and above is provided.
                                            // ignore: deprecated_member_use
                                            .subtitle2!
                                            .merge(
                                              TextStyle(
                                                color: widget.textColor,
                                              ),
                                            ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    /// show double layers in showcase
    if (widget.showDoubleLayer) {
      return Stack(
        clipBehavior: Clip.antiAlias,
        children: <Widget>[
          Positioned(
            left: _getSpace(),
            top: contentY - 10,
            child: Material(
              color: Colors.transparent,
              child: ScaleTransition(
                alignment: Alignment.topCenter,
                scale: fadeInFadeOut,
                child: GestureDetector(
                  onTap: widget.onTooltipTap,
                  child: Transform.scale(
                    alignment: Alignment.bottomLeft,
                    scale: 1.2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: const Color(0xFFF6FBFF).withOpacity(0.7),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            left: _getSpace(),
            top: contentY,
            child: Material(
              color: Colors.transparent,
              child: GestureDetector(
                onTap: widget.onTooltipTap,
                child: FadeTransition(
                  opacity: fadeInFadeOut2,
                  child: Transform.scale(
                    scale: 1.0,
                    alignment: Alignment.bottomLeft,
                    child: Center(
                      child: MeasureSize(
                        onSizeChange: onSizeChange,
                        child: Container(
                          alignment: Alignment.center,
                          width: MediaQuery.of(context).size.width,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(100),
                                bottomLeft: Radius.circular(100)),
                            color: AppColors.aliceBlue,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 50,
                              vertical: 50,
                            ),
                            child: Column(
                              children: [
                                Text(
                                  widget.description ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: AppColors.black,
                                        fontWeight: FontWeight.w500,
                                      ),
                                  textAlign: TextAlign.start,
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    widget.showSkipButton
                                        ? Row(
                                            children: [
                                              IconButton(
                                                onPressed: () =>
                                                    ShowCaseWidget.of(widget
                                                            .showCaseContext)
                                                        .dismiss(),
                                                icon: Text(
                                                  'Skip',
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .buttonTextInActive
                                                      ?.copyWith(
                                                        fontWeight:
                                                            FontWeight.w900,
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                        decorationColor:
                                                            AppColors.steelTeal,
                                                      ),
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                            ],
                                          )
                                        : const SizedBox.shrink(),
                                    IconButton(
                                      onPressed: () => ShowCaseWidget.of(
                                              widget.showCaseContext)
                                          .next(),
                                      icon: Row(
                                        children: [
                                          Text(
                                            widget.buttonText,
                                            style: Theme.of(context)
                                                .textTheme
                                                .buttonTextInActive
                                                ?.copyWith(
                                                  fontWeight: FontWeight.w900,
                                                ),
                                          ),
                                          const Icon(
                                            Icons.arrow_forward_rounded,
                                            color: AppColors.steelTeal,
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          Positioned(
            top: contentY + 100,
            left: _getSpace(),
            child: ScaleTransition(
              scale: _scaleAnimation,
              alignment: widget.scaleAnimationAlignment ??
                  Alignment(
                    _getAlignmentX(),
                    _getAlignmentY(),
                  ),
              child: FractionalTranslation(
                translation: Offset(0.0, contentFractionalOffset as double),
                child: ToolTipSlideTransition(
                  position: Tween<Offset>(
                    begin: Offset.zero,
                    end: Offset(
                      0,
                      widget.toolTipSlideEndDistance * contentOffsetMultiplier,
                    ),
                  ).animate(_movingAnimation),
                  child: Material(
                    type: MaterialType.transparency,
                    child: Stack(
                      alignment: isArrowUp
                          ? Alignment.topLeft
                          : _getLeft() == null
                              ? Alignment.bottomRight
                              : Alignment.bottomLeft,
                      children: [
                        GestureDetector(
                          onTap: widget.onTooltipTap,
                          child: Transform.scale(
                            scale: 1.0,
                            child: Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: AppColors.ghostWhite.withOpacity(0.7),
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.width,
                              // padding: widget.tooltipPadding,
                              child: Center(
                                child: MeasureSize(
                                  onSizeChange: onSizeChange,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 50,
                                      vertical: 50,
                                    ),
                                    child: Center(
                                      child: Text(
                                        widget.description ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium
                                            ?.copyWith(
                                              color: AppColors.black,
                                              fontWeight: FontWeight.w500,
                                            ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }
  }

  void onSizeChange(Size? size) {
    var tempPos = position;
    tempPos = Offset(position!.dx, position!.dy + size!.height);
    setState(() => position = tempPos);
  }

  Size _textSize(String text, TextStyle style) {
    final textPainter = TextPainter(
      text: TextSpan(text: text, style: style),
      maxLines: 1,
      // TODO: replace this once we support sdk v3.12.
      // ignore: deprecated_member_use
      textScaleFactor: MediaQuery.of(context).textScaleFactor,
      textDirection: TextDirection.ltr,
    )..layout();
    return textPainter.size;
  }

  double? _getArrowLeft(double arrowWidth) {
    final left = _getLeft();
    if (left == null) return null;
    return (widget.position!.getCenter() - (arrowWidth / 2) - left);
  }

  double? _getArrowRight(double arrowWidth) {
    if (_getLeft() != null) return null;
    return (widget.screenSize.width - widget.position!.getCenter()) -
        (_getRight() ?? 0) -
        (arrowWidth / 2);
  }
}

class _Arrow extends CustomPainter {
  final Color strokeColor;
  final PaintingStyle paintingStyle;
  final double strokeWidth;
  final bool isUpArrow;
  final Paint _paint;

  _Arrow({
    this.strokeColor = Colors.black,
    this.strokeWidth = 3,
    this.paintingStyle = PaintingStyle.stroke,
    this.isUpArrow = true,
  }) : _paint = Paint()
          ..color = strokeColor
          ..strokeWidth = strokeWidth
          ..style = paintingStyle;

  @override
  void paint(Canvas canvas, Size size) {
    canvas.drawPath(getTrianglePath(size.width, size.height), _paint);
  }

  Path getTrianglePath(double x, double y) {
    if (isUpArrow) {
      return Path()
        ..moveTo(0, y)
        ..lineTo(x / 2, 0)
        ..lineTo(x, y)
        ..lineTo(0, y);
    }
    return Path()
      ..moveTo(0, 0)
      ..lineTo(x, 0)
      ..lineTo(x / 2, y)
      ..lineTo(0, 0);
  }

  @override
  bool shouldRepaint(covariant _Arrow oldDelegate) {
    return oldDelegate.strokeColor != strokeColor ||
        oldDelegate.paintingStyle != paintingStyle ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
