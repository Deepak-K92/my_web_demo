import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_web_demo/common/styles/styles.dart';

class Custom2ColorsButtonWidget extends StatefulWidget {
  final Color primary;
  final Color secondary;
  final Color textColor;
  final Size size;
  final String text;
  final Function() onPressed;
  const Custom2ColorsButtonWidget(
      {super.key,
      required this.primary,
      required this.secondary,
      required this.textColor,
      required this.size,
      required this.text,
      required this.onPressed});

  @override
  State<Custom2ColorsButtonWidget> createState() =>
      _Custom2ColorsButtonWidgetState();
}

class _Custom2ColorsButtonWidgetState extends State<Custom2ColorsButtonWidget> {
  late Size size;
  @override
  void initState() {
    super.initState();
    setState(() => size = widget.size);
  }

  @override
  Widget build(BuildContext context) {
    setState(() => size = widget.size);
    // print(size.aspectRatio);
    return MaterialButton(
      onPressed: widget.onPressed,
      elevation: 3,
      color: widget.primary,
      splashColor: Colors.redAccent,
      padding: EdgeInsets.symmetric(
          vertical: size.height * 0.010, horizontal: size.width * .05),
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(size.aspectRatio * 50),
          side: BorderSide(color: widget.secondary)),
      child: Padding(
        padding: EdgeInsets.all(size.aspectRatio * 3),
        child: Text(
          widget.text,
          textAlign: TextAlign.center,
          style:
              TextStyle(color: widget.textColor, fontSize: size.width * 0.020)
                  .setGFont(style: GoogleFonts.artifika()),
        ),
      ),
    );
  }
}
