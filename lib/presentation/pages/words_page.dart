import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:words_3000_puzzle/domain/models/word.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_words/words_bloc.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_words/words_event.dart';
import 'package:words_3000_puzzle/presentation/bloc/bloc_words/words_state.dart';

import '../../injection_container.dart';

class WordsPage extends StatefulWidget {
  const WordsPage({Key? key}) : super(key: key);

  @override
  _WordsPageState createState() => _WordsPageState();
}

class _WordsPageState extends State<WordsPage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<WordsBloc>(
      create: (context) => sl<WordsBloc>(),
      child: BlocBuilder<WordsBloc, WordsState>(
        builder: (context, state) {
          return Scaffold(
              appBar: AppBar(
                actions: [
                  IconButton(
                    icon: const Icon(Icons.update),
                    onPressed: () {
                      BlocProvider.of<WordsBloc>(context).add(FetchAllWords());
                    },
                  ),
                ],
              ),
              floatingActionButton: FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () {
                    BlocProvider.of<WordsBloc>(context)
                        .add(AddWord("Hello Hive"));
                  }),
              body: state.when(
                initState: () {
                  return Center(child: Text("initState"));
                },
                loading: () {
                  return Center(child: CircularProgressIndicator());
                },
                content: (listOfWords) {
                  //return Center(child: Text("content"));
                  return _mainContainer(listOfWords);
                },
                error: () {
                  return Center(child: Text("error"));
                },
              ));
        },
      ),
    );
  }

  SizedBox _mainContainer(List<Word> listOfWords) {
    return SizedBox.expand(
        child: BlocBuilder<WordsBloc, WordsState>(builder: (context, state) {
      return ListView.builder(
        itemCount: listOfWords.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(listOfWords[index].title),
          );
        },
      );
    }));
  }
}
