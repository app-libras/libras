import 'package:flutter/material.dart';

class AulasContainerWidget extends StatelessWidget {
  final List<Widget> children;
  final double? containerHeight;
  final double? containerWidth;
  final EdgeInsetsGeometry? containerMargin;
  final MainAxisAlignment? mainAxisAlignment;

  const AulasContainerWidget({
    super.key,
    required this.children,
    this.containerHeight,
    this.containerWidth,
    this.containerMargin,
    this.mainAxisAlignment,
  });

  @override

  /// Builds a widget that displays a row of children widgets.
  ///
  /// This widget is used to display a list of [AulaCardWidget]s.
  ///
  /// The [children] parameter is required and must be a list of widgets.
  ///
  /// The [containerHeight] and [containerWidth] parameters are optional and
  /// can be used to set the height and width of the container.
  ///
  /// The [containerMargin] parameter is optional and can be used to set the
  /// margin of the container.
  ///
  /// The [mainAxisAlignment] parameter is optional and can be used to set the
  /// main axis alignment of the row.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: containerMargin ?? const EdgeInsets.only(left: 10, right: 10),
      width: containerWidth ?? double.infinity,
      height: containerHeight ?? 200,
      child: Row(
        mainAxisAlignment: mainAxisAlignment ?? MainAxisAlignment.spaceBetween,
        children: children,
      ),
    );
  }
}
