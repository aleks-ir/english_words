import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';

import '../../../fixtures/fixture_reader.dart';


void main() {

  final List<dynamic> tMap = [
     "word 1",
     "word 2",
     "word 3",
     "word 4",
     "word 5"
  ];

  test(
    'Should return a valid model',
        () async {
      final List<dynamic> resultJsonMap =
      json.decode(fixture('data_asset.json'));

      expect(resultJsonMap, tMap);
    },
  );
}