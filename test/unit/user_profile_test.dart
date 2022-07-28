import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/model/user.dart';

import '../widgets/user_profile_test.mocks.dart';

void main() {
  test("User profile details test", () {
    MockHttpConnectUserProfile mockProfile = MockHttpConnectUserProfile();
    when(mockProfile.getUserProfile()).thenAnswer((_) => Future.value(User()));

    expect(mockProfile.getUserProfile(), isNot(equals(Future.value(User()))));
  });
}
