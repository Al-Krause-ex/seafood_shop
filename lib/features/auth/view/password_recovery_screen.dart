import 'package:flutter/material.dart';
import 'package:auto_route/auto_route.dart';
import 'package:seafood_shop/router/router.dart';
import 'package:seafood_shop/ui/ui.dart';

@RoutePage()
class PasswordRecoveryScreen extends StatelessWidget {
  const PasswordRecoveryScreen({super.key});

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
                        'Восстановление пароля',
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
                    const Spacer(),
                    CustomElevatedButton(
                      title: 'Восстановить',
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      height: 60,
                      callback: () {},
                    ),
                    const SizedBox(height: 10),
                    CustomElevatedButton(
                      title: 'Назад',
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      backgroundColor: light2BlueColor,
                      foregroundColor: primaryColor,
                      height: 60,
                      callback: () {
                        context.maybePop();
                      },
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Ещё нет аккаунта?'),
                        const SizedBox(width: 2),
                        TextButton(
                          onPressed: () {
                            context.maybePop().then((value) {
                              context.replaceRoute(const SignUpRoute());
                            });
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
