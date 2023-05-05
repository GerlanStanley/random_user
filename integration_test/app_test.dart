import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:user/app/core/widgets/cached_network_image_widget.dart';

import 'package:user/main.dart' as app;

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets(
    'Verificar se carregou um perfil aleatório',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 4));
      await tester.pumpAndSettle();

      final movieItemComponent = find.byType(CachedNetworkImageWidget);

      expect(movieItemComponent, findsOneWidget);
    },
  );

  testWidgets(
    'Salvar perfil e verificar se aparece na listagem',
    (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 4));
      await tester.pumpAndSettle();

      final saveButton = find.byKey(const Key('save_button'));
      await tester.tap(saveButton);
      await tester.pumpAndSettle();

      await Future.delayed(const Duration(seconds: 2));
      await tester.pumpAndSettle();

      final listButton = find.byKey(const Key('list_button'));
      await tester.tap(listButton);
      await tester.pumpAndSettle();

      var listView = find.byType(ListView).evaluate().single.widget as ListView;

      expect(listView.semanticChildCount, greaterThanOrEqualTo(1));
    },
  );
}
