// File: {{name.snakeCase()}}_screen.dart
import 'package:flutter/material.dart';

// static const String {{name.camelCase()}} = "/{{name.snakeCase()}}_screen.dart";
// GetPage(name: {{name.camelCase()}}, page: () => const {{name.pascalCase()}}Screen()),

class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body:  Container(child: const Text('{{name.pascalCase()}}Screen')));

}