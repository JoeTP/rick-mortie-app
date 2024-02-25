import 'package:breaking_bad_app/constants/routs.dart';
import 'package:breaking_bad_app/data/models/characters_model.dart';
import 'package:breaking_bad_app/data/repository/characters_repository.dart';
import 'package:breaking_bad_app/data/web_services/characters_web_services.dart';
import 'package:breaking_bad_app/logics/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/presentation/screens/character_details_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_layout.dart';

class AppRouter {

  late CharactersRepository charactersRepository;
  late CharactersCubit charactersCubit;

  AppRouter() {
    charactersRepository = CharactersRepository(CharactersWebServices());
    charactersCubit = CharactersCubit(charactersRepository);
  }


  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homeScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => charactersCubit,
              child: HomeScreen(),
            ),);
      case characterDetailsScreen:
        final character = settings.arguments as Character;
        return MaterialPageRoute(
          builder: (context) => CharacterDetailsScreen(character : character),);
    }
  }
}