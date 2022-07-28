import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/dao/CartDAO.dart';
import 'package:myapp/http/httpuser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/screens/login/components/login_form.dart';

import 'login_test.mocks.dart';

@GenerateMocks([HttpConnectUser])
void main() {
  Widget buildCanvas({required Widget child}) {
    return MaterialApp(
        home: Scaffold(
      body: child,
    ));
  }

  testWidgets('username and password is not empty, login user',
      (WidgetTester tester) async {
    MockHttpConnectUser mockUser = MockHttpConnectUser();

    LoginForm loginPage = const LoginForm();

    when(mockUser.loginPosts('user222', 'password34'))
        .thenAnswer((_) => Future.value(true));

    mockUser.loginPosts('user222', 'password34');

    await tester.pumpWidget(buildCanvas(child: loginPage));

    Finder usernameField = find.byKey(Key('username'));
    await tester.enterText(usernameField, 'user222');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'password34');

    expect(find.text('Login'), findsOneWidget);
  });

  testWidgets('username or password is empty, user not logged in',
      (WidgetTester tester) async {

       
    MockHttpConnectUser mockUser = MockHttpConnectUser();
    LoginForm loginPage = const LoginForm();

    await tester.pumpWidget(buildCanvas(child: loginPage));

    Finder usernameField = find.byKey(Key('username'));
    await tester.enterText(usernameField, '');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, '');

    await tester.tap(find.byKey(Key('login')));

    verifyNever(mockUser.loginPosts('', ''));
  });
}
