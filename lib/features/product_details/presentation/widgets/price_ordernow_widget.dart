import 'package:flutter/material.dart';

class PriceOrderNowWidget extends StatelessWidget {
  const PriceOrderNowWidget({
    required this.text,
    required this.textStyle,
    required this.buttonColor,
    required this.horizontalPaddingSize,
    required this.onPressed,
    super.key,
  });
  final String text;
  final TextStyle textStyle;
  final Color buttonColor;
  final double horizontalPaddingSize;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) => IconButton(
    style: IconButton.styleFrom(
      backgroundColor: buttonColor,
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPaddingSize,
        vertical: 20,
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
    ),
    onPressed: onPressed,
    icon: Text(text, style: textStyle),
  );
}
