import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_word_details/word_details_bloc.dart';
import 'package:word_study_puzzle/presentation/utils/string_extension.dart';
import 'package:word_study_puzzle/presentation/widgets/global/global.dart';
import 'package:word_study_puzzle/presentation/widgets/word_details/word_details.dart';

class WordDetailsPage extends StatelessWidget {
  final BuildContext blocContext;
  final String title;
  final int? indexUrl;

  const WordDetailsPage({
    Key? key,
    required this.blocContext,
    required this.title,
    this.indexUrl,
  }) : super(key: key);

  static MaterialPageRoute<void> route(
          BuildContext context, String title, int? indexUrl) =>
      MaterialPageRoute(
        builder: (_) => WordDetailsPage(
          blocContext: context,
          title: title,
          indexUrl: indexUrl,
        ),
      );

  @override
  Widget build(BuildContext context) {
    return BlocProvider<WordDetailsBloc>(
      create: (_) => sl<WordDetailsBloc>(),
      child: _ItemDetailsScreen(
        title: title,
        indexUrl: indexUrl,
      ),
    );
  }
}

class _ItemDetailsScreen extends StatefulWidget {
  final String title;
  final int? indexUrl;

  const _ItemDetailsScreen({
    Key? key,
    required this.title,
    this.indexUrl,
  }) : super(key: key);

  @override
  _ItemDetailsScreenState createState() => _ItemDetailsScreenState();
}

class _ItemDetailsScreenState extends State<_ItemDetailsScreen> {
  FlutterTts flutterTts = FlutterTts();

  Future _speak(String text) async {
    await flutterTts.speak(text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WordDetailsBloc, WordDetailsState>(
        builder: (context, state) {
          final bloc = BlocProvider.of<WordDetailsBloc>(context);
          return SizedBox.expand(
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                state.when(initState: () {
                  bloc.add(FetchWord(widget.title));
                  return Container();
                }, loading: () {
                  return const Center(child: AppCircularProgressIndicator());
                }, loaded: (word, index) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        if (word.imageUrlList.isNotEmpty)
                          ImageCarousel(
                            pageCallback: (int page) {
                              bloc.add(ChangeImage(page));
                            },
                            imagesUrl: word.imageUrlList,
                            initPage: widget.indexUrl ?? 0,
                            activePage: index,
                          ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 40, bottom: 5, left: 40),
                          child: const Text(
                            'Definitions',
                            style: TextStyle(
                              fontSize: 18,
                              fontFamily: "Verdana",
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        for (int i = 0; i < word.definitionList.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 40.0),
                            child: Text(
                              "${i + 1}. ${word.definitionList[i].capitalize()}",
                              style: const TextStyle(
                                  fontSize: 15, fontFamily: "Verdana"),
                            ),
                          ),
                        Container(
                          padding: const EdgeInsets.only(
                              top: 20, bottom: 5, left: 40),
                          child: Text(
                            word.examplesList.isNotEmpty ? 'Examples' : '',
                            style: const TextStyle(
                              fontSize: 18,
                              fontFamily: "Verdana",
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                        ),
                        for (int i = 0; i < word.examplesList.length; i++)
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 3, horizontal: 40.0),
                            child: Text(
                              "${i + 1}. ${word.examplesList[i].capitalize()}",
                              style: const TextStyle(
                                  fontSize: 15, fontFamily: "Verdana"),
                            ),
                          ),
                        const SizedBox(
                          height: 30,
                        )
                      ],
                    ),
                  );
                }, error: (message) {
                  return Container();
                }),
                _buildPlayButton(),
                _buildLabel(),
                _buildBackButton(),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildBackButton() {
    return Positioned(
      left: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        callback: () {
          Navigator.of(context).pop();
        },
        icon: Icons.arrow_back_ios_sharp,
      ),
    );
  }

  Widget _buildPlayButton() {
    return Positioned(
      right: 20,
      top: 40,
      child: AppSmallFloatingActionButton(
        callback: () {
          _speak(widget.title);
        },
        icon: Icons.volume_up,
      ),
    );
  }

  Widget _buildLabel() {
    return Positioned(
      top: 50,
      child: TextBorder(
        title: widget.title.capitalize(),
      ),
    );
  }
}

