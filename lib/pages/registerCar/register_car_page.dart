import 'package:carroforte/pages/registerCar/register_car_controller.dart';
import 'package:flutter/material.dart';

class RegisterCar extends StatefulWidget {
  final Future<void> Function() loadCars;
  const RegisterCar({super.key, required this.loadCars});

  @override
  State<RegisterCar> createState() => _RegisterCarState();
}

class _RegisterCarState extends State<RegisterCar> {
  late RegisterCarController registerCarController;

  @override
  void initState() {
    super.initState();
    registerCarController = RegisterCarController();
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            const Text(
              'Registre as informações do carro',
              style: TextStyle(fontSize: 20),
            ),
            Form(
              key: registerCarController.formKey,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o modelo do carro.';
                        }
                        return null;
                      },
                      controller: registerCarController.modelo,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Digite o modelo do carro',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        final RegExp regex = RegExp(r'^\d+$');
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o ano do carro.';
                        } else if (!regex.hasMatch(value)) {
                          return 'Por favor, insira apenas números.';
                        }
                        return null;
                      },
                      controller: registerCarController.ano,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Digite o ano do carro',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a cor do carro.';
                        }
                        return null;
                      },
                      controller: registerCarController.cor,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Digite a cor do carro',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        final RegExp regex = RegExp(r'^\d+$');
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a quilometragem do carro.';
                        } else if (!regex.hasMatch(value)) {
                          return 'Por favor, insira apenas números.';
                        }
                        return null;
                      },
                      controller: registerCarController.quilometragem,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Digite a quilometragem do carro',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira a placa do carro.';
                        }
                        return null;
                      },
                      controller: registerCarController.placa,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Digite a placa do carro',
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Por favor, insira o nome do propitário do carro.';
                        }
                        return null;
                      },
                      controller: registerCarController.proprietario,
                      decoration: const InputDecoration(
                        contentPadding: EdgeInsets.symmetric(horizontal: 10),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(8),
                          ),
                        ),
                        hintText: 'Digite o nome do priopitário',
                      ),
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      onPressed: () async {
                        bool result = await registerCarController.onCreateCar();
                        if (result) {
                          await widget.loadCars();
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            Navigator.pop(context);
                          });
                        }
                      },
                      child: const Text(
                        'Cadastrar',
                        style: TextStyle(color: Colors.black),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
