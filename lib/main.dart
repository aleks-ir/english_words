import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_3000_puzzle/common/constants/box_names.dart';
import 'package:words_3000_puzzle/data/dto/history_dto.dart';
import 'package:words_3000_puzzle/presentation/pages/home_page.dart';

import 'common/constants/box_keys.dart';
import 'data/dto/settings_dto.dart';
import 'data/dto/word_dto.dart';
import 'injection_container.dart' as di;
import 'local_data.dart';

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
  await Hive.openBox(BoxNames.history);
  await Hive.openBox(BoxNames.categories);
  await Hive.openBox(BoxNames.settings).then((box) => initLocalData(box));
}

void initLocalData(Box settingsBox) async {
  final settings = settingsBox.get(BoxKeys.settings) as SettingsDto;
  if (!settings.hasLocalData) {
    di.sl<LocalData>().init();
    settingsBox.put(BoxKeys.settings, settings.copyWith(hasLocalData: true));
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
    Hive.box(BoxNames.categories).compact();
    Hive.box(BoxNames.history).compact();
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
