import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbaria/blocs/analyzer/analyzer_cubit.dart';
import 'package:herbaria/blocs/history/history_cubit.dart';
import 'package:herbaria/init_getit.dart';
import 'package:herbaria/views/result_view.dart';

import 'blocs/navigation/navigation_cubit.dart';
import 'views/home_view/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MultiBlocProvider(
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
        child: const AppNavigator(),
      ),
    );
  }
}

class AppNavigator extends StatelessWidget {
  const AppNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _navigationCubit = context.watch<NavigationCubit>();
    return Navigator(
      pages: [
        const MaterialPage(child: HomeView()),
        if (_navigationCubit.state.shouldShowResultScreen)
          const MaterialPage(child: ResultView()),
      ],
      onPopPage: _navigationCubit.pop,
    );
  }
}
