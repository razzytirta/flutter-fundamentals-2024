import 'package:belajar_bloc_dasr/color_bloc.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ColorBloc bloc = ColorBloc();
  @override
  void dispose() {
    bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            FloatingActionButton(
              backgroundColor: Colors.amber,
              onPressed: () {
                print("kuning");
                bloc.eventSink.add(ColorEvent.toAmber);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            FloatingActionButton(
              backgroundColor: Colors.lightBlue,
              onPressed: () {
                bloc.eventSink.add(ColorEvent.toLightLblue);
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60),
              ),
            ),
          ],
        ),
        appBar: AppBar(
          title: const Text("Belajar Bloc Dasar"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Center(
          child: StreamBuilder<Color>(
              stream: bloc.stateStream,
              initialData: Colors.amber,
              builder: (context, snapshot) {
                print(snapshot.data);
                return AnimatedContainer(
                  duration: const Duration(
                    milliseconds: 1,
                  ),
                  width: 100,
                  height: 100,
                  color: snapshot.data,
                );
              }),
        ),
      ),
    );
  }
}
