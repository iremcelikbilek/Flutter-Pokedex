import 'package:flutter/material.dart';
import 'package:flutter_pokedex/screens/pokemon_list.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.blueGrey,
    ),
    home: PokemonList(),
  ));
}

