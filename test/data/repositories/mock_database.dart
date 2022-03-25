import 'package:mockito/mockito.dart';
import 'package:word_study_puzzle/domain/datasources/local/database.dart';



class MockDatabase extends Mock implements Database {


  // MockDatabase(){
  //   when(() => delete('')).thenAnswer((_) => () => Future.value(0));
  // }

  @override
  T get<T>(String id, {T? defaultValue}) =>
      (super.noSuchMethod(
          Invocation.method(#get, [id], {#defaultValue: defaultValue})) as T);


}