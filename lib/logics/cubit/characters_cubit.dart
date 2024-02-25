import 'package:bloc/bloc.dart';
import 'package:breaking_bad_app/data/models/characters_model.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import '../../data/repository/characters_repository.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit(this.charactersRepository) : super(CharactersInitial());

  final CharactersRepository charactersRepository;
   List<Character> characters = [];

  List<Character> getAllCharacters() {
    charactersRepository.getAllCharactersFromRepo().then((characters) {
      emit(CharactersLoaded(characters));

      this.characters = characters;
    });

    return characters;
  }
}
