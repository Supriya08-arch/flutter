import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:myapp/model/cartmodel.dart';
import 'package:myapp/model/order.dart';
import '../widgets/orders_test.mocks.dart';

void main() {
  test("Place Orders test", () {
    MockHttpConnectOrder mockOrder = MockHttpConnectOrder();
    bool? result = true;
    Order order =  Order(orderAmount: 400, orderItems:<CartModel> []);
    when(mockOrder.placeOrder(order))
        .thenAnswer((realInvocation) => Future.value(result));

    expect(mockOrder.placeOrder(order), isNot(equals(Future.value(result))));
  });
}
