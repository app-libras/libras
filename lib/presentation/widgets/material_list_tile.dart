import 'package:flutter/material.dart';

class MaterialListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final Function onTap;
  final IconData leadingIcon;
  final IconData trailingIcon;

  const MaterialListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.leadingIcon,
    required this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(leadingIcon, color: Colors.black, size: 35),
      trailing: Icon(trailingIcon, color: Colors.grey, size: 25),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
        side: BorderSide(
          color: const Color.fromARGB(255, 214, 213, 213),
          width: 1,
        ),
      ),
      contentPadding: EdgeInsets.all(5),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 30,
          // fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      ),
      subtitle: Text(subtitle, style: TextStyle(fontSize: 20)),
      onTap: onTap(),
    );
  }
}
