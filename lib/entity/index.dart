import 'package:flutter/animation.dart';
import 'package:pokecommerce/entity/pokeget.dart';

export 'package:pokecommerce/entity/pokeget.dart';

class PokeType {
  String type = "";
  Color? color;
  TextColor textColor = TextColor.black;

  PokeType({
    this.color,
    this.type = "",
    this.textColor = TextColor.black,
  });
}

enum TextColor {
  white,
  black,
}

class PokeGenericResponse {
  final int count;
  int total;
  final String next;
  final String previus;
  final List<PokeGet>? results;

  PokeGenericResponse(
      {this.count = 0,
      this.total = 0,
      this.next = "",
      this.previus = "",
      this.results});

  factory PokeGenericResponse.fromJson(Map<String, dynamic> json) {
    if (json.isEmpty) return PokeGenericResponse();
    var array = json['results'] as List;
    List<PokeGet> results_ = [];
    if (array.isNotEmpty) {
      results_ = (array).map((data) => PokeGet.fromJson(data)).toList();
    }
    return PokeGenericResponse(
        count: json['count'],
        total: results_.length,
        next: json['next'] ?? '',
        previus: json['previus'] ?? '',
        results: results_);
  }

  Map<String, dynamic> toJson() {
    return {
      'count': count,
      'next': next,
      'previus': previus,
      'results': results,
      'total': results?.length ?? 0
    };
  }

  factory PokeGenericResponse.joinToRecursiveData(
      PokeGenericResponse obj, PokeGenericResponse objLinked) {
    return PokeGenericResponse(
        count: objLinked.count,
        next: objLinked.next,
        previus: objLinked.previus,
        results: [...(obj.results ?? []), ...(objLinked.results ?? [])]);
  }
}


// class PokeGenericResponse<T> : T class, new() {
//   final int count;
//   final String next;
//   final String previus;
//   final List<T>? results;

//   PokeGenericResponse(
//       {this.count = 0, this.next = "", this.previus = "", this.results});

//   factory PokeGenericResponse.fromJson(Map json) {
//     print(json);
//     var array = json['results'] as List;
//     List<T> results_ = [];
//     if (array.isNotEmpty) {
//       results_ = (array).map((data) => T.fromJson(data)).toList();
//     }
//     return PokeGenericResponse<T>(
//         count: json['count'],
//         next: json['next'],
//         previus: json['previus'],
//         results: results_);
//   }

//   Map toJson() {
//     return {
//       'count': count,
//       'next': next,
//       'previus': previus,
//       'results': results
//     };
//   }
// }
