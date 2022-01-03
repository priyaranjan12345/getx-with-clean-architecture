import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:getx_clean_architecture/app/data/exceptions/auth_exception.dart';
import 'package:getx_clean_architecture/app/data/model/request/login_request.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/api_repository.dart';
import 'package:getx_clean_architecture/app/data/repository/interfaces/local_data.dart';

class LoginController extends GetxController {
  final LocalRepositoryInterfasce localRepositoryInterfasce;
  final ApiRepositoryInterface apiRepositoryInterface;

  LoginController({
    required this.localRepositoryInterfasce,
    required this.apiRepositoryInterface,
  });

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  Future<bool> login() async {
    final username = usernameController.text;
    final password = passwordController.text;

    try {
      final loginResponse = await apiRepositoryInterface.login(
        LoginRequest(
          username: username,
          password: password,
        ), // I am passing login request model here
      );
      await localRepositoryInterfasce.setToken(loginResponse.token);
      await localRepositoryInterfasce
          .saveUser(loginResponse.user); // this user model for profile
    } on AuthException catch (_) {
      log('error : user validation failed');
      return false;
    }
    return true;
  }
}
