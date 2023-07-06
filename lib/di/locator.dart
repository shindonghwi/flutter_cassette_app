import 'package:cassette/presentation/utils/Common.dart';
import 'package:get_it/get_it.dart';

final serviceLocator = GetIt.instance;

void initServiceLocator() {
  /// -------
  /// common
  /// -------
  GetIt.instance.registerLazySingleton<AppLocalization>(() => AppLocalization());

  /// -------
  /// usecase
  /// -------


  /// -------
  /// repository
  /// -------

  /// -------
  /// api
  /// -------
}
