class PokeGet {
  final String name;
  final String url;

  PokeGet({this.name = "", this.url = ""});

  factory PokeGet.fromJson(Map json) {
    return PokeGet(
        name: json['name'] != null ? json['name'] : "",
        url: json['url'] != null ? json['url'] : "");
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    return data;
  }
}
