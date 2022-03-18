// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../view_models/home_view_model.dart' as _i5;
import '../view_models/map_view_model.dart' as _i6;
import 'api_manager.dart' as _i3;
import 'database_manager.dart' as _i4; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.singleton<_i3.ApiManager>(_i3.ApiManager());
  gh.singleton<_i4.DatabaseManager>(_i4.DatabaseManager());
  gh.singleton<_i5.HomeViewModel>(_i5.HomeViewModel());
  gh.factory<_i6.MapViewModel>(() => _i6.MapViewModel());
  return get;
}
