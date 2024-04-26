class PublicApiModel {
  final String api;
  final String discription;
  final String auth;
  final bool http;
  final String cors;
  final String link;
  final String catagory;

  PublicApiModel(
      {required this.api,
      required this.discription,
      required this.auth,
      required this.http,
      required this.cors,
      required this.link,
      required this.catagory});

  factory PublicApiModel.fromJson(Map<String, dynamic> json) {
    return PublicApiModel(
        api: json['API'],
        discription: json['Description'],
        auth: json['Auth'],
        http: json['HTTPS'],
        cors: json['Cors'],
        link: json['Link'],
        catagory: json['Category']);
  }
}
