import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';

import 'language.dart';

class AddLanguage extends StatelessWidget {
  AddLanguage({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _detailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova Linguagem"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Nome da linguagem",
                    labelText: "Nome da linguagem"
                ),
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira o nome da linguagem';
                  }
                  return null; //o retorno nulo representa que está valido
                },
              ),
              TextFormField(
                decoration: const InputDecoration(
                    hintText: "Detalhe da linguagem",
                    labelText: "Detalhe da linguagem"
                ),
                controller: _detailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Insira detalhes da linguagem';
                  }
                  return null; //o retorno nulo representa que está valido
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: ElevatedButton
                  (
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      Language language = Language(
                          _nameController.text,
                          _detailController.text
                      );
                      Navigator.pop(context, language);
                    }
                  },
                  child: Text('Gravar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
