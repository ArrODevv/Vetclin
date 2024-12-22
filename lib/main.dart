import 'package:flutter/material.dart';
import 'package:vetclin/ui/overview_page.dart';

import 'l10n/generated/app_localizations.dart';

import 'settings.dart';
import 'ui/date_time_card.dart';

Future<void> main() async {
  Settings.instance.loadData();
  
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vetclin',
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData.light(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
      ),
      darkTheme: ThemeData.dark(useMaterial3: true).copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.amber,
          brightness: Brightness.dark,
        ),
      ),
      locale: Settings.instance.selectedLocale,
      themeMode: Settings.instance.selectedTheme,
      home: const MyContentPage(title: 'Vetclin'),
    );
  }
}

class MyContentPage extends StatefulWidget {
  const MyContentPage({super.key, required this.title});

  final String title;

  @override
  State<MyContentPage> createState() => _MyContentPageState();
}

class _MyContentPageState extends State<MyContentPage> {
  int _selectedNavigationIndex = 0;
  // ignore: prefer_final_fields
  bool _navigationRailExtended = true;
  bool _aboutButtonHovered = false;
  
  IconData _menuIcon = Icons.menu;
  
  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);
    
    final navigationDrawerTextStyle = TextStyle(
      fontFamily: currentTheme.textTheme.bodyMedium?.fontFamily,
      fontSize: currentTheme.textTheme.bodyMedium?.fontSize,
    );
    
    if(_navigationRailExtended) {
      setState(() {
        _menuIcon = Icons.menu_open;
      });
    } else {
      setState(() {
        _menuIcon = Icons.menu;
      });
    }
    
    TextDecoration aboutTextDecoration;
    Color aboutTextColor;
    
    if(_aboutButtonHovered) {
      aboutTextDecoration = TextDecoration.underline;
      aboutTextColor = Colors.lightBlue;
    } else {
      aboutTextDecoration = TextDecoration.none;
      aboutTextColor = Colors.blueAccent;
    }
    
    return Scaffold(
      body: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SafeArea(
            child: NavigationRail( 
              destinations: [
                NavigationRailDestination(
                  label: Text(AppLocalizations.of(context)!.overview),
                  icon: Icon(Icons.home),
                ),
                NavigationRailDestination(
                  label: Text(AppLocalizations.of(context)!.calendar),
                  icon: Icon(Icons.calendar_month),
                  disabled: true, // not yet implemented
                ),
                NavigationRailDestination(
                  label: Text(AppLocalizations.of(context)!.settings),
                  icon: Icon(Icons.settings),
                ),
              ],
              elevation: Theme.of(context).navigationRailTheme.elevation,
              selectedLabelTextStyle: navigationDrawerTextStyle,
              unselectedLabelTextStyle: navigationDrawerTextStyle,
              leading: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _navigationRailExtended = !_navigationRailExtended;
                      });
                    },
                    icon: Icon(_menuIcon),
                  ),
  
                  if(_navigationRailExtended)
                    DateTimeCard(
                      timeToDisplay: DateTime(2000, 1, 1),
                    ),
                ],
              ),
              trailing: _navigationRailExtended == false ? null : TextButton(
                onPressed: () {
                  // TODO:
                  // somehow open `about` dialog.
                },
                onHover: (value) {
                  if(_aboutButtonHovered != value) {
                    setState(() {
                      _aboutButtonHovered = value;
                    });
                  }
                },
                child: Text(
                  AppLocalizations.of(context)!.about,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: aboutTextColor,
                    decoration: aboutTextDecoration,
                    decorationColor: aboutTextColor,
                  ),
                ),
              ),
              selectedIndex: _selectedNavigationIndex,
              onDestinationSelected: (value) {
                setState(() {
                  if(value != _selectedNavigationIndex) {
                    _selectedNavigationIndex = value;
                  }
                });
              },
              extended: _navigationRailExtended,
            ),
          ),
          
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: switch(_selectedNavigationIndex) {
                  0 => const OverviewPage(),
                  1 => Text('page 2'),
                  2 => Text('page 3'),
                  _ => Text('invalid')
                },
              ),
            ),
          ),
        ]
      ),
    );
  }
}
