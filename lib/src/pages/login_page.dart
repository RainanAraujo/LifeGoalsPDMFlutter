import 'package:flutter/material.dart';
import 'package:life_goals_pdm/src/app/app_colors.dart';
import 'package:life_goals_pdm/src/app/app_text_styles.dart';
import 'package:life_goals_pdm/src/controllers/login_controller.dart';
import '../components/default_text_form_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final loginController = LoginController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.965,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "LOGIN",
                    style: AppTextStyles.title.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                  const SizedBox(height: 30),
                  DefaultTextFormField(
                    controller: loginController.emailController,
                    textInputAction: TextInputAction.next,
                    autoFocus: true,
                    keyboardType: TextInputType.emailAddress,
                    label: "Email",
                    hintText: "Digite seu email",
                  ),
                  const SizedBox(height: 10),
                  DefaultTextFormField(
                    controller: loginController.passwordController,
                    keyboardType: TextInputType.text,
                    label: "Senha",
                    obscureText: true,
                    hintText: "Digite sua senha",
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      onPressed: () async {
                        await loginController.signIn(context);
                      },
                      child: AnimatedBuilder(
                        animation: loginController,
                        builder: (context, _) {
                          return Visibility(
                            visible: loginController.isLoading,
                            replacement: Text(
                              "Fazer Login",
                              style: AppTextStyles.button,
                            ),
                            child: const SizedBox(
                              width: 25,
                              height: 25,
                              child: CircularProgressIndicator(
                                color: AppColors.white,
                                strokeWidth: 2,
                              ),
                            ),
                          );
                        },
                      ))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
