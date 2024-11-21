import 'dart:developer';
import 'package:carroforte/db/data_base.dart';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:carroforte/models/car_register.dart';

class RegisterCarController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController modelo = TextEditingController();
  final TextEditingController ano = TextEditingController();
  final TextEditingController cor = TextEditingController();
  final TextEditingController quilometragem = TextEditingController();
  final TextEditingController placa = TextEditingController();
  final TextEditingController proprietario = TextEditingController();

  Future<bool> onCreateCar() async {
    try {
      if (!formKey.currentState!.validate()) return false;

      final newCar = CarRegister(
        modelo: modelo.text,
        ano: int.tryParse(ano.text) ?? 0,
        cor: cor.text,
        quilometragem: int.tryParse(quilometragem.text) ?? 0,
        placa: placa.text,
        proprietario: proprietario.text,
      );

      await insertCar(newCar);
      return true;
    } catch (e) {
      log('Error creating car: $e');
      return false;
    }
  }

  Future<void> insertCar(CarRegister car) async {
    final db = await DatabaseController.instance.database;
    await db.insert(
      'cars',
      car.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  void dispose() {
    modelo.dispose();
    ano.dispose();
    cor.dispose();
    quilometragem.dispose();
    placa.dispose();
    proprietario.dispose();
  }
}
