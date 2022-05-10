import 'dart:async';

class ThemeSwitcher {
  final themeStreamController = StreamController<bool>();

  get changeTheTheme => themeStreamController.sink.add;
  get darkThemeIsEnabled => themeStreamController.stream;
}