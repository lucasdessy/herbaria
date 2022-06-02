import 'package:flutter/material.dart';
import 'package:herbaria/app.dart';
import 'package:herbaria/init_getit.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
      storageDirectory: await getApplicationSupportDirectory());

  HydratedBlocOverrides.runZoned(
    () {
      configureDependencies();
      runApp(const App());
    },
    storage: storage,
  );
}
