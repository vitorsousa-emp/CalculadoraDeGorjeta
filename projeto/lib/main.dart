
import 'package:flutter/material.dart';
import 'package:projeto/extratpage/extrato.dart';
import 'package:projeto/home/homepage.dart';
import 'package:projeto/provider/provider.dart';
import 'package:projeto/widget/widget.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
  

  @override
  Widget build(BuildContext context) {
    
    return ChangeNotifierProvider(
      create: (context) => ProviderAtt(),
      child: MaterialApp(
          routes: {
            "/":(context)=>const ScaffoldPadrao(),

            "/historico": (context) => const Historico()
          },
        ),
    );
  }
}

class ScaffoldPadrao extends StatelessWidget {
  const ScaffoldPadrao({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const MyWidget(),
      appBar: barraNavegar,
      drawer: const Drawerwidget(),
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
    );
  
  }
}

