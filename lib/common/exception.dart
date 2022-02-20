import 'package:freezed_annotation/freezed_annotation.dart';

part 'exception.freezed.dart';

@freezed
abstract class AppException implements Exception, _$AppException {
  factory AppException.noRecords() = NoRecordsException;
  factory AppException.empty(String message) = EmptyException;
  factory AppException.failedToParse() = FailedToParseException;
  factory AppException.nullObject() = NullObjectException;
  factory AppException.noUniqueness() = noUniquenessException;
  factory AppException.noExist() = NoExistException;
  factory AppException.server() = ServerException;
}
