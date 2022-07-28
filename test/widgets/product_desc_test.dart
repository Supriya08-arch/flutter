import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:myapp/http/httpproducts.dart';
import 'package:myapp/model/products.dart';
import 'package:myapp/screens/product_desc/components/products_info.dart';


@GenerateMocks([HttpConnectProduct])
void main() {
  Widget buildCanvas({required Widget child}) {
    return MaterialApp(
        home: Scaffold(
      body: child,
    ));
  }

  testWidgets("Show product description on the screen",
      (WidgetTester tester) async {
    HttpConnectProduct mockDesc = HttpConnectProduct();

    ProductInfo productInfo = ProductInfo(
      product: Product(
          id: "abcq23",
          name: "My Product",
          imageUrl:
              "https://lms.softwarica.edu.np/pluginfile.php/1/core_admin/logocompact/0x70/1598355334/custw1.png",
          category: "clothing",
          description: "very nice product",
          price: 245),
    );

    await tester.pumpWidget(buildCanvas(child: productInfo));

    //---->price should be show with a dollar sign
    expect(find.text('\$245'), findsOneWidget);

    //---->instaed of displaying image url, actula image widget should be built
    isNot(find.text(
        'https://lms.softwarica.edu.np/pluginfile.php/1/core_admin/logocompact/0x70/1598355334/custw1.png'));
  });
}
