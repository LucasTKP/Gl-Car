// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Car {
  final int id;
  final String modelo;
  final int ano;
  final String cor;
  final int quilometragem;
  final String placa;
  final String proprietario;

  Car({
    required this.id,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.quilometragem,
    required this.placa,
    required this.proprietario,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'modelo': modelo,
      'ano': ano,
      'cor': cor,
      'quilometragem': quilometragem,
      'placa': placa,
      'proprietario': proprietario,
    };
  }

  @override
  String toString() {
    return 'Car{id: $id, modelo: $modelo, ano: $ano, cor: $cor, quilometragem: $quilometragem, placa: $placa, proprietario: $proprietario}';
  }

  factory Car.fromMap(Map<String, dynamic> map) {
    return Car(
      id: map['id'] as int,
      modelo: map['modelo'] as String,
      ano: map['ano'] as int,
      cor: map['cor'] as String,
      quilometragem: map['quilometragem'] as int,
      placa: map['placa'] as String,
      proprietario: map['proprietario'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Car.fromJson(String source) => Car.fromMap(json.decode(source) as Map<String, dynamic>);
}
