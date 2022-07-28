import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import '../widgets/product_desc_test.mocks.dart';

void main() {
  test("Get all products", () {
    MockHttpConnectProduct mockProduct = MockHttpConnectProduct();
    bool? result = true;
    when(mockProduct.getProducts())
        .thenAnswer((realInvocation) => Future.value([]));

    expect(mockProduct.getProducts(),
        isNot(equals(Future.value(result))));
  });
}
