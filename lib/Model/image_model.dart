class ImageModel {
  String? image;

  ImageModel(this.image);

  ImageModel.fromJson(Map<String, dynamic> json) {
    image = json['type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['image'] = image;
    return data;
  }
}
