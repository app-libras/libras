import 'package:flutter/material.dart';
import 'package:libras/core/fonts/books_icons.dart';
import 'package:libras/presentation/widgets/material_list_tile.dart';

class ClassroomScreen extends StatelessWidget {
  static const id = 'classroom_screen';
  const ClassroomScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.secondary,
        foregroundColor: Colors.grey,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(
                  left: 20,
                  top: 70,
                  right: 20,
                  bottom: 40,
                ),
                alignment: Alignment.centerLeft,
                width: double.infinity,
                child: Column(
                  children: [
                    Text(
                      'Saudações',
                      style: TextStyle(fontSize: 40, color: Colors.black),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      'Descrição da aula',
                      style: TextStyle(fontSize: 20, color: Colors.grey),
                    ),
                    Text('Olá!', style: TextStyle(fontSize: 20)),
                  ],
                ),
              ),
              MaterialListTile(
                title: 'Aula 1',
                subtitle: 'Descrição da aula',
                leadingIcon: BooksIcons.book_1,
                trailingIcon: Icons.arrow_forward_ios,
                onTap: () => () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
