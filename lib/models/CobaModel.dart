import 'dart:convert';

Coba cobaFromJson(String str) => Coba.fromJson(json.decode(str));

String cobaToJson(Coba data) => json.encode(data.toJson());

class Coba {
    Coba({
        this.id,
        this.title,
        this.cover,
        this.syno,
    });

    int? id;
    String? title;
    String? cover;
    String? syno;

    factory Coba.fromJson(Map<String, dynamic> json) => Coba(
        id: json["film_id"],
        title: json["film_title"],
        cover: json["film_cover"],
        syno: json["film_syn"],
    );

    Map<String, dynamic> toJson() => {
        "film_id": id,
        "film_title": title,
        "film_cover": cover,
        "film_syn": syno,
    };
}
