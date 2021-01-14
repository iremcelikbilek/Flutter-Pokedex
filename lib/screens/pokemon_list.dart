import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokedex.dart';
import 'package:flutter_pokedex/screens/pokemon_detail.dart';
import 'package:http/http.dart' as http;

class PokemonList extends StatefulWidget {
  @override
  _PokemonListState createState() => _PokemonListState();
}

class _PokemonListState extends State<PokemonList> {

  String url = "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
  Pokedex pokedex;
  Future<Pokedex> pokedexData;

  @override
  void initState() {
    super.initState();
    pokedexData = getPokemon();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pokemon Listesi"),),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return FutureBuilder(
      future: pokedexData,
      builder: (BuildContext context,AsyncSnapshot<Pokedex> snapshot){
        if(snapshot.connectionState == ConnectionState.waiting){
          return Center(child: CircularProgressIndicator(),);
        }else if (snapshot.connectionState == ConnectionState.done){
          return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: (){
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => PokemonDetail(pokemon: snapshot.data.pokemon[index],),
                    ));
                  },
                  child: Hero(tag: snapshot.data.pokemon[index].img, child: Card(
                    color: Colors.blueGrey.withOpacity(0.3),
                    elevation: 6,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          width: 100,
                          height: 100,
                          child: FadeInImage.assetNetwork(placeholder: "assets/loading.gif", image: snapshot.data.pokemon[index].img),
                        ),
                        Text(snapshot.data.pokemon[index].name, style: TextStyle(fontWeight: FontWeight.bold),),
                      ],
                    ),
                  )),
                );
              },
          );
        }else{
          return null;
        }
      },
    );
  }

  Future<Pokedex> getPokemon() async {
    var response = await http.get(url);
    Map<String, dynamic> decodedJson = jsonDecode(response.body);
    pokedex = Pokedex.fromJson(decodedJson);
    return pokedex;
  }
}

