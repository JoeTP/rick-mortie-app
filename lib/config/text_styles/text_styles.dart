import 'package:flutter/material.dart';

class TitleText extends StatelessWidget {
  Color color;
  double fontSize;
  TextOverflow overflow;
  FontWeight fontWeight;
  String text;
  // String font;

  TitleText({
    Key? key,
    this.color = Colors.white,
    this.fontSize = 34,
    this.overflow = TextOverflow.ellipsis,
    this.fontWeight = FontWeight.bold,
    // this.font = 'Catamaran',
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          // fontFamily: font,
          overflow: overflow,
          fontWeight: fontWeight,
        ));
  }
}

class MediumText extends StatelessWidget {
  Color color;
  double fontSize;
  int? maxLines;
  TextOverflow overflow;
  String text;
  // String font;
  FontWeight? fontWeight;

  MediumText({
    Key? key,
    this.color = Colors.white,
    this.fontSize = 20,
    this.maxLines,
    this.overflow = TextOverflow.ellipsis,
    // this.font = 'Catamaran',
    this.fontWeight,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          // fontFamily: font,
          overflow: overflow,
          fontWeight: fontWeight,
        ));
  }
}

class SmallText extends StatelessWidget {
  Color color;
  double fontSize;
  TextOverflow? overflow;
  String text;
  // String font;
  int? maxLines;

  SmallText({
    Key? key,
    this.color = Colors.grey,
    this.fontSize = 16,
    this.overflow,
    // this.font = 'Catamaran',
    this.maxLines,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,
        maxLines: maxLines,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          // fontFamily: font,
          overflow: overflow,
        ));
  }
}
