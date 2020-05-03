import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:flutterappapimarvel/model/Characteres.dart';
import 'package:http/http.dart' as http;

Future<Characteres> fetchCharacteres() async {
  final response = await http.get(
      'https://gateway.marvel.com:443/v1/public/characters?apikey=95ce2cfa431bdd01a04ac987734f6f12&hash=42387f422587833d53aafa5da124b260&ts=1');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var jsonList = Characteres.fromJson(json.decode(response.body));
    return jsonList /*.map((element) => Characteres.fromJson(element)).toList()*/;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load album');
  }
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyhomePage(),
    );
  }
}

class MyhomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista personajes"),
      ),
      body: Center(
        child: FutureBuilder<Characteres>(
          future: fetchCharacteres(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data.data.count,
                  itemBuilder: (BuildContext context, int index) {
                    var character = snapshot.data.data.results[index];
                    if(snapshot.data.data.results[index].description == ""){
                      snapshot.data.data.results[index].description = "Este personaje no disponde de descripcion";
                    }
                    return CharacterWidget(character);
                  });

              //return Text("Total : "+snapshot.data.data.total.toString());

            } else if (snapshot.hasError) {
              return Text("${snapshot.error}");
            } else {
              // By default, show a loading spinner.
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

class CharacterWidget extends StatelessWidget {
  final Results character;
  var linkImage;

  CharacterWidget(this.character);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    linkImage = character.thumbnail.path + "." + character.thumbnail.extension;
    return Padding(
      padding: const EdgeInsets.all(3.0),
      child: ListTile(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => PerfilCharacter(character),
          ));
        },
        title: Text(character.name),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(linkImage),
          maxRadius: 30.0,
        ),
      ),
    );
  }
}


//***************************

class PerfilCharacter extends StatelessWidget {
  Results personaje;

  PerfilCharacter(this.personaje);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          personaje.name
        ),
      ),

      body: Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[

            Image.network(personaje.thumbnail.path+"."+personaje.thumbnail.extension),
            Text("\n"+personaje.description),

          ]
      ),
      ),

    );
  }
}





