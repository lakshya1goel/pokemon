import 'package:flutter/material.dart';
import 'package:pokemon/Controller/pokemon_controller.dart';
import 'package:pokemon/Models/pokemon_list_model.dart';
import 'package:pokemon/Views/details_page.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Welcome to the World of Pokemons!"),
      ),
      body: FutureBuilder<PokemonListModel?> (
        future: getData(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else {
            return ListView.builder(
              itemCount: snapshot.data!.results!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(snapshot.data!.results![index].name!),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => DetailsPage(url: snapshot.data!.results![index].url!)));
                    },
                  ),
                );
              },
            );
          }
        },
      )
    );
  }
}
