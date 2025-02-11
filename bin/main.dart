import 'dart:math';
import 'dart:async';

Stream<dynamic> carros() async* {
  Random random = Random();
  List<String> lugares = ["San Diego", "Naguanagua", "Valencia", "Av. Bolivar"];
  List<String> modelosCarro = ["Aveo", "Terio", "Burbuja", "Toyota"];
  
  while (true) {
    int lugar = random.nextInt(lugares.length);
    int modelo = random.nextInt(modelosCarro.length);
    double velocidad = random.nextDouble() * 150; 
    yield "Carro 🚗: ${modelosCarro[modelo]}\nLugar 🛤️: ${lugares[lugar]}\nVelocidad 🏁: ${velocidad.toStringAsFixed(2)} km/h";
    await Future.delayed(Duration(seconds: 5));
  }
}
Future<String> procesarVelocidad(double velocidad) async {
  if (velocidad > 100) {
    return "Exceso de velocidad 😎  \n========================";
  } else {
    return "Velocidad adecuada 😉  \n========================";
  }
}

void main(List<String> arguments) async {
  Stream<dynamic> informacionCarros = carros();
  await for (var dato in informacionCarros) {
    print(dato); 

    if (dato is String && dato.contains("Velocidad 🏁: ")) {
      double velocidad = double.parse(dato.split("Velocidad 🏁: ")[1].split(" km/h")[0]);
      await Future.delayed(Duration(seconds: 2));
      String mensaje = await procesarVelocidad(velocidad);
      print(mensaje);
    }
  }
}

