class Coba {
  int? id;
  String? title;
  String? cover;
  String? syno;

  Coba.fromJson(Map<String, dynamic> json) {
    id = json['film_id'];
    title = json['film_title'];
    cover = json['film_cover'];
    syno = json['film_syn'];
  }

}

