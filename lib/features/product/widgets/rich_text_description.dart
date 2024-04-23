import 'package:flutter/material.dart';

class RichTextDescription extends StatelessWidget {
  const RichTextDescription({
    super.key,
    required this.title,
    required this.value,
  });

  final String title;
  final String value;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return RichText(
      text: TextSpan(
        text: '$title: ',
        style: theme.textTheme.bodyMedium,
        children: [
          TextSpan(
            text: value,
            style: theme.textTheme.bodyMedium?.copyWith(color: Colors.black45),
          )
        ],
      ),
    );
  }
}
