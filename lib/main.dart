import 'package:flutter/material.dart';

import 'l10n/generated/app_localizations.dart';

import 'settings.dart';

Future<void> main() async {
  Settings.instance.loadData();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Color(0xFFCC9B08)),
      ),
      themeMode: ThemeMode.dark,
      home: const MyHomePage(title: 'Test'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          children: [
            Text(AppLocalizations.of(context)!.hw),
            
            SizedBox(height: 10.0),
            
            Text('Locale: ${Settings.instance.selectedLocale}'),
            Text('Theme: ${Settings.instance.selectedTheme}'),

            SizedBox(height: 10.0),
            
            ElevatedButton(
              onPressed: () {
                Settings.instance.selectedTheme = ThemeSelection.dark;
                Settings.instance.saveFile();
              },
              child: Text('Set to dark mode'),
            ),
          ]
      ),
    );
  }
}
