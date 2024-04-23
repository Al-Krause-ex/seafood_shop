import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:seafood_shop/core/utils/utils.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';

final _formKey = GlobalKey<FormState>();

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late TextEditingController nameController;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    nameController = TextEditingController();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    nameController.clear();
    emailController.clear();
    passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  width: 100,
                  height: 100,
                  margin: const EdgeInsets.symmetric(vertical: 20),
                  color: Colors.grey,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Text(
                          'Регистрация',
                          style: theme.textTheme.titleLarge,
                        ),
                      ),
                      const SizedBox(height: 15),
                      CustomTextFormField(
                        controller: nameController,
                        hintText: 'Имя',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.name,
                        textCapitalization: TextCapitalization.sentences,
                        validator: Validator.validateName,
                      ),
                      CustomTextFormField(
                        controller: emailController,
                        hintText: 'E-mail',
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.emailAddress,
                        validator: Validator.validateEmail,
                      ),
                      CustomTextFormField(
                        controller: passwordController,
                        hintText: 'Пароль',
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.visiblePassword,
                        typeSuffix: TypeSuffix.password,
                        validator: Validator.validatePassword,
                      ),
                      const Spacer(),
                      CustomElevatedButton(
                        title: 'Создать аккаунт',
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        height: 60,
                        callback: _createAccount,
                      ),
                      const SizedBox(height: 10),
                      CustomElevatedButton(
                        title: 'Войти как гость',
                        margin: const EdgeInsets.symmetric(horizontal: 10),
                        backgroundColor: light2BlueColor,
                        foregroundColor: primaryColor,
                        height: 60,
                        callback: () {},
                      ),
                      const SizedBox(height: 15),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Уже есть аккаунт?'),
                          const SizedBox(width: 2),
                          TextButton(
                            onPressed: () {
                              context.replaceRoute(const SignInRoute());
                            },
                            child: const Text('Авторизация'),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _createAccount() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();


  }
}
