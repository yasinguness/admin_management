import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/constants/route_const.dart';
import 'package:flutter/material.dart';

class ChangePassword extends StatelessWidget {
  const ChangePassword({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController password = TextEditingController();
    TextEditingController newPassword = TextEditingController();
    TextEditingController renewPassword = TextEditingController();
    return Dialog(
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.3,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              _passwrd(password),
              const SizedBox(
                height: 12,
              ),
              _newPass(newPassword),
              const SizedBox(
                height: 12,
              ),
              _renewPass(renewPassword),
              const SizedBox(
                height: 12,
              ),
              _button(context)
            ],
          ),
        ),
      ),
    );
  }

  TextField _passwrd(TextEditingController password) {
    return TextField(
      keyboardType: TextInputType.visiblePassword,
      controller: password,
      decoration: InputDecoration(
          hintText: "Şifrenizi Giriniz",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.brown, width: 2), borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.brown))),
    );
  }

  TextField _newPass(TextEditingController newPassword) {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.visiblePassword,
      controller: newPassword,
      decoration: InputDecoration(
          hintText: "Lütfen Yeni Şifrenizi Giriniz",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.brown, width: 2), borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.brown))),
    );
  }

  TextField _renewPass(TextEditingController renewPassword) {
    return TextField(
      obscureText: true,
      keyboardType: TextInputType.emailAddress,
      controller: renewPassword,
      decoration: InputDecoration(
          hintText: "Lütfen Yeni Şifrenizi Tekrar Giriniz",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.brown, width: 2), borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.brown))),
    );
  }

  Align _button(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
          width: 100,
          height: 50,
          child: ElevatedButton(
            onPressed: () {
              //TODO: Lütfen yeni email adresinizi doğrulayın ve yeniden giriş yapın
              Navigator.pushNamedAndRemoveUntil(context, RouteConst.loginView, (route) => false);
            },
            style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.brown,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // <-- Radius
                )),
            child: const Text("Gönder", style: TextStyle(color: Colors.white, fontSize: 16)),
          )),
    );
  }
}
