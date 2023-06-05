import 'package:admin_management/common/constants/colors.dart';
import 'package:admin_management/common/regex/form_regex.dart';
import 'package:admin_management/locator.dart';
import 'package:admin_management/network/services/user/user_service.dart';
import 'package:admin_management/router/app_router.dart';
import 'package:admin_management/ui/auth/sign_in/view_model/login_view_model.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class LoginScreen extends StatelessWidget {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final LoginViewModel model = LoginViewModel(userService: locator<UserService>());
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
              child: Form(
                key: formKey,
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
                      validator: (p0) {
                        if (!FormRegex.emailPattern.hasMatch(p0!)) {
                          return "Invalid Email address";
                        }
                        return null;
                      },
                      labelText: "Email Adress",
                      hintText: "Please email address",
                      controller: emailController,
                    ),
                    CustomFormField(
                      labelText: "Password",
                      hintText: "Please enter password",
                      controller: passwordController,
                      isObscure: true,
                      validator: (p0) {
                        if (!FormRegex.passwordPattern.hasMatch(p0!)) {
                          return " Password must be strong. At least one upper case alphabet. At least one lower case alphabet. At least one digit. At least one special character. Minimum eight in length";
                        }
                        return null;
                      },
                    ),
                    SizedBox(
                      height: size.height * 0.02,
                    ),
                    _loginButton(size, context, model, emailController, passwordController, formKey)
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Positioned _loginButton(Size size, BuildContext context, LoginViewModel model, TextEditingController emailController,
    TextEditingController passwordController, GlobalKey<FormState> formKey) {
  return Positioned(
    left: size.width * 0.1,
    right: size.width * 0.1,
    bottom: size.height * 0.1,
    child: SizedBox(
        width: size.width * 0.5,
        height: size.width * 0.03,
        child: ElevatedButton(
          onPressed: () async {
            if (formKey.currentState!.validate()) {
              var isLogged = await model.login(emailController.text, passwordController.text);

              if (isLogged) {
                context.router.push(const HomeRoute());
              } else {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("Giriş hatalı ")));
              }
            }
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
  final bool isObscure;
  const CustomFormField({
    Key? key,
    required this.labelText,
    required this.hintText,
    required this.controller,
    this.validator,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.fromSTEB(0, 16, 0, 0),
      child: TextFormField(
          controller: controller,
          obscureText: isObscure,
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
