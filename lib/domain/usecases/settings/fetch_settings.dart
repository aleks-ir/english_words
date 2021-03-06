import 'package:dartz/dartz.dart';
import 'package:word_study_puzzle/common/constants/box_keys.dart';
import 'package:word_study_puzzle/domain/models/error.dart';
import 'package:word_study_puzzle/domain/models/settings.dart';
import 'package:word_study_puzzle/domain/repositories/settings_repository.dart';

class FetchSettingsUsecase {
  final SettingsRepository repository;
  FetchSettingsUsecase(this.repository);

  Future<Either<Error, Settings>> call() async {
    try {
      final settingsDto = await repository.getSettings(BoxKeys.settings);
      return right(settingsDto.toDomain());
    } catch (e) {
      return left(
        Error(message: 'Failed to load settings'),
      );
    }

  }
}

