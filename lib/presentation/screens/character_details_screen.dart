import 'package:breaking_bad_app/data/models/characters_model.dart';
import 'package:flutter/material.dart';

class CharacterDetailsScreen extends StatelessWidget {
  final Character character;

  CharacterDetailsScreen({required this.character, super.key});

  Widget buildSliverAppBar() {
    return SliverAppBar(
      // centerTitle: false,
      expandedHeight: 600,
      pinned: true,
      stretch: true,
      // backgroundColor: Colors.white,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        title: Text(character.name.toString()),
        background: Hero(
          tag: character.id.toString(),
          child: Image.network(
            character.image.toString(),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }

  getEpisodes(){

  }




Widget characterInfo (String key, String value, double divider){
    return Column(
      children: [
        Row(
          children: [
            Text(
              // key: mywidgetkey,
              key + ": ",
              style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),
            ),
            Text(value,

              style: TextStyle(fontSize: 17),
            )
          ],
        ),
        Divider(
          height: 25,
            thickness: 5,
            // indent: 100,
            endIndent: divider ,
          color: Colors.red,
        ),
        SizedBox(height: 10,)
      ],
    );
}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          buildSliverAppBar(),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: EdgeInsets.all(14).copyWith(bottom: 0),
                  padding: EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //species
                      characterInfo('Species', character.species!,273),
                      //gender
                      characterInfo('Gender', character.gender!,280),
                      //origin
                      characterInfo('Origin', character.origin!.name!,290),
                      //location
                      characterInfo('Location', character.location!.location!,265),
                      //status
                      characterInfo('Status', character.status!,285),
                      SizedBox(height: 500,)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
