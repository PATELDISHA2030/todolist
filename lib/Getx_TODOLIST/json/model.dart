import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class model_data {
  String? title;
  String? dec;
  int? number;
  String? id;

  model_data({this.title, this.dec, this.number, this.id});

  model_data.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    dec = json['dec'];
    number = json['number'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['dec'] = this.dec;
    data['number'] = this.number;
    data['id'] = this.id;
    return data;
  }
}
