import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:words_3000_puzzle/common/constants/widget_keys.dart';
import 'package:words_3000_puzzle/domain/models/category.dart';
import 'package:words_3000_puzzle/presentation/pages/categories_page.dart';
import 'package:words_3000_puzzle/presentation/widgets/app_floating_action_buttons.dart';
import 'package:words_3000_puzzle/presentation/widgets/app_text_border.dart';
import 'package:words_3000_puzzle/presentation/widgets/app_text_field.dart';
import 'package:words_3000_puzzle/presentation/widgets/categories/categories.dart';
import 'package:words_3000_puzzle/presentation/widgets/categories/categories_bottom_appbar.dart';

import '../../app_test.dart';

class OnChangeItemMockFunction extends Mock implements Function {
  void call(String title, int index);
}

class OnButtonMockFunction extends Mock implements Function {
  void call();
}

void main() {
  setUpAll(AppTest.setUp);

  testWidgets("Categories page golden test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));

    await expectLater(find.byType(CategoriesPage),
        matchesGoldenFile('snapshots/categories_page.png'));
  });

  testWidgets("Golden test", (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));

    await tester.pumpAndSettle();
    final btnTopic = find.byKey(const Key('topic'));
    final btnStore = find.byKey(const Key(WidgetKeys.shopButtonKey));
    await tester.tap(btnStore);
    await tester.pump();

    expect(find.byKey(const Key(WidgetKeys.shopButtonKey)), findsOneWidget);
  });

  group('CategoriesBottomAppBar', () {
    testWidgets('Should render the CategoriesBottomAppBar',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(CategoriesBottomAppBar), findsOneWidget);
    });
    testWidgets('Should call the floatingActionButton callback',
        (WidgetTester tester) async {
      final categoriesCallback = OnButtonMockFunction();
      final shopCallback = OnButtonMockFunction();

      final bottomAppBar = CategoriesBottomAppBar(
        shopCallback: shopCallback,
        isShop: false,
        categoriesCallback: categoriesCallback,
      );
      await tester.pumpWidget(MaterialApp(
        home: Scaffold(body: bottomAppBar,)
      ));

      final btnCategories = find.byKey(const Key(WidgetKeys.categoriesButtonKey));
      final btnShop = find.byKey(const Key(WidgetKeys.shopButtonKey));
      await tester.tap(btnCategories);
      await tester.tap(btnShop);
      await tester.pump();
      verify(categoriesCallback()).called(1);
      verify(shopCallback()).called(1);
    });
  });

  group('CategoriesListView', () {
    testWidgets('Should not render the CategoriesListView',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(CategoriesListView), findsNothing);
    });
    testWidgets('Should call to change item in the collection',
        (WidgetTester tester) async {
      final callback = OnChangeItemMockFunction();
      final List<Category> categoryList = [
        Category(title: "title 1"),
        Category(title: "title 2"),
      ];
      final categoriesListView = CategoriesListView(
        selectedIndex: 0,
        categoryList: categoryList,
        isShop: false,
        callback: callback,
      );
      await tester.pumpWidget(MaterialApp(
        home: Material(child: categoriesListView),
      ));
      expect(categoriesListView.categoryList, orderedEquals(categoryList));
      await tester.tap(find.byKey(const Key('title 2')));
      await tester.pumpAndSettle();
      verify(callback('title 2', 1)).called(1);
    });
  });

  group('AppFloatingActionButton', () {
    testWidgets('Should render the AppFloatingActionButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(AppFloatingActionButton), findsOneWidget);
    });
    testWidgets('Should call the floatingActionButton callback',
        (WidgetTester tester) async {
      final callback = OnButtonMockFunction();
      final button = AppFloatingActionButton(
        key: const Key('test_key'),
        callback: callback,
      );
      await tester.pumpWidget(MaterialApp(
        home: Material(child: button),
      ));
      await tester.tap(find.byKey(
        const Key('test_key'),
      ));
      await tester.pumpAndSettle();
      verify(callback()).called(1);
    });
  });

  group('AppSmallFloatingActionButton', () {
    testWidgets('Should render two the AppSmallFloatingActionButton',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(AppSmallFloatingActionButton), findsNWidgets(2));
    });
    testWidgets('Should call the smallFloatingActionButton callback',
        (WidgetTester tester) async {
      final callback = OnButtonMockFunction();
      final button = AppSmallFloatingActionButton(
        key: const Key('test_key'),
        callback: callback,
      );
      await tester.pumpWidget(MaterialApp(
        home: Material(child: button),
      ));
      await tester.tap(find.byKey(
        const Key('test_key'),
      ));
      await tester.pumpAndSettle();
      verify(callback()).called(1);
    });
  });

  group('AppTextField', () {
    testWidgets('Should render the AppTextField', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(AppTextField), findsOneWidget);
    });
    testWidgets('Should get entered text in the TextField',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      final textField = find.byType(TextField);
      await tester.enterText(textField, 'simple text');
      await tester.pump();
      expect(find.text('simple text'), findsOneWidget);
    });
  });

  group('AppTextBorder', () {
    testWidgets('Should not render AppTextBorder', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(AppTextBorder), findsOneWidget);
    });
  });

  group('CategoriesStarCount', () {
    testWidgets('Should not render CategoriesStarCount',
        (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(CategoriesStarCount), findsNothing);
    });
  });

  group('Flow', () {
    testWidgets('Should not render Flow', (WidgetTester tester) async {
      await tester.pumpWidget(const MaterialApp(home: CategoriesPage()));
      expect(find.byType(Flow), findsNothing);
    });
  });
}
