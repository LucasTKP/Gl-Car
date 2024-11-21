import 'dart:developer';
import 'package:carroforte/db/data_base.dart';
import 'package:carroforte/models/car_register.dart';
import 'package:sqflite/sqflite.dart';

class CarsController {
  final DatabaseController dbHelper = DatabaseController.instance;

  Future<List<CarRegister>> getCars() async {
    try {
      final Database db = await dbHelper.database;
      final List<Map<String, dynamic>> maps = await db.query('cars');
      
      return List.generate(maps.length, (i) {
        return CarRegister(
          id: maps[i]['id'].toString(),
          modelo: maps[i]['modelo'],
          ano: maps[i]['ano'],
          cor: maps[i]['cor'],
          quilometragem: maps[i]['quilometragem'],
          placa: maps[i]['placa'],
          proprietario: maps[i]['proprietario'],
        );
      });
    } catch (e) {
      log('Error fetching cars: $e');
      return [];
    }
  }
}