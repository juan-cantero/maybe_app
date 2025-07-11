import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:maybe_app/config/theme/app_theme.dart';
import 'package:maybe_app/presentation/providers/chat_provider.dart';
import 'package:maybe_app/presentation/screens/chat/chat_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (_) => ChatProvider())],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Maybe App',
        theme: AppTheme(selectedColor: AppColorTheme.deepOrange).theme(),
        home: ChatScreen(),
      ),
    );
  }
}
