import 'package:flooding_app_design_system/flooding_app_design_system.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flooding Design System',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: FloodingColor.main600),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flooding Design system'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloodingDefaultButton(
                text: '신청',
                onTap: () {},
              ),
              SignUpDropdown(
                onTap: (it) {},
                showList: ['1기', '2기'],
                defaultValue: '기수',
              )
            ],
          ),
        ),
      ),
    );
  }
}
