import 'other_model.dart';

class AttributeData {
  int? id;
  String? s1;
  int? s2;
  String? s3;
  String? color;
  String? size;
  String? height;
  String? width;
  String? weight;
  String? mfg;
  String? fav;
  List<Other>? other;

  AttributeData(
      {this.id,
      this.s1,
      this.s2,
      this.s3,
      this.color,
      this.size,
      this.height,
      this.width,
      this.weight,
      this.fav,
      this.other});

  AttributeData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    s1 = json['s1'];
    s2 = json['s2'];
    s3 = json['s3'];
    color = json['color'];
    size = json['size'];
    height = json['height'];
    width = json['width'];
    weight = json['weight'];
    mfg = json['mfg'];
    fav = json['fav'];
    if (json['other'] != null) {
      other = <Other>[];
      json['other'].forEach((v) {
        other!.add(Other.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['s1'] = s1;
    data['s2'] = s2;
    data['s3'] = s3;
    data['color'] = color;
    data['size'] = size;
    data['height'] = height;
    data['width'] = width;
    data['weight'] = weight;
    data['mfg'] = mfg;
    data['fav'] = fav;
    if (other != null) {
      data['other'] = other!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
