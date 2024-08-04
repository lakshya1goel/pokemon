import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/pokemon_details_model.dart';

Future<PokemonDetailsModel?> getDetails(String url, http.Client http) async {
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    return PokemonDetailsModel.fromJson(json.decode(response.body));
  }
  throw Exception('Failed to load data');
}
