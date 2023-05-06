import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/constants/route_const.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height,
            color: Colors.yellow,
            child: Image.asset(
              "assets/images/back2.jpg",
              fit: BoxFit.cover,
            ),
          ),
          Center(
            child: Container(
              decoration: const BoxDecoration(),
              width: size.width * 0.7,
              height: size.height * 0.9,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/GLASS-2.png",
                    width: 100,
                    height: 50,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  const Text("COFFEE GPT", style: TextStyle(fontSize: 36, fontWeight: FontWeight.w600)),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  const Text(
                    "Tekrar hoşgeldiniz, lütfen giriş yapın.",
                    style: TextStyle(fontSize: 24),
                  ),
                  // Generated code for this emailAddress Widget...
                  CustomFormField(
                      labelText: "Email Adress", hintText: "Please email address", controller: emailController),
                  CustomFormField(
                      labelText: "Password", hintText: "Please enter password", controller: passwordController),
                  SizedBox(
                    height: size.height * 0.02,
                  ),
                  _loginButton(size, context)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Positioned _loginButton(Size size, BuildContext context) {
  return Positioned(
    left: size.width * 0.1,
    right: size.width * 0.1,
    bottom: size.height * 0.1,
    child: SizedBox(
        width: size.width * 0.5,
        height: size.width * 0.03,
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, RouteConst.homeScreen);
          },
          style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.brown,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(28), // <-- Radius
              )),
          child:
              const Text("Giriş Yap", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400)),
        )),
  );
}

class CustomFormField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController controller;
  final String? Function(String?)? validator;
  const CustomFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: TextFormField(
          controller: controller,
          obscureText: false,
          decoration: InputDecoration(
            labelText: labelText,
            labelStyle: Theme.of(context).textTheme.bodySmall,
            hintText: hintText,
            hintStyle: Theme.of(context).textTheme.bodySmall,
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.grey,
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            errorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color(0x00000000),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(40),
            ),
            filled: true,
            fillColor: Colors.white,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(16, 24, 0, 24),
          ),
          style: Theme.of(context).textTheme.bodyMedium,
          validator: validator //_model.emailAddressControllerValidator.asValidator(context),
          ),
    );
  }
}
