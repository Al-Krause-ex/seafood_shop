import 'package:flutter/material.dart';
import 'package:seafood_shop/ui/ui.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
    required this.onTap,
    required this.controller,
  });

  final VoidCallback onTap;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
        margin: const EdgeInsets.symmetric(horizontal: 18),
        decoration: BoxDecoration(
          color: light1BlueColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            AnimatedBuilder(
              animation: controller,
              builder: (context, _) {
                return Text(
                  controller.text.isEmpty ? 'Поиск' : controller.text,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.white.withOpacity(.7),
                    fontWeight: FontWeight.normal,
                  ),
                );
              },
            ),
            const Icon(
              Icons.search_rounded,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
