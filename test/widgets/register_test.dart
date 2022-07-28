import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/http/httpuser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/model/user.dart';
import 'package:myapp/screens/login/components/login_form.dart';
import 'package:myapp/screens/signup/components/register_form.dart';

import 'register_test.mocks.dart';

@GenerateMocks([HttpConnectUser])
void main() {
  Widget buildCanvas({required Widget child}) {
    return MaterialApp(
        home: Scaffold(
      body: child,
    ));
  }


  
  testWidgets('username, email and password is not empty, register user',
      (WidgetTester tester) async {
    MockHttpConnectUser mockUser = MockHttpConnectUser();

    RegisterForm signupPage = RegisterForm();

    when(mockUser.registerPost(User(
            username: 'sachin34',
            password: 'strongpassword',
            email: "test12@gmail.com")))
        .thenAnswer((_) => Future.value(true));

    await tester.pumpWidget(buildCanvas(child: signupPage));

    Finder usernameField = find.byKey(Key('username'));
    await tester.enterText(usernameField, 'kemonache');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, 'softwarica12');

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, 'kemon@gmail.com');

    expect(find.text('Register'), findsOneWidget);
  });


  testWidgets('username, email or password is empty, user not registered',
      (WidgetTester tester) async {
    MockHttpConnectUser mockUser = MockHttpConnectUser();

    RegisterForm signupPage =const RegisterForm();

    await tester.pumpWidget(buildCanvas(child: signupPage));

    Finder usernameField = find.byKey(Key('username'));
    await tester.enterText(usernameField, '');

    Finder passwordField = find.byKey(Key('password'));
    await tester.enterText(passwordField, '');

    Finder emailField = find.byKey(Key('email'));
    await tester.enterText(emailField, '');

    await tester.tap(find.byKey(Key('register')));

    verifyNever(mockUser.registerPost(User()));
  });
}
