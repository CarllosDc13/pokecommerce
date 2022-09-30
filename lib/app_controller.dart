import 'package:flutter/cupertino.dart';
import 'package:pokecommerce/entity/index.dart';
import 'package:pokecommerce/entity/pokeinfos.dart';
import 'package:pokecommerce/themes/index.dart';
import 'package:pokecommerce/resources/api_repository.dart';

import 'package:localstorage/localstorage.dart';

class AppController extends ChangeNotifier {
  static AppController instance = AppController();
  final ApiRepository _apiRepository = ApiRepository();
  final LocalStorage storage = LocalStorage('pokemons_links');
  int totalItem = 0;

  ThemeDefault themeDefault = ThemeDefault();
  ThemeType type = ThemeType.poke;
  PokeGenericResponse pokeGenericResponse = PokeGenericResponse();
  List<Pokeinfo> pokeinfo = [];

  alterTheme(ThemeType type_) {
    themeDefault.alterTheme(type_);
    notifyListeners();
  }

  getLinks({int offset = 0, int limit = 100}) async {
    var response =
        await _apiRepository.getPokemons(offset: offset, limit: limit);
    pokeGenericResponse =
        PokeGenericResponse.joinToRecursiveData(pokeGenericResponse, response);

    var pokemons = storage.getItem('pokemons');

      print(pokemons);
    if (pokemons != null && pokemons['count'] == response.count) {
      pokeGenericResponse = PokeGenericResponse.fromJson(pokemons);
    } else if (offset <= pokeGenericResponse.count) {
      var nOffset = offset + 100;
      await getLinks(limit: 100, offset: nOffset);
      return;
    }

    storage.setItem('pokemons', pokeGenericResponse);
    onNotifyListeners();
  }

  onNotifyListeners() => notifyListeners();

  getPokeinfos(List<String> names) async {
    var pokeinfos_ = ([]) as List;

    names
        .where((name) => pokeinfos_.any((pokeinfo) => pokeinfo['name'] != name))
        .forEach((name) async {
      pokeinfo.add(await _apiRepository.getPokemonByName(name));
    });

    // storage.setItem('pokeinfos', pokeinfo);

    onNotifyListeners();
  }
}
