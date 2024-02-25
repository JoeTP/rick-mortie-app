import 'package:breaking_bad_app/config/text_styles/text_styles.dart';
import 'package:breaking_bad_app/constants/routs.dart';
import 'package:flutter/material.dart';

import '../../data/models/characters_model.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  CharacterItem({required this.character, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: InkWell(
        onTap: () => Navigator.pushNamed(context, characterDetailsScreen,
            arguments: character),
        child: Hero(
          tag: character.id.toString(),
          child: GridTile(
            child: Container(
              color: Colors.grey,
              // child: character.image!.isNotEmpty? Image.network(character.image!) : CircularProgressIndicator(),
              child: character.image!.isNotEmpty
                  ? FadeInImage.assetNetwork(
                      placeholderFit: BoxFit.cover,
                      placeholder: 'assets/images/loading.gif',
                      image: character.image!,
                      fit: BoxFit.cover,
                    )
                  : Container(),
            ),
            footer: Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              color: Colors.black54,
              alignment: Alignment.bottomCenter,
              child: MediumText(
                fontWeight: FontWeight.bold,
                text: character.name!,
                overflow: TextOverflow.ellipsis,
                maxLines: 2,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
