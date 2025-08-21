import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({required this.builder, super.key});

  final Widget Function(BuildContext context, GlobalKey<FormState> formKey) builder;

  @override
  _CustomFormState createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  late GlobalKey<FormState> _formKey;

  @override
  void initState() {
    super.initState();
    _formKey = GlobalKey<FormState>();
  }

  @override
  Widget build(BuildContext context) {
    return Form(key: _formKey, child: widget.builder(context, _formKey));
  }
}
