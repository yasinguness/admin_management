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
      body: Container(
        child: Column(
          children: [
            Image.asset(
              "assets/images/GLASS-2.png",
              width: 100,
              height: 50,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text("COFFEE GPT", style: Theme.of(context).textTheme.bodyLarge),
            const Text("Tekrar hoşgeldiniz, lütfen giriş yapın."),
            // Generated code for this emailAddress Widget...
            CustomFormField(labelText: "Email Adress", hintText: "Please email address", controller: emailController),
            CustomFormField(labelText: "Password", hintText: "Please enter password", controller: passwordController)
          ],
        ),
      ),
    );
  }
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
    return Expanded(
      child: Padding(
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
      ),
    );
  }
}
