import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:list_languages/language.dart';

import 'add_language.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      initialRoute: '/',
      routes: {
        "/": (context) => const MyHomePage(title: 'Favorites Languages'),
        "/add": (context) => AddLanguage()
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Language> languages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Wrap(
            spacing: 10,
            children: buildListChoices(),
          ),
          Expanded(
            child: ListView(
                children: buildListItens()
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_circle_outline),
        onPressed: (){
          Future future = Navigator.pushNamed(
              context, '/add'
          );
          future.then((value) {
            if(value != null){
              setState(() {
                languages.add(value);
              });
            }
          });
        },
      ),
    );
  }

  //Método
  List<Widget> buildListItens() =>
    languages
        .where((language) => language.selected)
        .map((language) => buildLanguageOption(language))
        .toList();

  //Método
  List<Widget> buildListChoices() =>
      languages.map((language) => buildOption(language)).toList();

  //Método
  Widget buildLanguageOption(Language language) => Card(
    child: ListTile(
      leading: const Icon(Icons.language),
      title: Text(language.name),
      subtitle: Text(language.detail),
    ),
  );

  ChoiceChip buildOption(Language language) => ChoiceChip(
      label: Text(language.name),
      selected: language.selected,
      onSelected: (value){
        setState(() {
          language.selected = value;
        });
      },
    );
}
