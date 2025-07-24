import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DualFieldRow extends StatelessWidget {

  const DualFieldRow({
    required this.left, required this.right, super.key,
    this.enableSpacer = true,
    this.space = 10,
  });
  final Widget left;
  final Widget right;
  final bool enableSpacer;
  final double space;

  @override
  Widget build(BuildContext context) {
    return (enableSpacer? _withSpacer() : _withoutSpacer()).paddingOnly(bottom: 10);
  }

  Row _withoutSpacer(){
        return Row(
    children: [
      left,
      SizedBox(width: space),
      Expanded(child: right),
    ],
  );
  }

  Row _withSpacer() {
    return Row(
    children: [
      Expanded(child: left),
      SizedBox(width: space),
      Expanded(child: right),
    ],
  );
  }
}
