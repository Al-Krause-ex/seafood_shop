// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basket_item.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BasketItemAdapter extends TypeAdapter<BasketItem> {
  @override
  final int typeId = 2;

  @override
  BasketItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BasketItem(
      productId: fields[0] as String,
      productName: fields[1] as String,
      productImageUrl: fields[2] as String,
      weight: fields[3] as int,
      price: fields[4] as int,
    );
  }

  @override
  void write(BinaryWriter writer, BasketItem obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.productId)
      ..writeByte(1)
      ..write(obj.productName)
      ..writeByte(2)
      ..write(obj.productImageUrl)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BasketItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasketItem _$BasketItemFromJson(Map<String, dynamic> json) => BasketItem(
      productId: json['product_id'] as String,
      productName: json['product_name'] as String,
      productImageUrl: json['product_image_url'] as String,
      weight: json['weight'] as int,
      price: json['price'] as int,
    );

Map<String, dynamic> _$BasketItemToJson(BasketItem instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'product_name': instance.productName,
      'product_image_url': instance.productImageUrl,
      'weight': instance.weight,
      'price': instance.price,
    };
