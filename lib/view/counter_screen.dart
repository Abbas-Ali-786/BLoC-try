import 'package:bloc_try/bloc/counter_bloc/counter_event.dart';
import 'package:bloc_try/bloc/counter_bloc/counter_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/counter_bloc/counter_bloc.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => CounterBloc(),
        child: const MaterialApp(
      home: CounterScreen(),
    ));
  }
}

class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BloC Try'),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<CounterBloc, CounterState>(
            builder: (context, state){
              return Center(child: Text(state.counter.toString(), style: const TextStyle(fontSize: 60, fontWeight: FontWeight.bold),));
            }
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(child: const Text('Increment'), onPressed: () {
                context.read<CounterBloc>().add(IncrementEvent());
              },),
              const SizedBox(width: 20,),
              ElevatedButton(onPressed: (){
                context.read<CounterBloc>().add(DecrementEvent());
              }, child: const Text('Decrement')),
            ],
          )
        ],
      ),
    );
  }
}

