import 'package:flutter/material.dart';
import 'package:maybe_app/config/theme/app_theme.dart';
import 'package:maybe_app/presentation/screens/chat/chat_screen.dart';

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
      theme: AppTheme(selectedColor: AppColorTheme.deepOrange).theme(),
      home: ChatScreen(),
    );
  }
}
