import 'package:flutter/material.dart';
import 'package:projeto/provider/provider.dart';

AppBar barraNavegar = AppBar(
  backgroundColor: Colors.deepOrange,
  title: const Text("SuperMarket"),
  centerTitle: true,
);

class Drawerwidget extends StatelessWidget {
  const Drawerwidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    String? rotaAtual = ModalRoute.of(context)?.settings.name;
    return Drawer(
      shape: Border.all(style: BorderStyle.none),
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Text(
                "MENU",
                textAlign: TextAlign.center ,  
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
          ),
          ListTile(
            tileColor: rotaAtual == "/" ? Colors.green[200] : null,
            leading: Icon(Icons.calculate_outlined),
            title: const Text("caculadora"),
            onTap: () => Navigator.pushNamed(context, "/"),
          ),
          ListTile(
            tileColor: rotaAtual == "/historico" ? Colors.green[200] : null,
            leading: Icon(Icons.history),
            title: const Text("historico"),
            onTap: () => Navigator.pushNamed(context, "/historico"),
          )
        ],
      ),
    );
  }
}

// ignore: camel_case_types
class resultwidget extends StatelessWidget {
  const resultwidget({
    super.key,
    required this.provider,
  });

  final ProviderAtt provider;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: provider.opacidade,
      duration: const Duration(microseconds: 7),
      child: RichText(
        text: TextSpan(
          style: const TextStyle(fontSize: 40, color: Colors.black),
          children: [
            TextSpan(text: "valor da gorjeta é: "),
            TextSpan(
              text: "${provider.showResult()}",
              style: TextStyle(

                color: provider.showResult()! > 0 ? Colors.green : Colors.red,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
