import 'package:pokecommerce/entity/index.dart';
import 'package:pokecommerce/entity/pokeinfos.dart';

import 'api_provider.dart';

class ApiRepository {
  final _provider = ApiProvider();

  Future<PokeGenericResponse> getPokemons(
      {int? offset = 0, int? limit = 100}) async  {
    var response = await _provider.getPokemons(offset: offset, limit: limit);
    return response;
  }

  Future<Pokeinfo> getPokemonByName(String name) async  {
    var response = await _provider.getPokemonByName(name);
    return response;
  }

  Future<Pokeinfo> getPokemonByUrl(String url) async  {
    var response = await _provider.getPokemonByUrl(url);
    return response;
  }

  // Future<List<DevModel>> fetchDevList() {
  //   return _provider.fetchDevList();
  // }
}

class NetworkError extends Error {}
