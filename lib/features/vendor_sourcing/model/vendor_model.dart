// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class VendorModel {
  String id;
  String name;
  String image;
  VendorModel({
    required this.id,
    required this.name,
    required this.image,
  });

  VendorModel copyWith({
    String? id,
    String? name,
    String? image,
  }) {
    return VendorModel(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'image': image,
    };
  }

  factory VendorModel.fromMap(Map<String, dynamic> map) {
    return VendorModel(
      id: map['id'] as String,
      name: map['name'] as String,
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory VendorModel.fromJson(String source) => VendorModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'VendorModel(id: $id, name: $name, image: $image)';

  @override
  bool operator ==(covariant VendorModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.id == id &&
      other.name == name &&
      other.image == image;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ image.hashCode;
}
