// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'blocs/analyzer/analyzer_cubit.dart' as _i4;
import 'blocs/navigation/navigation_cubit.dart' as _i5;
import 'repositories/camera_gallery_repository.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.CameraGalleryRepository>(_i3.CameraGalleryRepository());
  gh.singleton<_i4.AnalyzerCubit>(
      _i4.AnalyzerCubit(get<_i3.CameraGalleryRepository>()));
  gh.singleton<_i5.NavigationCubit>(
      _i5.NavigationCubit(get<_i4.AnalyzerCubit>()));
  return get;
}
