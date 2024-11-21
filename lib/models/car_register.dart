class CarRegister {
  final String? id;
  final String modelo;
  final int ano;
  final String cor;
  final int quilometragem;
  final String placa;
  final String proprietario;

  CarRegister({
    this.id,
    required this.modelo,
    required this.ano,
    required this.cor,
    required this.quilometragem,
    required this.placa,
    required this.proprietario,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modelo': modelo,
      'ano': ano,
      'cor': cor,
      'quilometragem': quilometragem,
      'placa': placa,
      'proprietario': proprietario,
    };
  }
}
