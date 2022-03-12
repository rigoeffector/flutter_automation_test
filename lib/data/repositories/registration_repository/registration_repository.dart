import 'package:dio/dio.dart';
import 'package:bloc_login/data/dataproviders/http.provider.dart';

class RegistrationRepository {
  final _httpProvider = HttpProvider();

  Future<Response> publicRegister({String email, String password, String cpassword})async{
    return await _httpProvider.reg(username: email, password: password, cpassword: cpassword);
  }
  
  Future<Response> activate({String email, String code})async{
    return await _httpProvider.activate(username: email, code: code);
  }

  Future<Response> validateOtp({String code})async{
    return await _httpProvider.otp_check(code: code);
  }
}