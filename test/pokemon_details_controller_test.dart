import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:pokemon/Controller/pokemon_details_controller.dart';
import 'package:pokemon/Models/pokemon_details_model.dart';

void main() {
  group('Pokemon Details Controller -', () {
    group('getDetails function -', () {
      test(
        'given PokemonDetailsController class when getDetails function is called and status code is 200 then a PokemonDetailsModel should be returned',
        () async {
          // Arrange
          final mockHTTPClient = MockClient((request) async {
            return http.Response('''
            {
              "name": "Bulbasaur",
              "url": "https://pokeapi.co/api/v2/pokemon/1/",
              "height": 7,
              "weight": 69
            }
            ''', 200);
          });

          // Act
          final pokemonDetails = await getDetails(
              "https://pokeapi.co/api/v2/pokemon/1/", mockHTTPClient);

          // Assert
          expect(pokemonDetails, isA<PokemonDetailsModel>());
        },
      );

      test(
        'given PokemonDetailsController class when getDetails function is called and status code is not 200 then an exception should be thrown',
        () async {
          // Arrange
          final mockHTTPClient = MockClient((request) async {
            return http.Response('{}', 500);
          });

          // Act & Assert
          expect(
            () async => await getDetails(
                "https://pokeapi.co/api/v2/pokemon/1/", mockHTTPClient),
            throwsA(isA<Exception>()),
          );
        },
      );
    });
  });
}
