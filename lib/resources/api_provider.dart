import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:pokecommerce/entity/index.dart';
import 'package:pokecommerce/entity/pokeinfos.dart';

var urlGet = 'https://pokeapi.co/api/v2/pokemon';

class ApiProvider {
  final Dio _dio = Dio();

  Future<PokeGenericResponse> getPokemons(
      {int? offset = 0, int? limit = 100}) async {
    try {
      var response = await _dio.get('$urlGet?offset=$offset&limit=$limit');
      return PokeGenericResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");

      throw Exception(error);
    }
  }

  Future<Pokeinfo> getPokemonByName(String name) async {
    try {
      var response = await _dio.get('$urlGet/$name');
      return Pokeinfo.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");

      throw Exception(error);
    }
  }

  Future<Pokeinfo> getPokemonByUrl(String url) async {
    try {
      var response = await _dio.get(url);
      return Pokeinfo.fromJson(response.data);
    } catch (error, stacktrace) {
      debugPrint("Exception occured: $error stackTrace: $stacktrace");

      throw Exception(error);
    }
  }

  // Future<List<DevModel>> fetchDevList() async {
  //   try {
  //     Response response = await _dio.get(_url + '/dev');
  //     var array = jsonDecode(response.data) as List;
  //     var devs = List<DevModel>.empty();
  //     if (array.isNotEmpty) {
  //       devs = (array).map((data) => DevModel.fromJson(data)).toList();
  //     }
  //     return devs;
  //   } catch (error, stacktrace) {-
  //     print("Exception occured: $error stackTrace: $stacktrace");

  //     throw Exception(error);
  //   }
}
