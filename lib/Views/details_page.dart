import 'package:flutter/material.dart';
import 'package:pokemon/Controller/pokemon_details_controller.dart';
import 'package:pokemon/Models/pokemon_details_model.dart';

class DetailsPage extends StatefulWidget {
  final String url;
  const DetailsPage({Key? key, required this.url}) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details"),
      ),
      body: FutureBuilder<PokemonDetailsModel?> (
        future: getDetails(widget.url),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          else {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(snapshot.data!.sprites!.frontDefault??''),
                    radius: 50,
                  ),
                  Text("Name: ${snapshot.data!.name}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text("Height: ${snapshot.data!.height}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text("Weight: ${snapshot.data!.weight}",
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
