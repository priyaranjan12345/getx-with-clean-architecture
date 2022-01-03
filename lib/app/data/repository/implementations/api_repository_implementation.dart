import 'dart:developer';

import 'package:getx_clean_architecture/app/data/exceptions/auth_exception.dart';
import 'package:getx_clean_architecture/app/data/model/product.dart';
import 'package:getx_clean_architecture/app/data/model/response/user_response.dart';
import 'package:getx_clean_architecture/app/data/model/request/login_request.dart';
import 'package:getx_clean_architecture/app/data/model/user.dart';
import 'package:getx_clean_architecture/app/data/products_list/product_list.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';

class ApiRepositoryImplementation extends ApiRepositoryInterface {
  @override
  Future<User> getUserFormToken(String token) async {
    await Future.delayed(const Duration(seconds: 2));
    //http call over token
    if (token == 'priyaranjan1234_token') {
      return const User(
        name: 'Priyaranjan',
        username: 'priyaranjan1234',
        imagePath: 'assets/img/three.png',
      );
    } else if (token == 'priyaranjan12_token') {
      return const User(
        name: 'Priyaranjan',
        username: 'priyaranjan12',
        imagePath: 'assets/img/three.png',
      );
    } else {
      throw AuthException();
    }
  }

  // get token user authenticate sucessfully....
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    await Future.delayed(const Duration(seconds: 2));
    if (loginRequest.username == 'priyaranjan1234' &&
        loginRequest.password == '123456') {
      return LoginResponse(
        token: 'priyaranjan1234_token',
        user: const User(
          name: 'Priyaranjan',
          username: 'priyaranjan1234',
          imagePath: 'assets/img/three.png',
        ),
      );
    } else if (loginRequest.username == 'priyaranjan12' &&
        loginRequest.password == '12345678') {
      return LoginResponse(
        token: 'priyaranjan12_token',
        user: const User(
          name: 'Priyaranjan',
          username: 'priyaranjan12',
          imagePath: 'assets/img/four.png',
        ),
      );
    } else {
      throw AuthException();
    }
  }

  @override
  Future<void> logout(String token) async {
    log('Removed token fromserver');
    return;
  }

  @override
  Future<List<Product>> getProducts() async {
    await Future.delayed(const Duration(seconds: 2));
    return productList;
  }

  @override
  Future<List<Product>> getKartProducts() {
    // TODO: implement getKartProducts
    throw UnimplementedError();
  }

  @override
  Future<void> saveKartProducts() {
    // TODO: implement saveKartProducts
    throw UnimplementedError();
  }
}
