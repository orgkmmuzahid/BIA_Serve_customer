// File: {{name.snakeCase()}}_screen.dart
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

//  AutoRoute(page: {{name.pascalCase()}}Route.page),

@RoutePage()
class {{name.pascalCase()}}Screen extends StatelessWidget {
  const {{name.pascalCase()}}Screen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
    body:  Container(child: const Text('{{name.pascalCase()}}Screen')));

}
