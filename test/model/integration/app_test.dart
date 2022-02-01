import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main(List<String> args) {
  FlutterDriver? driver;
  dynamic button;

  group("Integration Testing | <name of file> ", () {
    button = find.byType('FloatingActionButton');
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver!.close();
      }
    });
  });
  test("Given When Then", () async {
    await driver!.tap(button);
    final text = find.text("");
    expect(await driver!.getText(text), "Text");
  });
}
