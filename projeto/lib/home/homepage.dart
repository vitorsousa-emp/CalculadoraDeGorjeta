import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/widget/widget.dart';
import 'package:provider/provider.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final TextEditingController controller1 = TextEditingController();
  final TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ProviderAtt>();

    double larguraDaTela = MediaQuery.of(context).size.width;
    double alturaDaTela = MediaQuery.of(context).size.height;
    double fontSize = larguraDaTela * 0.05; 
    double paddingHome = larguraDaTela * 0.05;
    double botaoAltura = alturaDaTela * 0.07;
    double botaoLargura = larguraDaTela * 0.07;

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(paddingHome),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Bem Vindo",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: fontSize),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: alturaDaTela * 0.03),
              Container(
                padding: EdgeInsets.symmetric(horizontal: paddingHome),
                child: TextField(
                  style: TextStyle(fontSize: fontSize * 0.8),
                  controller: controller1,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money, color: Colors.green),
                    labelText: "Total das compras",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: alturaDaTela * 0.02),
              Container(
                padding: EdgeInsets.symmetric(horizontal: paddingHome),
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: TextStyle(fontSize: fontSize * 0.8),
                  controller: controller2,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.attach_money_outlined, color: Colors.red),
                    labelText: "Valor pago",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              SizedBox(height: alturaDaTela * 0.04),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  fixedSize: Size(botaoLargura*2, botaoAltura*2),
                ),
                onPressed: () {
                  provider.calculargorjeta(controller1, controller2);
                  controller1.clear();
                  controller2.clear();
                },
                child: Text("Calcular", style: TextStyle(fontSize: fontSize * 0.6)),
              ),
              SizedBox(height: alturaDaTela * 0.02),
              resultwidget(provider: provider),
            ],
          ),
        ),
      ),
    );
  }
}
