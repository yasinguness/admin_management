import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/model/user/user.dart';
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/ui/base/base_view.dart';
import 'package:admin_management/ui/settings/view_model/settings_view_model.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class PersonalInfo extends StatefulWidget {
  const PersonalInfo({
    Key? key,
  }) : super(key: key);

  @override
  State<PersonalInfo> createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final TextEditingController priceText = TextEditingController(text: "15");

  final TextEditingController nameText = TextEditingController(text: "Americano");

  final TextEditingController descriptionText = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return BaseView<SettingsViewModel>(
      model: SettingsViewModel(userService: locator<UserService>(), model: UserModel()),
      onModelReady: (p0) => p0.getUserProfile(),
      builder: (context, value, widget) => value.busy
          ? Center(child: LoadingAnimationWidget.threeRotatingDots(color: AppColors.brown, size: 48))
          : Dialog(
              child: Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
                width: 400,
                height: 600,
                child: Column(
                  children: [
                    _title(size, context),
                    const SizedBox(
                      height: 16,
                    ),
                    _image(),
                    const SizedBox(
                      height: 16,
                    ),
                    InfoRow(text: "${value.model!.name} ${value.model!.surname}", title: "Name - Surname:"),
                    InfoRow(text: value.model!.email.toString(), title: "E-Mail:"),
                    const InfoRow(text: "*********", title: "Password:"),
                  ],
                ),
              ),
            ),
    );
  }

  SizedBox _image() {
    return SizedBox(
      width: 100,
      height: 100,
      child: Image.asset(
        "assets/images/pngProf.png",
        fit: BoxFit.cover,
      ),
    );
  }

  Container _title(Size size, BuildContext context) {
    return Container(
      width: double.infinity,
      height: size.height * 0.05,
      decoration: const BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(4), bottomRight: Radius.circular(4))),
      child: Center(
        child: Text(
          "Personal Info",
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

class InfoRow extends StatelessWidget {
  final String title;
  final String text;
  const InfoRow({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Text(
          title,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 4.0),
          child: Text(
            text,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400, color: Colors.grey.shade600),
          ),
        )
      ]),
    );
  }
}
