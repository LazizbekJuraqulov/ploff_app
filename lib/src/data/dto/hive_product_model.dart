// To parse this JSON data, do
//
//     final hiveProduct = hiveProductFromJson(jsonString);

import 'dart:convert';

import 'package:hive/hive.dart';
part 'hive_product_model.g.dart';

HiveProduct hiveProductFromJson(String str) => HiveProduct.fromJson(json.decode(str));

String hiveProductToJson(HiveProduct data) => json.encode(data.toJson());
@HiveType(typeId: 0)
class HiveProduct {
    HiveProduct({
        required this.id,
        required this.slug,
        required this.title,
        required this.code,
        required this.description,
        required this.categories,
        this.brand,
        required this.isDivisible,
        required this.count,
        required this.tags,
        this.measurement,
        this.rate,
        required this.inPrice,
        required this.outPrice,
        required this.image,
        required this.gallery,
        required this.favourites,
        required this.active,
        required this.order,
        required this.createdAt,
        required this.iikoId,
        required this.jowiId,
        required this.shipperId,
        required this.priceChangers,
        required this.currency,
        required this.type,
        required this.properties,
        required this.productProperty,
        required this.iikoSourceActionId,
        required this.iikoGroupId,
        required this.activeInMenu,
        required this.offAlways,
        required this.fromTime,
        required this.toTime,
        required this.ikpu,
        required this.packageCode,
        required this.variantProducts,
        required this.parentId,
        required this.hasModifier,
        required this.rkeeperId,
    });
    @HiveField(0)
    String id;
    @HiveField(1)
    String slug;
    @HiveField(2)
    Description title;
    @HiveField(3)
    String code;
    @HiveField(4)
    Description description;
    @HiveField(5)
    List<Category> categories;
    @HiveField(6)
    dynamic brand;
    @HiveField(7)
    bool isDivisible;
    @HiveField(8)
    String count;
    @HiveField(9)
    List<dynamic> tags;
    @HiveField(10)
    dynamic measurement;
    @HiveField(11)
    dynamic rate;
    @HiveField(12)
    int inPrice;
    @HiveField(13)
    int outPrice;
    @HiveField(14)
    String image;
    @HiveField(15)
    List<dynamic> gallery;
    @HiveField(16)
    List<dynamic> favourites;
    @HiveField(17)
    bool active;
    @HiveField(18)
    String order;
    @HiveField(19)
    String createdAt;
    @HiveField(20)
    String iikoId;
    @HiveField(21)
    String jowiId;
    @HiveField(22)
    String shipperId;
    @HiveField(23)
    List<dynamic> priceChangers;
    @HiveField(24)
    String currency;
    @HiveField(25)
    String type;
    @HiveField(26)
    List<dynamic> properties;
    @HiveField(27)
    List<dynamic> productProperty;
    @HiveField(28)
    String iikoSourceActionId;
    @HiveField(29)
    String iikoGroupId;
    @HiveField(30)
    bool activeInMenu;
    @HiveField(31)
    bool offAlways;
    @HiveField(32)
    String fromTime;
    @HiveField(33)
    String toTime;
    @HiveField(34)
    String ikpu;
    @HiveField(35)
    String packageCode;
    @HiveField(36)
    List<dynamic> variantProducts;
    @HiveField(37)
    String parentId;
    @HiveField(38)
    bool hasModifier;
    @HiveField(39)
    String rkeeperId;

    factory HiveProduct.fromJson(Map<String, dynamic> json) => HiveProduct(
        id: json["id"],
        slug: json["slug"],
        title: Description.fromJson(json["title"]),
        code: json["code"],
        description: Description.fromJson(json["description"]),
        categories: List<Category>.from(json["categories"].map((x) => Category.fromJson(x))),
        brand: json["brand"],
        isDivisible: json["is_divisible"],
        count: json["count"],
        tags: List<dynamic>.from(json["tags"].map((x) => x)),
        measurement: json["measurement"],
        rate: json["rate"],
        inPrice: json["in_price"],
        outPrice: json["out_price"],
        image: json["image"],
        gallery: List<dynamic>.from(json["gallery"].map((x) => x)),
        favourites: List<dynamic>.from(json["favourites"].map((x) => x)),
        active: json["active"],
        order: json["order"],
        createdAt: json["created_at"],
        iikoId: json["iiko_id"],
        jowiId: json["jowi_id"],
        shipperId: json["shipper_id"],
        priceChangers: List<dynamic>.from(json["price_changers"].map((x) => x)),
        currency: json["currency"],
        type: json["type"],
        properties: List<dynamic>.from(json["properties"].map((x) => x)),
        productProperty: List<dynamic>.from(json["product_property"].map((x) => x)),
        iikoSourceActionId: json["iiko_source_action_id"],
        iikoGroupId: json["iiko_group_id"],
        activeInMenu: json["active_in_menu"],
        offAlways: json["off_always"],
        fromTime: json["from_time"],
        toTime: json["to_time"],
        ikpu: json["ikpu"],
        packageCode: json["package_code"],
        variantProducts: List<dynamic>.from(json["variant_products"].map((x) => x)),
        parentId: json["parent_id"],
        hasModifier: json["has_modifier"],
        rkeeperId: json["rkeeper_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title.toJson(),
        "code": code,
        "description": description.toJson(),
        "categories": List<dynamic>.from(categories.map((x) => x.toJson())),
        "brand": brand,
        "is_divisible": isDivisible,
        "count": count,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "measurement": measurement,
        "rate": rate,
        "in_price": inPrice,
        "out_price": outPrice,
        "image": image,
        "gallery": List<dynamic>.from(gallery.map((x) => x)),
        "favourites": List<dynamic>.from(favourites.map((x) => x)),
        "active": active,
        "order": order,
        "created_at": createdAt,
        "iiko_id": iikoId,
        "jowi_id": jowiId,
        "shipper_id": shipperId,
        "price_changers": List<dynamic>.from(priceChangers.map((x) => x)),
        "currency": currency,
        "type": type,
        "properties": List<dynamic>.from(properties.map((x) => x)),
        "product_property": List<dynamic>.from(productProperty.map((x) => x)),
        "iiko_source_action_id": iikoSourceActionId,
        "iiko_group_id": iikoGroupId,
        "active_in_menu": activeInMenu,
        "off_always": offAlways,
        "from_time": fromTime,
        "to_time": toTime,
        "ikpu": ikpu,
        "package_code": packageCode,
        "variant_products": List<dynamic>.from(variantProducts.map((x) => x)),
        "parent_id": parentId,
        "has_modifier": hasModifier,
        "rkeeper_id": rkeeperId,
    };
}
@HiveType(typeId: 1)
class Category {
    Category({
        required this.id,
        required this.slug,
        required this.title,
        required this.description,
        required this.parentId,
        required this.image,
        required this.propertyIds,
        required this.active,
        required this.orderNo,
        required this.createdAt,
        required this.shipperId,
        required this.iikoId,
        required this.jowiId,
    });
    @HiveField(40)
    String id;
    @HiveField(41)
    String slug;
    @HiveField(42)
    Description title;
    @HiveField(43)
    Description description;
    @HiveField(44)
    String parentId;
    @HiveField(45)
    String image;
    @HiveField(46)
    List<dynamic> propertyIds;
    @HiveField(47)
    bool active;
    @HiveField(48)
    String orderNo;
    @HiveField(49)
    String createdAt;
    @HiveField(50)
    String shipperId;
    @HiveField(51)
    String iikoId;
    @HiveField(53)
    String jowiId;

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        slug: json["slug"],
        title: Description.fromJson(json["title"]),
        description: Description.fromJson(json["description"]),
        parentId: json["parent_id"],
        image: json["image"],
        propertyIds: List<dynamic>.from(json["property_ids"].map((x) => x)),
        active: json["active"],
        orderNo: json["order_no"],
        createdAt: json["created_at"],
        shipperId: json["shipper_id"],
        iikoId: json["iiko_id"],
        jowiId: json["jowi_id"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "slug": slug,
        "title": title.toJson(),
        "description": description.toJson(),
        "parent_id": parentId,
        "image": image,
        "property_ids": List<dynamic>.from(propertyIds.map((x) => x)),
        "active": active,
        "order_no": orderNo,
        "created_at": createdAt,
        "shipper_id": shipperId,
        "iiko_id": iikoId,
        "jowi_id": jowiId,
    };
}
@HiveType(typeId: 2)
class Description {
    Description({
        required this.uz,
        required this.ru,
        required this.en,
    });
    @HiveField(54)
    String uz;
    @HiveField(55)
    String ru;
    @HiveField(56)
    String en;

    factory Description.fromJson(Map<String, dynamic> json) => Description(
        uz: json["uz"],
        ru: json["ru"],
        en: json["en"],
    );

    Map<String, dynamic> toJson() => {
        "uz": uz,
        "ru": ru,
        "en": en,
    };
}
