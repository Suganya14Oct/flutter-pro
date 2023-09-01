import 'package:flutter/material.dart';
import 'package:protutorial/theme/theme_changer_provider.dart';
import 'package:provider/provider.dart';

class DarkThemeScreen extends StatefulWidget {
  const DarkThemeScreen({super.key});

  @override
  State<DarkThemeScreen> createState() => _DarkThemeScreenState();
}

class _DarkThemeScreenState extends State<DarkThemeScreen> {
  @override
  Widget build(BuildContext context) {
    final themechanger = Provider.of<ThemeChangerPro>(context);
    return Scaffold(
      appBar: AppBar(title: Text("Themes"),),
      body: Column(
        children: [
          RadioListTile<ThemeMode>(
            title: Text('Light Mode'),
              value: ThemeMode.light,
              groupValue: themechanger.themeMode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text('Dark Mode'),
              value: ThemeMode.dark,
              groupValue: themechanger.themeMode,
              onChanged: themechanger.setTheme),
          RadioListTile<ThemeMode>(
              title: Text('System Mode'),
              value: ThemeMode.system,
              groupValue: themechanger.themeMode,
              onChanged: themechanger.setTheme),
          Icon(Icons.favorite)
        ],
      ),
    );
  }
}
