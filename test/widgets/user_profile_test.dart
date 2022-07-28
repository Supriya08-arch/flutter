import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:myapp/http/httpconnectuserprofile.dart';
import 'package:myapp/http/httpuser.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/model/user.dart';
import 'package:myapp/screens/login/components/login_form.dart';
import 'package:myapp/screens/user_profile/components/update_user_form.dart';

import 'user_profile_test.mocks.dart';

@GenerateMocks([HttpConnectUserProfile])
void main() {
  Widget buildCanvas({required Widget child}) {
    return MaterialApp(
        home: Scaffold(
      body: child,
    ));
  }

  testWidgets("Display username and email in the profile screen",
      (WidgetTester tester) async {
    MockHttpConnectUserProfile mockProfile = MockHttpConnectUserProfile();

    UpdateUserForm updateUserForm = UpdateUserForm(
        user: User(
            username: "Sachin",
            password: "password34",
            email: "jrsachin99@gmail.com"));

    await tester.pumpWidget(buildCanvas(child: updateUserForm));

    //---->username and password should be displayed in the user profile
    expect(find.text('Sachin'), findsOneWidget);
    expect(find.text('jrsachin99@gmail.com'), findsOneWidget);

    //---->password shouldn't be displayed in the user profile
    isNot(find.text('password34'));
  });
}
