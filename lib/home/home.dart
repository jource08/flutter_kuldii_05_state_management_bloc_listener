import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_kuldii_05_state_management_bloc_listener/bloc/counter.dart';

class HomePage extends StatelessWidget {
  // const HomePage({super.key});
  MyCounter myCounter = MyCounter(startNum: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BLOC LISTENER"),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BlocListener(
              bloc: myCounter,
              listener: (context, state) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(const SnackBar(content: Text("RUN!")));
              },
              listenWhen: (previous, current) {
                if (current == 15) {
                  return true;
                } else {
                  return false;
                }
              },
              child: BlocBuilder<MyCounter, int>(
                bloc: myCounter,
                builder: (context, state) {
                  return Text("$state", style: const TextStyle(fontSize: 50));
                },
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                    onPressed: () {
                      myCounter.decrement();
                    },
                    icon: const Icon(Icons.remove)),
                IconButton(
                    onPressed: () {
                      myCounter.increment();
                    },
                    icon: const Icon(Icons.add)),
              ],
            )
          ],
        ));
  }
}
