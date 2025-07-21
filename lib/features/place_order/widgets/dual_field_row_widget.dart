import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DualFieldRow extends StatelessWidget {

  const DualFieldRow({
    required this.left, required this.right, super.key,
    this.space = 10,
  });
  final Widget left;
  final Widget right;
  final double space;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: left),
        SizedBox(width: space),
        Expanded(child: right),
      ],
    ).paddingOnly(bottom: 10);
  }
}
