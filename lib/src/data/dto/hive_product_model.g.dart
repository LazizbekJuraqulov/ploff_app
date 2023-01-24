// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_product_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HiveProductAdapter extends TypeAdapter<HiveProduct> {
  @override
  final int typeId = 0;

  @override
  HiveProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HiveProduct(
      id: fields[0] as String,
      slug: fields[1] as String,
      title: fields[2] as Description,
      code: fields[3] as String,
      description: fields[4] as Description,
      categories: (fields[5] as List).cast<Category>(),
      brand: fields[6] as dynamic,
      isDivisible: fields[7] as bool,
      count: fields[8] as String,
      tags: (fields[9] as List).cast<dynamic>(),
      measurement: fields[10] as dynamic,
      rate: fields[11] as dynamic,
      inPrice: fields[12] as int,
      outPrice: fields[13] as int,
      image: fields[14] as String,
      gallery: (fields[15] as List).cast<dynamic>(),
      favourites: (fields[16] as List).cast<dynamic>(),
      active: fields[17] as bool,
      order: fields[18] as String,
      createdAt: fields[19] as String,
      iikoId: fields[20] as String,
      jowiId: fields[21] as String,
      shipperId: fields[22] as String,
      priceChangers: (fields[23] as List).cast<dynamic>(),
      currency: fields[24] as String,
      type: fields[25] as String,
      properties: (fields[26] as List).cast<dynamic>(),
      productProperty: (fields[27] as List).cast<dynamic>(),
      iikoSourceActionId: fields[28] as String,
      iikoGroupId: fields[29] as String,
      activeInMenu: fields[30] as bool,
      offAlways: fields[31] as bool,
      fromTime: fields[32] as String,
      toTime: fields[33] as String,
      ikpu: fields[34] as String,
      packageCode: fields[35] as String,
      variantProducts: (fields[36] as List).cast<dynamic>(),
      parentId: fields[37] as String,
      hasModifier: fields[38] as bool,
      rkeeperId: fields[39] as String,
    );
  }

  @override
  void write(BinaryWriter writer, HiveProduct obj) {
    writer
      ..writeByte(40)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.slug)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.code)
      ..writeByte(4)
      ..write(obj.description)
      ..writeByte(5)
      ..write(obj.categories)
      ..writeByte(6)
      ..write(obj.brand)
      ..writeByte(7)
      ..write(obj.isDivisible)
      ..writeByte(8)
      ..write(obj.count)
      ..writeByte(9)
      ..write(obj.tags)
      ..writeByte(10)
      ..write(obj.measurement)
      ..writeByte(11)
      ..write(obj.rate)
      ..writeByte(12)
      ..write(obj.inPrice)
      ..writeByte(13)
      ..write(obj.outPrice)
      ..writeByte(14)
      ..write(obj.image)
      ..writeByte(15)
      ..write(obj.gallery)
      ..writeByte(16)
      ..write(obj.favourites)
      ..writeByte(17)
      ..write(obj.active)
      ..writeByte(18)
      ..write(obj.order)
      ..writeByte(19)
      ..write(obj.createdAt)
      ..writeByte(20)
      ..write(obj.iikoId)
      ..writeByte(21)
      ..write(obj.jowiId)
      ..writeByte(22)
      ..write(obj.shipperId)
      ..writeByte(23)
      ..write(obj.priceChangers)
      ..writeByte(24)
      ..write(obj.currency)
      ..writeByte(25)
      ..write(obj.type)
      ..writeByte(26)
      ..write(obj.properties)
      ..writeByte(27)
      ..write(obj.productProperty)
      ..writeByte(28)
      ..write(obj.iikoSourceActionId)
      ..writeByte(29)
      ..write(obj.iikoGroupId)
      ..writeByte(30)
      ..write(obj.activeInMenu)
      ..writeByte(31)
      ..write(obj.offAlways)
      ..writeByte(32)
      ..write(obj.fromTime)
      ..writeByte(33)
      ..write(obj.toTime)
      ..writeByte(34)
      ..write(obj.ikpu)
      ..writeByte(35)
      ..write(obj.packageCode)
      ..writeByte(36)
      ..write(obj.variantProducts)
      ..writeByte(37)
      ..write(obj.parentId)
      ..writeByte(38)
      ..write(obj.hasModifier)
      ..writeByte(39)
      ..write(obj.rkeeperId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HiveProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryAdapter extends TypeAdapter<Category> {
  @override
  final int typeId = 1;

  @override
  Category read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Category(
      id: fields[40] as String,
      slug: fields[41] as String,
      title: fields[42] as Description,
      description: fields[43] as Description,
      parentId: fields[44] as String,
      image: fields[45] as String,
      propertyIds: (fields[46] as List).cast<dynamic>(),
      active: fields[47] as bool,
      orderNo: fields[48] as String,
      createdAt: fields[49] as String,
      shipperId: fields[50] as String,
      iikoId: fields[51] as String,
      jowiId: fields[53] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Category obj) {
    writer
      ..writeByte(13)
      ..writeByte(40)
      ..write(obj.id)
      ..writeByte(41)
      ..write(obj.slug)
      ..writeByte(42)
      ..write(obj.title)
      ..writeByte(43)
      ..write(obj.description)
      ..writeByte(44)
      ..write(obj.parentId)
      ..writeByte(45)
      ..write(obj.image)
      ..writeByte(46)
      ..write(obj.propertyIds)
      ..writeByte(47)
      ..write(obj.active)
      ..writeByte(48)
      ..write(obj.orderNo)
      ..writeByte(49)
      ..write(obj.createdAt)
      ..writeByte(50)
      ..write(obj.shipperId)
      ..writeByte(51)
      ..write(obj.iikoId)
      ..writeByte(53)
      ..write(obj.jowiId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DescriptionAdapter extends TypeAdapter<Description> {
  @override
  final int typeId = 2;

  @override
  Description read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Description(
      uz: fields[54] as String,
      ru: fields[55] as String,
      en: fields[56] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Description obj) {
    writer
      ..writeByte(3)
      ..writeByte(54)
      ..write(obj.uz)
      ..writeByte(55)
      ..write(obj.ru)
      ..writeByte(56)
      ..write(obj.en);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DescriptionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
