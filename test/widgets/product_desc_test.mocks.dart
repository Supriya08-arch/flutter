// Mocks generated by Mockito 5.1.0 from annotations
// in myapp/test/widgets/product_desc_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i3;
import 'dart:io' as _i5;

import 'package:mockito/mockito.dart' as _i1;
import 'package:myapp/http/httpproducts.dart' as _i2;
import 'package:myapp/model/products.dart' as _i4;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

/// A class which mocks [HttpConnectProduct].
///
/// See the documentation for Mockito's code generation for more information.
class MockHttpConnectProduct extends _i1.Mock
    implements _i2.HttpConnectProduct {
  MockHttpConnectProduct() {
    _i1.throwOnMissingStub(this);
  }

  @override
  String get baseurl =>
      (super.noSuchMethod(Invocation.getter(#baseurl), returnValue: '')
          as String);
  @override
  _i3.Future<bool> addProducts(_i4.Product? newproduct, _i5.File? file) =>
      (super.noSuchMethod(Invocation.method(#addProducts, [newproduct, file]),
          returnValue: Future<bool>.value(false)) as _i3.Future<bool>);
  @override
  _i3.Future<List<_i4.Product>> getProducts() =>
      (super.noSuchMethod(Invocation.method(#getProducts, []),
              returnValue: Future<List<_i4.Product>>.value(<_i4.Product>[]))
          as _i3.Future<List<_i4.Product>>);
}
