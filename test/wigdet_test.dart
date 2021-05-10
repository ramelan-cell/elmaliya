import 'package:elmaliya/view/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("login test widget", (WidgetTester tester) async {
    //eksekusi testing
    Login loginScreen = new Login();
    var app = new MediaQuery(
        data: new MediaQueryData(), child: new MaterialApp(home: loginScreen));
    await tester.pumpWidget(app);

    Finder uname = find.byKey(ValueKey("addUsername"));
    Finder pw = find.byKey(ValueKey("addPassword"));

    print("Username Widget");
    print(uname.toString());

    print("Getting form widget");
    Finder formWidgetFinder = find.byType(Form);
    print(formWidgetFinder.toString());
    Form formWidget = tester.widget(formWidgetFinder) as Form;
    GlobalKey<FormState> formKey = formWidget.key as GlobalKey<FormState>;
    //expect((tester.widget(loginButton) as PrimaryButton).enabled, isFalse);
    expect(formKey.currentState.validate(), isFalse);
  });
}
