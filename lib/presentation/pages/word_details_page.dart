import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:word_study_puzzle/injection_container.dart';
import 'package:word_study_puzzle/presentation/bloc/bloc_word_details/word_details_bloc.dart';
import 'package:word_study_puzzle/presentation/widgets/app_carousel.dart';
import 'package:word_study_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:word_study_puzzle/presentation/widgets/app_progress_indicator.dart';
import 'package:word_study_puzzle/presentation/widgets/app_text_border.dart';

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

  Future _speak(String text) async{
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
                  return Center(child: AppProgressIndicator());
                }, loaded: (word, index) {
                  return SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 120,
                        ),
                        if(word.imageLinksList.isNotEmpty)
                        AppImageCarousel(
                          pageCallback: (int page) {
                            bloc.add(ChangeImage(page));
                          },
                          imagesUrl: word.imageLinksList,
                          initPage: widget.indexUrl ?? 0,
                          activePage: index,
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(top: 40, bottom: 5),
                          child: const Text(
                            'Definitions',
                            style: TextStyle(
                                fontSize: 18,
                                fontFamily: "OpenSans",),
                          ),
                          alignment: Alignment.center,
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
                          padding:
                              const EdgeInsets.only(top: 20, bottom: 5),
                          child: Text(
                            word.examplesList.isNotEmpty ? 'Examples' : '',
                            style: const TextStyle(
                                fontSize: 18,
                                fontFamily: "OpenSans",),
                          ),
                          alignment: Alignment.center,
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
                Positioned(
                  left: 20,
                  top: 40,
                  child: AppSmallFloatingActionButton(
                    callback: (){_speak(widget.title);},
                    icon: Icons.volume_up,
                  ),
                ),
                Positioned(
                  top: 55,
                  child: AppTextBorder(
                    title: widget.title.capitalize(),
                  ),
                ),
                Positioned(
                  right: 20,
                  top: 40,
                  child: AppSmallFloatingActionButton(
                    callback: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icons.close,
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
