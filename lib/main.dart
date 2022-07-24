import 'package:bloc_on_strreams/color_bloc.dart';
import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final ColorBloc _bloc = ColorBloc();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            StreamBuilder<Color>(
                stream: _bloc.outputStateStream,
                initialData: Colors.red,
                builder: (context, snapshot) {
                  return AnimatedContainer(
                    width: 150,
                    height: 150,
                    duration: const Duration(milliseconds: 300),
                    color: snapshot.data,
                  );
                }),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.red,
                  onPressed: () {
                    _bloc.inputEventSink.add(ColorEvent.colorRed);
                  },
                ),
                const SizedBox(
                  width: 50,
                ),
                FloatingActionButton(
                  backgroundColor: Colors.green,
                  onPressed: () {
                    _bloc.inputEventSink.add(ColorEvent.colorGreen);
                  },
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }
}
