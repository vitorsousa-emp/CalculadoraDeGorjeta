import 'package:flutter/material.dart';

class ProviderAtt extends ChangeNotifier {

  int? resultado;
  double opacidade = 0.0;
  Map<DateTime, int> dados = {};
 


  void calculargorjeta(TextEditingController controller1, TextEditingController controller2) {
    resultado = int.parse(controller2.text) - int.parse(controller1.text);
    DateTime dia = DateTime.now();
    opacidade = 1.0;
    dados[dia] = int.parse(resultado.toString());
    notifyListeners();
  }

  int? showResult(){
    return resultado??0;
  }

  String diaformatado(DateTime dia){
    String diaformatado = "${dia.year} ${dia.month.toString().padLeft(2, '0')}-${dia.day.toString().padLeft(2, '0')} ${dia.hour.toString().padLeft(2, '0')}:${dia.minute.toString()}";

    return diaformatado;
    
  }





 
  
    
  

}

