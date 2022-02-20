import 'package:dartz/dartz.dart';
import 'package:words_3000_puzzle/common/constants/box_keys.dart';
import 'package:words_3000_puzzle/data/dto/settings_dto.dart';
import 'package:words_3000_puzzle/domain/models/error.dart';
import 'package:words_3000_puzzle/domain/models/settings.dart';
import 'package:words_3000_puzzle/domain/models/success.dart';
import 'package:words_3000_puzzle/domain/repositories/settings_repository.dart';

class UpdateSettingsUsecase {
  final SettingsRepository repository;
  UpdateSettingsUsecase(this.repository);

  Future<Either<Error, Success>> call(Settings settings) async {
    try {
      await repository.updateSettings(BoxKeys.settings, SettingsDto.fromDomain(settings));
      return right(Success(message: 'Settings successfully update!'));
    } catch (e) {
      return left(
        Error(message: 'Failed to update settings'),
      );
    }
  }
}

