import 'package:basket_ball/cubits/counter/counter_cubit.dart';
import 'package:basket_ball/cubits/counter/counter_state.dart';
import 'package:basket_ball/widgets/elevated_custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map> teamA = [
      {
        "text": "Add 1 Points",
        "onPressed": () {
          BlocProvider.of<CounterCubit>(context)
              .TeamIncrement(team: 'A', points: 1);
        },
        "id": 1
      },
      {
        "text": "Add 2 Points",
        "onPressed": () {
          BlocProvider.of<CounterCubit>(context)
              .TeamIncrement(team: 'A', points: 2);
        },
        "id": 2,
      },
      {
        "text": "Add 3 Points",
        "onPressed": () {
          BlocProvider.of<CounterCubit>(context)
              .TeamIncrement(team: 'A', points: 3);
        },
        "id": 3,
      },
    ];

    List<Map> teamB = [
      {
        "text": "Add 1 Points",
        "onPressed": () {
          BlocProvider.of<CounterCubit>(context)
              .TeamIncrement(team: 'B', points: 1);
        },
        "id": 4
      },
      {
        "text": "Add 2 Points",
        "onPressed": () {
          BlocProvider.of<CounterCubit>(context)
              .TeamIncrement(team: 'B', points: 2);
        },
        "id": 5,
      },
      {
        "text": "Add 3 Points",
        "onPressed": () {
          BlocProvider.of<CounterCubit>(context)
              .TeamIncrement(team: 'B', points: 3);
        },
        "id": 6,
      },
    ];

    return BlocConsumer<CounterCubit, CounterState>(
      builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.orange,
              title: const Text(
                'Points Counter',
                style: TextStyle(
                  fontSize: 32,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              centerTitle: true,
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Team A',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            '${BlocProvider.of<CounterCubit>(context).teamAPoints}',
                            style: const TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ...teamA.map(
                            (teamPoint) {
                              //extraction for list of list
                              return ElevatedCustomButton(
                                text: teamPoint['text'],
                                onPressed: teamPoint['onPressed'],
                                id: teamPoint['id'],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 500,
                      child: VerticalDivider(
                        indent: 50,
                        endIndent: 50,
                        color: Colors.grey,
                        thickness: 1,
                      ),
                    ),
                    SizedBox(
                      height: 500,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            'Team B',
                            style: TextStyle(
                              fontSize: 32,
                            ),
                          ),
                          Text(
                            '${BlocProvider.of<CounterCubit>(context).teamBPoints}',
                            style: const TextStyle(
                              fontSize: 150,
                            ),
                          ),
                          ...teamB.map(
                            (teamPoint) {
                              //extraction for list of list
                              return ElevatedCustomButton(
                                text: teamPoint['text'],
                                onPressed: teamPoint['onPressed'],
                                id: teamPoint['id'],
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                ElevatedCustomButton(
                  // color: Colors.orange,
                  text: 'Reset points',
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).TeamReset();
                  },
                  id: 7,
                  reset: true,
                ),
              ],
            ));
      },
      listener: (context, state) {},
    );
  }
}
