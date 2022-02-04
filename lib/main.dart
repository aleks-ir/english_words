import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/presentation/pages/home_page.dart';

import 'common/constants.dart';
import 'data/dto/settings_dto.dart';
import 'data/dto/word_dto.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  initHive();

  runApp(const App());
}

void initHive() async {
  await Hive.initFlutter();
  Hive.registerAdapter(WordDtoAdapter());
  Hive.registerAdapter(SettingsDtoAdapter());
  Hive.registerAdapter(HistoryDtoAdapter());
  await Hive.openBox(historyBoxName);
  await Hive.openBox(settingsBoxName).then(
    (settingsBox) async => await Hive.openBox(categoryBoxName)
        .then((wordBox) => initLocalData(settingsBox, wordBox)),
  );
}

void initLocalData(Box settingsBox, Box wordBox) async {
  final settings =
      settingsBox.get(settingsKey, defaultValue: defaultSettings);
  if (!settings.hasLocalData) {
    //wordBox.addAll(initWords);

    settingsBox.put(settingsKey, defaultSettings.copyWith(hasLocalData: true));
  }
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    Hive.box(categoryBoxName).compact();
    Hive.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return
        //MaterialApp(home: Scaffold(body: Center(child: Text('fdfgdfg')),));
        MaterialApp(home: const HomePage());
  }
}
