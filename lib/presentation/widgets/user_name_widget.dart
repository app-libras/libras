import 'package:flutter/material.dart';

class UserNameWidget extends StatelessWidget {
  final TextEditingController nameController;
  final void Function() onEnter;
  const UserNameWidget({
    super.key,
    required this.nameController,
    required this.onEnter,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, top: 70),
      child: Column(
        children: [
          Column(
            children: <Widget>[
              Image.asset('assets/logos/sign.png', height: 100),
              Text(
                'Bem Vindo ao Librar',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w900,
                  color: Theme.of(context).colorScheme.primary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 70),
          GestureDetector(
            onTap: () {},
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(
                    Icons.person,
                    size: 70,
                    color: Theme.of(context).colorScheme.secondary,
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  right: 0,
                  child: ElevatedButton(
                    onPressed: null,
                    child: Icon(
                      Icons.camera_alt,
                      color: Theme.of(context).colorScheme.primary,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Center(
            child: TextField(
              decoration: InputDecoration(
                labelText: "Seu Nome",
                hintText: 'Digite seu nome',
                labelStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                hintStyle: TextStyle(
                  fontSize: 20,
                  color: Theme.of(context).colorScheme.primary,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Theme.of(context).colorScheme.primary,
                    width: 10,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                hoverColor: Theme.of(context).colorScheme.primary,
                prefixIcon: Icon(
                  Icons.person,
                  color: Theme.of(context).colorScheme.primary,
                  size: 30,
                ),
                filled: true,
                fillColor: Theme.of(context).colorScheme.secondary,
              ),
              textCapitalization: TextCapitalization.words,
              controller: nameController,
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: onEnter,
            style: ButtonStyle(
              backgroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              foregroundColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.secondary,
              ),
              shape: WidgetStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              padding: WidgetStateProperty.all<EdgeInsets>(
                const EdgeInsets.only(top: 10, bottom: 10),
              ),
              elevation: WidgetStateProperty.all<double>(10.0),
              shadowColor: WidgetStateProperty.all<Color>(
                Theme.of(context).colorScheme.primary,
              ),
              minimumSize: WidgetStateProperty.all<Size>(
                const Size(double.infinity, 50),
              ),
            ),
            child: Text(
              'Entrar',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
