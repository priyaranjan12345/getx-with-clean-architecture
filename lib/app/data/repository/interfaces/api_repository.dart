import 'package:getx_clean_architecture/app/data/model/product.dart';
import 'package:getx_clean_architecture/app/data/model/request/login_request.dart';
import 'package:getx_clean_architecture/app/data/model/response/user_response.dart';
import 'package:getx_clean_architecture/app/data/model/user.dart';

abstract class ApiRepositoryInterface {
  Future<User> getUserFormToken(String token);
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<void> logout(String token);
  Future<List<Product>> getProducts();
  Future<List<Product>> getKartProducts();
  Future<void> saveKartProducts();
}
