// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class drugModel {
  String ScientificName;
  String CommertialName;
  String Classification;
  String Manufacturecompany;
  String AvalableQuantity;
  String Expiration;
  String Price;
  drugModel({
    required this.ScientificName,
    required this.CommertialName,
    required this.Classification,
    required this.Manufacturecompany,
    required this.AvalableQuantity,
    required this.Expiration,
    required this.Price,
  });

  drugModel copyWith({
    String? ScientificName,
    String? CommertialName,
    String? Classification,
    String? Manufacturecompany,
    String? AvalableQuantity,
    String? Expiration,
    String? price,
  }) {
    return drugModel(
      ScientificName: ScientificName ?? this.ScientificName,
      CommertialName: CommertialName ?? this.CommertialName,
      Classification: Classification ?? this.Classification,
      Manufacturecompany: Manufacturecompany ?? this.Manufacturecompany,
      AvalableQuantity: AvalableQuantity ?? this.AvalableQuantity,
      Expiration: Expiration ?? this.Expiration,
      Price: Price ?? this.Price,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'ScientificName': ScientificName,
      'CommertialName': CommertialName,
      'Classification': Classification,
      'Manufacturecompany': Manufacturecompany,
      'AvalableQuantity': AvalableQuantity,
      'Expiration': Expiration,
      'Price': Price,
    };
  }

  factory drugModel.fromMap(Map<String, dynamic> map) {
    return drugModel(
      ScientificName: map['ScientificName'] as String,
      CommertialName: map['CommertialName'] as String,
      Classification: map['Classification'] as String,
      Manufacturecompany: map['Manufacturecompany'] as String,
      AvalableQuantity: map['AvalableQuantity'] as String,
      Expiration: map['Expiration'] as String,
      Price: map['Price'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory drugModel.fromJson(String source) =>
      drugModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'drugModel(ScientificName: $ScientificName, CommertialName: $CommertialName, Classification: $Classification,Manufacturecompany : $Manufacturecompany)';
  }

  @override
  bool operator ==(covariant drugModel other) {
    if (identical(this, other)) return true;

    return other.ScientificName == ScientificName &&
        other.CommertialName == CommertialName &&
        other.Classification == Classification &&
        other.Manufacturecompany == Manufacturecompany &&
        other.AvalableQuantity == AvalableQuantity &&
        other.Expiration == Expiration &&
        other.Price == Price;
  }

  @override
  int get hashCode {
    return ScientificName.hashCode ^
        CommertialName.hashCode ^
        Classification.hashCode ^
        Manufacturecompany.hashCode ^
        AvalableQuantity.hashCode ^
        Expiration.hashCode ^
        Price.hashCode;
  }
}
