import 'package:ploff_app/src/data/dto/banners_model.dart';

class BannersIntites {
  String? id;
  Title? title;
  String? position;
  String? image;
  String? url;
  bool? active;
  String? createdAt;
  String? updatedAt;
  String? shipperId;
  String? about;
  BannersIntites({
    this.id,
    this.title,
    this.position,
    this.image,
    this.url,
    this.active,
    this.createdAt,
    this.updatedAt,
    this.shipperId,
    this.about,
  });
}
