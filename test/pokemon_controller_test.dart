import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pokemon/Controller/pokemon_controller.dart';
import 'package:pokemon/Models/pokemon_list_model.dart';

void main() {
  group('Pokemon Controller -', () {
    group('getData function -', () {
      test(
        'given PokemonController class when getData function is called and status code is 200 then a PokemonListModel should be returned',
        () async {
          // Arrange
          final mockHTTPClient = MockClient((request) async {
            return http.Response('''
            {
              "count": 1,
              "next": null,
              "previous": null,
              "results": [
                {
                  "name": "Bulbasaur",
                  "url": "https://pokeapi.co/api/v2/pokemon/1/"
                },
                {
                  "name": "Ivysaur",
                  "url": "https://pokeapi.co/api/v2/pokemon/2/"
                }
              ]
            }
            ''', 200);
          });

          // Act
          final pokemonList = await getData(mockHTTPClient);

          // Assert
          expect(pokemonList, isA<PokemonListModel>());
          expect(pokemonList.results, isNotNull);
        },
      );

      test(
        'given PokemonController class when getData function is called and status code is not 200 then an exception should be thrown',
        () async {
          // Arrange
          final mockHTTPClient = MockClient((request) async {
            return http.Response('{}', 500);
          });

          // Act & Assert
          expect(
            () async => await getData(mockHTTPClient),
            throwsA(isA<Exception>()),
          );
        },
      );
    });
  });

}
