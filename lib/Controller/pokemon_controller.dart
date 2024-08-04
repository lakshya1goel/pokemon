import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/pokemon_list_model.dart';

Future<PokemonListModel> getData(http.Client http) async {
  final response =
      await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));

  if (response.statusCode == 200) {
    final jsonResponse = json.decode(response.body);
    return PokemonListModel.fromJson(jsonResponse);
  }
  throw Exception('Failed to load data');
}
