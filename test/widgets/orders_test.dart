import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:myapp/http/httporder.dart';
import 'package:myapp/model/cartmodel.dart';
import 'package:myapp/model/order.dart';
import 'package:myapp/screens/orders/components/body.dart';
import 'orders_test.mocks.dart';

@GenerateMocks([HttpConnectOrder])
void main() {
  Widget buildCanvas({required Widget child}) {
    return MaterialApp(
        home: Scaffold(
      body: child,
    ));
  }

  testWidgets("Show product description on the screen",
      (WidgetTester tester) async {
    // HttpConnectOrder mockDesc = HttpConnectOrder();

    OrderSection orderInfo = OrderSection(
      order: Order(orderAmount: 400, orderItems: []),
    );

    await tester.pumpWidget(buildCanvas(child: orderInfo));

    //---->price should be show with a dollar sign

    //---->insted of displaying image url, actula image widget should be built
    isNot(find.text(
        "https://lms.softwarica.edu.np/pluginfile.php/1/core_admin/logocompact/0x70/1598355334/custw1.png"));

    isNot(find.text("Product 1"));
  });
}
