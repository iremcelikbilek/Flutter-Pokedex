import 'package:flutter/material.dart';
import 'package:flutter_pokedex/models/pokedex.dart';

class PokemonDetail extends StatelessWidget {

  Pokemon pokemon;

  PokemonDetail({this.pokemon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo,
      appBar: AppBar(title: Text(pokemon.name, textAlign: TextAlign.center,),elevation: 0,),
      body: buildBody(context),
    );
  }

  Widget buildBody(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned(
          height: MediaQuery.of(context).size.height * (3/4),
          width: MediaQuery.of(context).size.width -20,
          left: 10,
          top: MediaQuery.of(context).size.height * 0.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            elevation: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(height: 70,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(pokemon.name, style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Height : " + pokemon.height, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("Weight : " + pokemon.weight, style: TextStyle(fontWeight: FontWeight.bold),),
                ),
                Text("Types : " , style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.type.map((type) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(backgroundColor: Colors.indigo,label: Text(type)),
                  )).toList(),),
                Text("Pre Evolution : ", style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.prevEvolution != null ?
                  pokemon.prevEvolution.map((evolution) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(backgroundColor: Colors.indigo,label: Text(evolution.name)),
                  )).toList()
                      : [Chip(backgroundColor: Colors.blueGrey,label: Text("İlk Hali"),)],
                ),
                Text("Next Evolution : ", style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.nextEvolution != null ?
                  pokemon.nextEvolution.map((evolution) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(backgroundColor: Colors.indigo,label: Text(evolution.name)),
                  )).toList()
                      : [Chip(backgroundColor: Colors.blueGrey,label: Text("Son Hali"),)],
                ),
                Text("Weaknesses : ", style: TextStyle(fontWeight: FontWeight.bold),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: pokemon.weaknesses.map((weaknesses) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Chip(backgroundColor: Colors.indigo,label: Text(weaknesses)),
                  )).toList(),

                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.topCenter,
          child: Container(
            width: 150,
            height: 150,
            child:  Hero(tag: pokemon.img, child: Image.network(pokemon.img,fit: BoxFit.contain)),
          ),
        ),
      ],
    );
  }
}
