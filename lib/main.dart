import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:words_3000_puzzle/presentation/pages/home_page.dart';

import 'common/constants.dart';
import 'data/dto/word_dto.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await di.init();

  await Hive.initFlutter();
  Hive.registerAdapter(WordDtoAdapter());
  await Hive.openBox(databaseBox);

  runApp(const App());
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
  Widget build(BuildContext context) {
    return
      //MaterialApp(home: Scaffold(body: Center(child: Text('fdfgdfg')),));
      MaterialApp(home: const HomePage());
  }
}
