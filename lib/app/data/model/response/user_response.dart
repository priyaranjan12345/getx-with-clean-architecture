import 'package:getx_clean_architecture/app/data/model/user.dart';

class LoginResponse {
  final String token;
  final User user;
  LoginResponse({required this.token, required this.user});
}
