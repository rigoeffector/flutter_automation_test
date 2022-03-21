import 'package:bloc_login/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';


void main() {
  group('App Integration Test', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();
    testWidgets("full app test", (tester) async {
      await tester.pumpWidget(App());
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 5));

      // login process testing
      final loginBtn = find.text('Login');
      await tester.pumpAndSettle();
      await tester.tap(loginBtn);
      await tester.pumpAndSettle();
      final emailFormField =  await find.byKey(Key('email'));
      final passwordFormField = await find.byKey(Key('password'));
      await tester.enterText(emailFormField, 'rigos@gmail.com');
      await tester.pump(Duration(seconds: 3));
      await tester.enterText(passwordFormField, '1234567');
      await tester.pump(Duration(seconds: 3));
      await tester.ensureVisible(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.tap(find.byType(ElevatedButton));
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 5));
      final logoutBtn = find.text('Logout');
      expect(logoutBtn, findsOneWidget);
      await tester.pump(Duration(seconds: 1));
      await tester.tap(logoutBtn);

      // register process testing
      await tester.ensureVisible(find.byType(ElevatedButton));
      final registerBtn = find.text('Register');
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 5));
      await tester.tap(registerBtn);
      final emailUserFormField =  await find.byKey(Key('emailUser'));
      final passwordUserFormField = await find.byKey(Key('pwdUser'));
      final cpasswordUserFormField = await find.byKey(Key('cpwdUser'));
      await tester.pumpAndSettle();
      await tester.enterText(emailUserFormField, 'rigos@gmail.com');
      await tester.pump(Duration(seconds: 3));
      await tester.enterText(passwordUserFormField, '1234567');
      await tester.pump(Duration(seconds: 3));
      await tester.enterText(cpasswordUserFormField, '1234567');
      await tester.pump(Duration(seconds: 3));
      await tester.pumpAndSettle();
      await tester.ensureVisible(find.byType(ElevatedButton));
      final registerUserBtn = find.text('Submit');
      await tester.pumpAndSettle();
      await tester.tap(registerUserBtn);


      // forgot password process
      await tester.pump(Duration(seconds: 5));
      await tester.ensureVisible(find.byType(ElevatedButton));
      final forgotPwdbtn = find.text('Forgot your password?');
      await tester.pumpAndSettle();
      await tester.tap(forgotPwdbtn);
      final emailVFormField =  await find.byKey(Key('emailVaccount'));
      await tester.pumpAndSettle();
      await tester.enterText(emailVFormField, 'rigos@gmail.com');
      await tester.pump(Duration(seconds: 2));
      await tester.ensureVisible(find.byType(ElevatedButton));
      final searchBtn = find.text('Search');
      await tester.pumpAndSettle();
      await tester.tap(searchBtn);
      await tester.pump(Duration(seconds: 2));
      final code =  await find.byKey(Key('code'));
      await tester.pumpAndSettle();
      await tester.enterText(code, '1236789');
      await tester.pump(Duration(seconds: 1));
      await tester.ensureVisible(find.byType(ElevatedButton));
      final verifyBtn = find.text('Verify');
      await tester.pumpAndSettle();
      await tester.tap(verifyBtn);

      await tester.pump(Duration(seconds: 2));
      final newPwdFormField =  await find.byKey(Key('newpwd'));
      await tester.pumpAndSettle();
      final cnewPwdFormField =  await find.byKey(Key('cnewpwd'));
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 2));
      await tester.enterText(newPwdFormField, '1234567');
      await tester.pump(Duration(seconds: 1));
      await tester.enterText(cnewPwdFormField, '1234567');
      await tester.pump(Duration(seconds: 1));
      await tester.ensureVisible(find.byType(ElevatedButton));
      final resetPasswordBtn = find.text('Reset Password');
      await tester.pumpAndSettle();
      await tester.pump(Duration(seconds: 1));
      await tester.tap(resetPasswordBtn);


    });
  });
}
