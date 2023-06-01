// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:admin_management/network/model/user/user.dart';
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/ui/base/base_model.dart';

class SettingsViewModel extends BaseModel {
  UserService? userService;
  SettingsViewModel({this.userService, this.model});
  UserModel? model;

  Future getUserProfile() async {
    setBusy(true);
    model = await userService!.getUserProfile();
    setBusy(false);
  }
}
