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
  List<Pokeinfo> pokeinfos = [];

  alterTheme(ThemeType? type_) async {
    themeDefault.alterTheme(type_ ?? ThemeType.poke);
    await storage.setItem('ThemeType', type_.toString());
    notifyListeners();
  }

  getLinks({int offset = 0, int limit = 100}) async {
    if (storage.getItem('app_init') == null) {
      return;
    }

    print(storage.getItem('app_init'));

    var response =
        await _apiRepository.getPokemons(offset: offset, limit: limit);
    pokeGenericResponse =
        PokeGenericResponse.joinToRecursiveData(pokeGenericResponse, response);

    var pokemons = storage.getItem('pokemons');

    if (pokemons != null && pokemons['count'] == response.count) {
      pokeGenericResponse = PokeGenericResponse.fromJson(pokemons);
    } else if (offset <= pokeGenericResponse.count) {
      var nOffset = offset + 100;
      await getLinks(limit: 100, offset: nOffset);
      return;
    }

    print(storage.getItem('pokeinfos'));
    List<Pokeinfo> pkInfos = (storage.getItem('pokeinfos') as List)
        .map((obj) => Pokeinfo.fromJson(obj))
        .toList();
    pkInfos = await getPokeinfosByUrl(pokeGenericResponse.results
            ?.sublist(0, 20)
            .where(
                (element) => !pkInfos.any((pkIf) => element.name != pkIf.name))
            .map((e) => e.url)
            .toList() ??
        []);

    await storage.setItem('pokeinfos', pkInfos);
    await storage.setItem('pokemons', pokeGenericResponse);

    pokeinfos.addAll(pkInfos);

    notifyListeners();
  }

  Future<List<Pokeinfo>> getPokeinfosByUrl(List<String> urls) async {
    List<Pokeinfo> pokeinfos_ = [];

    for (String url in urls) {
      await _apiRepository
          .getPokemonByUrl(url)
          .then((value) => pokeinfos_.add(value));
    }

    return pokeinfos_;
  }
}
