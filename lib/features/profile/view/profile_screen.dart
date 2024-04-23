import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:seafood_shop/ui/widgets/widgets.dart';

@RoutePage()
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return const CustomScrollView(
      slivers: [
        CustomSliverAppBar(title: 'Профиль'),
        SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
      ],
    );
  }
}
