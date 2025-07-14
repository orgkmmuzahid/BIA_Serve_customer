// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

// File: place_order_model.dart

class PlaceOrderModel {

   String? fullName;
   String? phone;
   String? district;
   String? city;
   String? ward;
   String? subWard;
   String? plotApartment;
   String? marchentPickupTime;
   String? serviceType;
   double? productWieght;
   int?    quantity;
   String? itemDetails;
   String?  marchentAdressOnMap;
   String?  clientAdressOnMap;

   String? clientFullName;
   String? clientPhone;
   String? clientDistrict;
   String? clientCity;
   String? clientWard;
   String? clientSubWard;
   String? clientPlotApartment;
   String? clientPickupTime;
   String? clientServiceType;
   double? clientProductWieght;
   int?    clientQuantity;
   
  PlaceOrderModel({
    this.fullName,
    this.phone,
    this.district,
    this.city,
    this.ward,
    this.subWard,
    this.plotApartment,
    this.marchentPickupTime,
    this.serviceType,
    this.productWieght,
    this.quantity,
    this.itemDetails,
    this.marchentAdressOnMap,
    this.clientAdressOnMap,
    this.clientFullName,
    this.clientPhone,
    this.clientDistrict,
    this.clientCity,
    this.clientWard,
    this.clientSubWard,
    this.clientPlotApartment,
    this.clientPickupTime,
    this.clientServiceType,
    this.clientProductWieght,
    this.clientQuantity,
  });

  PlaceOrderModel copyWith({
    String? fullName,
    String? phone,
    String? district,
    String? city,
    String? ward,
    String? subWard,
    String? plotApartment,
    String? marchentPickupTime,
    String? serviceType,
    double? productWieght,
    int? quantity,
    String? itemDetails,
    String? marchentAdressOnMap,
    String? clientAdressOnMap,
    String? clientFullName,
    String? clientPhone,
    String? clientDistrict,
    String? clientCity,
    String? clientWard,
    String? clientSubWard,
    String? clientPlotApartment,
    String? clientPickupTime,
    String? clientServiceType,
    double? clientProductWieght,
    int? clientQuantity,
  }) {
    return PlaceOrderModel(
      fullName: fullName ?? this.fullName,
      phone: phone ?? this.phone,
      district: district ?? this.district,
      city: city ?? this.city,
      ward: ward ?? this.ward,
      subWard: subWard ?? this.subWard,
      plotApartment: plotApartment ?? this.plotApartment,
      marchentPickupTime: marchentPickupTime ?? this.marchentPickupTime,
      serviceType: serviceType ?? this.serviceType,
      productWieght: productWieght ?? this.productWieght,
      quantity: quantity ?? this.quantity,
      itemDetails: itemDetails ?? this.itemDetails,
      marchentAdressOnMap: marchentAdressOnMap ?? this.marchentAdressOnMap,
      clientAdressOnMap: clientAdressOnMap ?? this.clientAdressOnMap,
      clientFullName: clientFullName ?? this.clientFullName,
      clientPhone: clientPhone ?? this.clientPhone,
      clientDistrict: clientDistrict ?? this.clientDistrict,
      clientCity: clientCity ?? this.clientCity,
      clientWard: clientWard ?? this.clientWard,
      clientSubWard: clientSubWard ?? this.clientSubWard,
      clientPlotApartment: clientPlotApartment ?? this.clientPlotApartment,
      clientPickupTime: clientPickupTime ?? this.clientPickupTime,
      clientServiceType: clientServiceType ?? this.clientServiceType,
      clientProductWieght: clientProductWieght ?? this.clientProductWieght,
      clientQuantity: clientQuantity ?? this.clientQuantity,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'fullName': fullName,
      'phone': phone,
      'district': district,
      'city': city,
      'ward': ward,
      'subWard': subWard,
      'plotApartment': plotApartment,
      'marchentPickupTime': marchentPickupTime,
      'serviceType': serviceType,
      'productWieght': productWieght,
      'quantity': quantity,
      'itemDetails': itemDetails,
      'marchentAdressOnMap': marchentAdressOnMap,
      'clientAdressOnMap': clientAdressOnMap,
      'clientFullName': clientFullName,
      'clientPhone': clientPhone,
      'clientDistrict': clientDistrict,
      'clientCity': clientCity,
      'clientWard': clientWard,
      'clientSubWard': clientSubWard,
      'clientPlotApartment': clientPlotApartment,
      'clientPickupTime': clientPickupTime,
      'clientServiceType': clientServiceType,
      'clientProductWieght': clientProductWieght,
      'clientQuantity': clientQuantity,
    };
  }

  factory PlaceOrderModel.fromMap(Map<String, dynamic> map) {
    return PlaceOrderModel(
      fullName: map['fullName'] != null ? map['fullName'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
      district: map['district'] != null ? map['district'] as String : null,
      city: map['city'] != null ? map['city'] as String : null,
      ward: map['ward'] != null ? map['ward'] as String : null,
      subWard: map['subWard'] != null ? map['subWard'] as String : null,
      plotApartment: map['plotApartment'] != null ? map['plotApartment'] as String : null,
      marchentPickupTime: map['marchentPickupTime'] != null ? map['marchentPickupTime'] as String : null,
      serviceType: map['serviceType'] != null ? map['serviceType'] as String : null,
      productWieght: map['productWieght'] != null ? map['productWieght'] as double : null,
      quantity: map['quantity'] != null ? map['quantity'] as int : null,
      itemDetails: map['itemDetails'] != null ? map['itemDetails'] as String : null,
      marchentAdressOnMap: map['marchentAdressOnMap'] != null ? map['marchentAdressOnMap'] as String : null,
      clientAdressOnMap: map['clientAdressOnMap'] != null ? map['clientAdressOnMap'] as String : null,
      clientFullName: map['clientFullName'] != null ? map['clientFullName'] as String : null,
      clientPhone: map['clientPhone'] != null ? map['clientPhone'] as String : null,
      clientDistrict: map['clientDistrict'] != null ? map['clientDistrict'] as String : null,
      clientCity: map['clientCity'] != null ? map['clientCity'] as String : null,
      clientWard: map['clientWard'] != null ? map['clientWard'] as String : null,
      clientSubWard: map['clientSubWard'] != null ? map['clientSubWard'] as String : null,
      clientPlotApartment: map['clientPlotApartment'] != null ? map['clientPlotApartment'] as String : null,
      clientPickupTime: map['clientPickupTime'] != null ? map['clientPickupTime'] as String : null,
      clientServiceType: map['clientServiceType'] != null ? map['clientServiceType'] as String : null,
      clientProductWieght: map['clientProductWieght'] != null ? map['clientProductWieght'] as double : null,
      clientQuantity: map['clientQuantity'] != null ? map['clientQuantity'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory PlaceOrderModel.fromJson(String source) => PlaceOrderModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'PlaceOrderModel(fullName: $fullName, phone: $phone, district: $district, city: $city, ward: $ward, subWard: $subWard, plotApartment: $plotApartment, marchentPickupTime: $marchentPickupTime, serviceType: $serviceType, productWieght: $productWieght, quantity: $quantity, itemDetails: $itemDetails, marchentAdressOnMap: $marchentAdressOnMap, clientAdressOnMap: $clientAdressOnMap, clientFullName: $clientFullName, clientPhone: $clientPhone, clientDistrict: $clientDistrict, clientCity: $clientCity, clientWard: $clientWard, clientSubWard: $clientSubWard, clientPlotApartment: $clientPlotApartment, clientPickupTime: $clientPickupTime, clientServiceType: $clientServiceType, clientProductWieght: $clientProductWieght, clientQuantity: $clientQuantity)';
  }

  @override
  bool operator ==(covariant PlaceOrderModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.fullName == fullName &&
      other.phone == phone &&
      other.district == district &&
      other.city == city &&
      other.ward == ward &&
      other.subWard == subWard &&
      other.plotApartment == plotApartment &&
      other.marchentPickupTime == marchentPickupTime &&
      other.serviceType == serviceType &&
      other.productWieght == productWieght &&
      other.quantity == quantity &&
      other.itemDetails == itemDetails &&
      other.marchentAdressOnMap == marchentAdressOnMap &&
      other.clientAdressOnMap == clientAdressOnMap &&
      other.clientFullName == clientFullName &&
      other.clientPhone == clientPhone &&
      other.clientDistrict == clientDistrict &&
      other.clientCity == clientCity &&
      other.clientWard == clientWard &&
      other.clientSubWard == clientSubWard &&
      other.clientPlotApartment == clientPlotApartment &&
      other.clientPickupTime == clientPickupTime &&
      other.clientServiceType == clientServiceType &&
      other.clientProductWieght == clientProductWieght &&
      other.clientQuantity == clientQuantity;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
      phone.hashCode ^
      district.hashCode ^
      city.hashCode ^
      ward.hashCode ^
      subWard.hashCode ^
      plotApartment.hashCode ^
      marchentPickupTime.hashCode ^
      serviceType.hashCode ^
      productWieght.hashCode ^
      quantity.hashCode ^
      itemDetails.hashCode ^
      marchentAdressOnMap.hashCode ^
      clientAdressOnMap.hashCode ^
      clientFullName.hashCode ^
      clientPhone.hashCode ^
      clientDistrict.hashCode ^
      clientCity.hashCode ^
      clientWard.hashCode ^
      clientSubWard.hashCode ^
      clientPlotApartment.hashCode ^
      clientPickupTime.hashCode ^
      clientServiceType.hashCode ^
      clientProductWieght.hashCode ^
      clientQuantity.hashCode;
  }
}
