import 'package:flutter/material.dart';

class TitleValueWidget extends StatelessWidget {
  const TitleValueWidget({super.key, required this.title, required this.value});

  final String title, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.titleLarge!.copyWith(fontSize: 13),
        ),
        Text(value, style: Theme.of(context).textTheme.bodySmall),
      ],
    );
  }
}
