// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class LoginViewModel extends BaseModel {
  UserService? userService;
  LoginViewModel({
    this.userService,
  });
  Future login(String email, String password) async {
    bool? isLogg = await userService!.login(email, password);
    return isLogg;
  }
}
