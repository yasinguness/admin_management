import 'package:admin_management/common/constants/service_const.dart';
import 'package:admin_management/network/model/user/user.dart';
import 'package:admin_management/network/services/base_service.dart';
import 'package:admin_management/network/services/shared_pref.dart';
import 'package:dio/dio.dart';

class UserService extends BaseService {
  Future<bool?> login(String email, String password) async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();

    try {
      var loginData = {"email": email, "password": password};

      final response = await dio.post(
        "$BASE_URL/users/login",
        data: loginData,
      );

      if (response.statusCode == 200) {
        var token = response.data['data'];
        await shared.setString("token", token);
        return true;
      }
    } catch (e) {
      print(e);
      return false;
    }
    return null;
  }

  Future<UserModel?> getUserProfile() async {
    SharedPreferencesManager shared = await SharedPreferencesManager.getInstance();

    var token = shared.getString("token");
    try {
      final response =
          await dio.get("$BASE_URL/users/profile", options: Options(headers: {"Authorization": "Bearer $token"}));

      if (response.statusCode == 200) {
        return UserModel.fromJson(response.data["data"]);
      }
    } catch (e) {
      print(e);
    }
    return null;
  }
}
