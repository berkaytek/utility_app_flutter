import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:utility_app/src/screens/counter/counter_cubit.dart';
import 'package:utility_app/src/widgets/app_bar.dart';
import 'package:utility_app/src/widgets/app_drawer.dart';

class CounterView extends StatelessWidget {
  final String title;

  const CounterView({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(title: title),
      drawer: const AppDrawer(),
      body: Center(
        child: BlocBuilder<CounterCubit, int>(
          builder: (context, state) => Text("Counter is $state",
              style: Theme.of(context).textTheme.displaySmall),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          FloatingActionButton(
            heroTag: "Adding button",
            child: const Icon(Icons.add),
            onPressed: () {
              context.read<CounterCubit>().increment();
            },
          ),
          const SizedBox(height: 16,),
          FloatingActionButton(
            heroTag: "Reducing button",
            child: const Icon(Icons.remove),
            onPressed: () {
              context.read<CounterCubit>().decrement();
            },
          )
        ],
      ),
    );
  }
}
