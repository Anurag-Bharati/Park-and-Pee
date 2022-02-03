import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:integration_test/integration_test.dart';

import '../../lib/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized()
      as IntegrationTestWidgetsFlutterBinding;

  group('map view test', () {
    testWidgets('map test', (WidgetTester tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5));
      final map = find.byType(GoogleMap);
      final dropDown = find.byKey(const Key("_dropDown"));
      await tester.longPress(map);
      await tester.pumpAndSettle();
      final listFinder = find.byKey(const Key("_scroll"));
      await tester.fling(listFinder, const Offset(0, -500), 10000);
      await tester.pumpAndSettle();
      await tester.tap(dropDown);
      await tester.pumpAndSettle();
      await tester.tap(find.text("Parking").first);
      await tester.pumpAndSettle();
      await tester.tap(find.byKey(const Key("_elevatedBtn")));
      await tester.pumpAndSettle();
    });
  });
}
