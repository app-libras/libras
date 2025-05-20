import 'package:flutter/material.dart';

/// A widget that displays a user's score along with an image.
///
/// This widget displays a column of an image, a text, and another text.
/// The image and the first text are displayed in the center of the column.
/// The second text is displayed with a bold font style.
///
/// The `text` parameter is the text to be displayed in the second text.
/// The `points` parameter is the score of the user.
/// The `imageLink` parameter is the link to the image file.
/// The `fontSize` and `imageHeight` and `imageWidth` parameters are optional
/// and are used to customize the appearance of the widget.
///
/// This class is a stateless widget, so it does not have a [build] method.
/// It is created with a [UserScore] constructor and is used in the [lib/screens/home.dart] file.
class ScoreWidget extends StatelessWidget {
  /// The text to be displayed in the second text.
  final String text;

  /// The score of the user.
  final int points;

  /// The link to the image file.
  final String imageLink;

  /// The font size of the second text.
  ///
  /// Defaults to 20.
  final double? fontSize;

  /// The height of the image.
  ///
  /// The width of the image.
  ///
  /// Defaults to 40.
  final double? imageSize;

  final Color? decorationColor;
  final BorderRadius? borderRadius;
  final EdgeInsets? margin;

  /// Creates a [ScoreWidget] widget.
  ///
  /// The [key] parameter is optional and defaults to [null].
  const ScoreWidget({
    super.key,
    required this.text,
    required this.points,
    required this.imageLink,
    this.fontSize,
    this.imageSize,
    this.decorationColor,
    this.borderRadius,
    this.margin,
  });

  /// Builds a [Widget] that displays a user's score along with an image.
  ///
  /// This method returns a [Column] widget with three children:
  /// - The first child is an [Image] widget displaying the image.
  /// - The second child is a [Text] widget displaying the first text.
  /// - The third child is a [Text] widget displaying the second text.
  /// The image and the first text are displayed in the center of the column.
  /// The second text is displayed with a bold font style.
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin ?? const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: decorationColor ?? Theme.of(context).colorScheme.secondary,
        borderRadius: borderRadius ?? BorderRadius.circular(15),
      ),
      width: 170,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Image.asset(
            imageLink,
            height: imageSize ?? 40,
            width: imageSize ?? 40,
          ),
          Text(
            text,
            style: TextStyle(
              // color: Theme.of(context).colorScheme.tertiary,
              fontSize: fontSize ?? 20,
            ),
          ),
          Text(
            '$points',
            style: TextStyle(
              fontSize: fontSize ?? 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
