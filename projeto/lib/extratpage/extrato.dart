import 'package:flutter/material.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/widget/widget.dart';
import 'package:provider/provider.dart';

class Historico extends StatefulWidget {
  const Historico({super.key});

  @override
  State<Historico> createState() => _HistoricoState();
}

class _HistoricoState extends State<Historico> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: barraNavegar,
      drawer: const Drawerwidget(),
      body: const Page2(),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    var provider = context.watch<ProviderAtt>();
    return LayoutBuilder(
      builder: (context,BoxConstraints caixa){
        double larguraDatela = caixa.maxWidth;
        double fontSizeExtrato = larguraDatela > 600 ? 24 : 18;
        double paddingExtrato = larguraDatela*0.5;
        return ListView(
          children: [
            const SizedBox(height: 30),
            const Text(
              "Todos os Extratos",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
              textAlign: TextAlign.center,
            ),
            Container(
              margin: const EdgeInsets.all(40),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.green)),
              child: ListTile(
                title: provider.dados.isEmpty
                    ? const Text(
                        "ainda não tem extrato",
                        textAlign: TextAlign.center,
                      )
                    : Column(
                        children: [
                          for (var entry in provider.dados.entries)
                            ListTile(
                              leading: Icon(Icons.attach_money_rounded),
                              iconColor: entry.value > 0 ? Colors.green: Colors.red,
                              title: Text(
                                'Valor da gorjeta: ${entry.value}\nHorario: ${provider.diaformatado(entry.key)}',
                                textAlign: TextAlign.center,
                              ),
                            ),
                        ],
                      ),
              ),
            ),
          ],
        );
      }
    );
  }
}
