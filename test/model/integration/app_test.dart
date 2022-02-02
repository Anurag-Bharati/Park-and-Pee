import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import "../../../lib/main.dart" as app;

void main() {
  group("Add Service - Map View Test", () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("MapView Test", (tester) async {
      app.main();
      await tester.pumpAndSettle();
      await tester.pump(const Duration(seconds: 5));
      final map = find.byKey(const Key("_googleMap"));
      final dropDown = find.byKey(const Key("_dropDown"));
      await tester.longPress(map);
      await tester.pumpAndSettle();
      await tester.tap(dropDown);
      await tester.pumpAndSettle();
      await tester.tap(find.text("Parking"));
      await tester.tap(find.byKey(const Key("_elevatedBtn")));
    });
  });
}
