import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:pokemon/Models/pokemon_details_model.dart';

Future<PokemonDetailsModel?> getDetails(String url) async {
  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      if (response.body != null && response.body.isNotEmpty) {
        print(response.body);
        print(PokemonDetailsModel.fromJson(json.decode(response.body)));
        return PokemonDetailsModel.fromJson(json.decode(response.body));
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
