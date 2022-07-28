import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../widgets/login_test.mocks.dart';

void main() {
  test("User authentication", () {
    MockHttpConnectUser mockuser = MockHttpConnectUser();
    bool? result = true;
    when(mockuser.loginPosts("unknown33", "secret445"))
        .thenAnswer((realInvocation) => Future.value(result));

    expect(mockuser.loginPosts("unknown33", "secret445"),
        isNot(equals(Future.value(result))));
  });
}
