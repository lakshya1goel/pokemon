import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/pokemon_list_model.dart';

Future<PokemonListModel?> getData() async {
  try {
    final response = await http.get(Uri.parse("https://pokeapi.co/api/v2/pokemon"));

    if (response.statusCode == 200) {
      if (response.body != null && response.body.isNotEmpty) {
        print(response.body);
        print(PokemonListModel.fromJson(json.decode(response.body)));
        return PokemonListModel.fromJson(json.decode(response.body));
      }
      else {
        print("Error: Response body is empty");
      }
    }
    else {
      print("Error: ${response.statusCode}");
    }
  }
  catch (error) {
    print("Error: $error");
  }
  return null;
}
