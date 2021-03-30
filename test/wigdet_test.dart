import 'package:elmaliya/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:elmaliya/view/login.dart';

void main() {
  testWidgets("login test widget", (WidgetTester tester) async {
    //identifikasi widget yg dibutuhkan
    final addUname = find.byKey(ValueKey("addUsername"));
    final addPassword = find.byKey(ValueKey("addPassword"));
    final clickLogin = find.byKey(ValueKey("loginButton"));

    //eksekusi testing
    await tester.pumpWidget(MaterialApp(home: Login()));

    // await tester.enterText(addUname, "admin");
    await tester.enterText(addPassword, "1");
    await tester.tap(clickLogin);
    await tester.pump();

    //cek output
    // expect(find.text("admin"), findsOneWidget);
    expect(find.text("1"), findsOneWidget);
  });
}
