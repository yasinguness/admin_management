import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/constants/route_const.dart';
import 'package:flutter/material.dart';

class ChangeEmail extends StatelessWidget {
  const ChangeEmail({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController email = TextEditingController();
    TextEditingController newEmail = TextEditingController();
    return Dialog(
      child: Container(
        width: size.width * 0.3,
        height: size.height * 0.25,
        decoration: const BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)), color: Colors.transparent),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              _mail(email),
              const SizedBox(
                height: 12,
              ),
              _mailField(newEmail),
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

  TextField _mail(TextEditingController email) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: email,
      decoration: InputDecoration(
          hintText: "Email Adresinizi Giriniz",
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: AppColors.brown, width: 2), borderRadius: BorderRadius.circular(16)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16), borderSide: BorderSide(color: AppColors.brown))),
    );
  }

  TextField _mailField(TextEditingController newEmail) {
    return TextField(
      keyboardType: TextInputType.emailAddress,
      controller: newEmail,
      decoration: InputDecoration(
          hintText: "Lütfen Yeni Email Adresinizi Giriniz",
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
