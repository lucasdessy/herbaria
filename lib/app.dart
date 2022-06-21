import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbaria/blocs/analyzer/analyzer_cubit.dart';
import 'package:herbaria/blocs/history/history_cubit.dart';
import 'package:herbaria/init_getit.dart';

import 'blocs/navigation/navigation_cubit.dart';
import 'views/home_view/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<NavigationCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<AnalyzerCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt<HistoryCubit>(),
        )
      ],
      child: const MaterialApp(
        home: HomeView(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
