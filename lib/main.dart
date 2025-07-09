import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Maybe App',
      home: Scaffold(
        appBar: AppBar(title: const Text('app bar')),
        body: Center(
          child: FilledButton.tonal(
            onPressed: () => {},
            child: Text('click me'),
          ),
        ),
      ),
    );
  }
}
