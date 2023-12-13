import 'package:flutter/material.dart';
import 'package:flutter_app/stateManagement/provider/theme_provider.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themeMode = Provider.of<ThemeProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text("THEME CHANGER"),
      ),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: const Text("Light theme"),
            value: ThemeMode.light,
            groupValue: themeMode.themeMode,
            onChanged: themeMode.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("Dark theme"),
            value: ThemeMode.dark,
            groupValue: themeMode.themeMode,
            onChanged: themeMode.setTheme,
          ),
          RadioListTile<ThemeMode>(
            title: const Text("System theme"),
            value: ThemeMode.system,
            groupValue: themeMode.themeMode,
            onChanged: themeMode.setTheme,
          ),
        ],
      ),
    );
  }
}
