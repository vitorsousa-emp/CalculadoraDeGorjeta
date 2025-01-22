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
    return Container(
      margin: const EdgeInsets.all(20),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Bem Vindo",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            TextField(
              controller: controller1,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                prefixIcon: Icon(
                  Icons.attach_money,
                  color: Colors.green,
                ),
                labelText: "total das compras",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: controller2,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.attach_money_outlined, color: Colors.red),
                labelText: "valor pago",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  alignment: Alignment.center,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  fixedSize: const Size(250, 50)),
              onPressed: () {
                provider.calculargorjeta(controller1, controller2);
                controller1.clear();
                controller2.clear();
              },
              child: const Text("calcular"),
            ),
            const SizedBox(
              height: 20,
            ),
            resultwidget(provider: provider),
          ],
        ),
      ),
    );
  }
}

