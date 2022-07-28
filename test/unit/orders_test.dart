import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../widgets/orders_test.mocks.dart';

void main() {
  test("Get user orders", () {
    MockHttpConnectOrder mockOrder = MockHttpConnectOrder();
    bool? result = true;
    when(mockOrder.getOrders())
        .thenAnswer((realInvocation) => Future.value([]));

    expect(mockOrder.getOrders(), isNot(equals(Future.value(result))));
  });
}
