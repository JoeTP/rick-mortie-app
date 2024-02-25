import 'package:breaking_bad_app/data/models/characters_model.dart';
import 'package:breaking_bad_app/logics/cubit/characters_cubit.dart';
import 'package:breaking_bad_app/presentation/widgets/character_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Character> allCharacters = [];
  List<Character> searchForChar = [];
  bool isSearching = false;
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<CharactersCubit>(context).getAllCharacters();
  }

  //? Search Functions
  void startSearch() {
    ModalRoute.of(context)!
        .addLocalHistoryEntry(LocalHistoryEntry(onRemove: stopSearch));
    setState(() {
      isSearching = true;
    });
  }

  void stopSearch() {
    searchController.clear();
    setState(() {
      isSearching = false;
    });
  }

  void getSearchResult(String searchValue) {
    searchForChar = allCharacters
        .where((character) =>
            character.name!.toLowerCase().startsWith(searchValue))
        .toList();
    setState(() {});
    print('test1:' + searchForChar.toString());
  }

  Widget buildSearchBar() {
    return TextField(
      controller: searchController,
      autofocus: true,
      onChanged: (v) {
        getSearchResult(v);
        setState(() {});
      },
      cursorColor: Colors.grey,
      style: TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: 'Search for Character',
        hintStyle: TextStyle(color: Colors.white),
        border: InputBorder.none,
      ),
    );
  }

  //?::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

  Widget _buildBlocWidget() {
    return BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        if (state is CharactersLoaded) {
          allCharacters = state.characters;
          // print(allCharacters.first.name);
          return _buildCharactersList();
        } else {
          return _showLoadingIndicator();
        }
      },
    );
  }

  Widget _showLoadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildCharactersList() {
    return SingleChildScrollView(
      child: Column(
        children: [
          GridView.builder(
            shrinkWrap: true,
            physics: ClampingScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
            ),
            itemBuilder: (context, index) => CharacterItem(
                character: searchController.text.isEmpty
                    ? allCharacters[index]
                    : searchForChar[index]),
            itemCount: searchController.text.isEmpty
                ? allCharacters.length
                : searchForChar.length,
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(searchController.text);
    // print('all chars are: ' + allCharacters.toString());
    return Scaffold(
      appBar: AppBar(
        elevation: 2,
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    searchController.clear();
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.clear))
              : IconButton(
                  onPressed: () {
                    startSearch();
                  },
                  icon: Icon(Icons.search))
        ],
        title: isSearching ? buildSearchBar() : Text('Characters'),
      ),
      body: _buildBlocWidget(),
    );
  }
}
