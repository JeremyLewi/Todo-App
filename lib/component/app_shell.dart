import 'package:flutter/material.dart';

class AppShell extends StatelessWidget {
  final String title;
  final Widget child;
  final Widget? floatingActionButton;
  const AppShell({
    Key? key,
    required this.title,
    required this.child,
    this.floatingActionButton,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: child,
      ),
      floatingActionButton: floatingActionButton,
    );
  }
}
