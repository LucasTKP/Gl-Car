import 'package:carroforte/models/car_register.dart';
import 'package:carroforte/pages/cars/cars_controller.dart';
import 'package:carroforte/pages/registerCar/register_car_page.dart';
import 'package:flutter/material.dart';

class CarsPage extends StatefulWidget {
  const CarsPage({super.key});

  @override
  State<CarsPage> createState() => _CarsPageState();
}

class _CarsPageState extends State<CarsPage> {
  List<CarRegister> cars = [];
  late CarsController carsController;

  @override
  void initState() {
    super.initState();
    carsController = CarsController();
    loadCars();
  }

  Future<void> loadCars() async {
    final loadedCars = await carsController.getCars();
    setState(() {
      cars = loadedCars;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GL Car',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Center(
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => RegisterCar(loadCars: loadCars)));
                },
                child: const Text(
                  'Cadastrar Carros',
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: cars.length,
                itemBuilder: (BuildContext context, int index) {
                  final car = cars[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.black),
                    ),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [const Text('Nome: ', style: TextStyle(fontWeight: FontWeight.bold)), Text(car.modelo)]),
                            Row(children: [const Text('Ano: ', style: TextStyle(fontWeight: FontWeight.bold)), Text(car.ano.toString())]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [const Text('Cor: ', style: TextStyle(fontWeight: FontWeight.bold)), Text(car.cor)]),
                            Row(children: [const Text('Quilometragem: ', style: TextStyle(fontWeight: FontWeight.bold)), Text('${car.quilometragem} Km')]),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(children: [const Text('Placa: ', style: TextStyle(fontWeight: FontWeight.bold)), Text(car.placa)]),
                            Row(children: [const Text('Proprietário: ', style: TextStyle(fontWeight: FontWeight.bold)), Text(car.proprietario)]),
                          ],
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
