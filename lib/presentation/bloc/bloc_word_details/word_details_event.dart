part of 'word_details_bloc.dart';

@freezed
abstract class WordDetailsEvent with _$WordDetailsEvent {

  factory WordDetailsEvent.fetchWord(String title) = FetchWord;

  factory WordDetailsEvent.changeImage(int imageIndex) = ChangeImage;

}
