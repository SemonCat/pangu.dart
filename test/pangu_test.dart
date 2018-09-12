import 'package:test/test.dart';

import 'package:pangu/pangu.dart';

void main() {
  test('TODO', () {
    String text = new Pangu().spacingText("測試test測試");
    expect(text, "測試 test 測試");
  });
}
