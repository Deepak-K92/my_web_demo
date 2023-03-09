import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class Dash1 extends StatefulWidget {
  const Dash1({super.key});

  @override
  State<Dash1> createState() => _Dash1State();
}

class _Dash1State extends State<Dash1> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4,
        childAspectRatio: 2,
      ),
      itemCount: 8,
      itemBuilder: (context, index) {
        return Card(
          child: Center(child: Text("${index + 1}")),
        );
      },
    );
  }
}
