import 'package:flutter/material.dart';
import '../../static/asset_strings.dart';

class BackGroundWidget extends StatelessWidget {
  final BuildContext context;
  final Widget widget;
  const BackGroundWidget({
    super.key,
    required this.context,
    required this.widget,
  });

  @override
  Widget build(context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                AssetStrings.red_black_bg,
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20),
        ),
        Container(
          color: Colors.black.withOpacity(0.3),
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: widget,
        )
      ],
    );
  }
}
