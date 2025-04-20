import 'package:flutter/material.dart';

class AppGreetingWidget extends StatelessWidget {
  final String name;
  final Color textColor;
  final void Function() onTap;
  final String? profileImage;
  final double? fontSize;

  const AppGreetingWidget({
    super.key,
    required this.textColor,
    required this.onTap,
    required this.name,
    this.fontSize,
    this.profileImage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50, left: 10, bottom: 10),
      child: Row(
        children: [
          GestureDetector(
            onTap: onTap,
            child: CircleAvatar(
              backgroundColor: Theme.of(context).colorScheme.secondary,
              backgroundImage: AssetImage(
                profileImage ?? 'assets/profiles/profile_default.png',
              ),
              radius: 35,
            ),
          ),
          const SizedBox(width: 20),
          Text(
            'Olá, $name',
            style: TextStyle(
              fontSize: fontSize ?? 30,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }
}
