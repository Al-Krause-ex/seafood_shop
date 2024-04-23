import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';

@RoutePage()
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                        'Авторизация',
                        style: theme.textTheme.titleLarge,
                      ),
                    ),
                    const SizedBox(height: 15),
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: 'E-mail',
                      textInputAction: TextInputAction.next,
                      keyboardType: TextInputType.emailAddress,
                    ),
                    CustomTextFormField(
                      controller: TextEditingController(),
                      hintText: 'Пароль',
                      textInputAction: TextInputAction.done,
                      keyboardType: TextInputType.visiblePassword,
                      typeSuffix: TypeSuffix.password,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {
                          context.pushRoute(const PasswordRecoveryRoute());
                        },
                        child: Text(
                          'Забыли пароль?',
                          style: TextStyle(color: theme.hintColor),
                        ),
                      ),
                    ),
                    const Spacer(),
                    CustomElevatedButton(
                      title: 'Войти',
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      callback: () {},
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
                        const Text('Ещё нет аккаунта?'),
                        const SizedBox(width: 2),
                        TextButton(
                          onPressed: () {
                            context.replaceRoute(const SignUpRoute());
                          },
                          child: const Text('Регистрация'),
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
    );
  }
}
