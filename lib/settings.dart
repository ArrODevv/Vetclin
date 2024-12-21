import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
//import 'package:xml/xml.dart';
import 'package:toml/toml.dart';

/// The locale selected
enum LocaleSelection {
  en,
  de,
  /// Derived from system locale
  system,
}

/// The theme selected
enum ThemeSelection {
  dark,
  light,
  /// Derived from system theme
  system
}

class Settings {
  static final Settings _instance = Settings._internal();
  
  factory Settings() {
    return _instance;
  }
  
  Settings._internal();
  
  static Settings get instance {
    return _instance;
  }
  
  LocaleSelection selectedLocale = LocaleSelection.system;
  ThemeSelection selectedTheme = ThemeSelection.system;
  
  Future<String> get _appPath async {
    final directory = await getApplicationSupportDirectory();
    
    if(!await directory.exists()) {
      await directory.create(recursive: true);
    }
    
    return directory.path;
  }
  
  Future<File> get _settingsFile async {
    final path = await _appPath;
    
    final filePath = '$path/settings.toml';
    
    if(kDebugMode) {
      debugPrint(filePath);
    }
    
    return File(filePath);
  }
  
  Future<String> get _settingsFilePath async {
    final path = await _appPath;
    
    return '$path/settings.toml';
  }
  
  Future<void> saveFile() async {
    var document = TomlDocument.fromMap({
      'selected_locale': selectedLocale.name,
      'selected_theme': selectedTheme.name,
    }).toString();
    
    var file = await _settingsFile;
    
    file.writeAsString(document);
  }
  
  Future<void> loadData() async {
    final document = await TomlDocument.load(await _settingsFilePath);
    
    final settings = document.toMap();
    
    var locStr = settings['selected_locale'] ?? LocaleSelection.system.name;
    selectedLocale =  LocaleSelection.values.byName(locStr);
    
    var themeStr = settings['selected_theme'] ?? ThemeSelection.system.name;
    selectedTheme = ThemeSelection.values.byName(themeStr);
  }
}
