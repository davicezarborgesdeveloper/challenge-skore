import 'package:get_it/get_it.dart';
import 'package:skore/data/data_source/local_data_source.dart';
import 'package:skore/domain/repository/repository.dart';
import 'package:skore/data/repository/repository_impl.dart';
import 'package:skore/domain/home_usecase.dart';
import 'package:skore/presentation/home/home_viewmodel.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  instance.registerLazySingleton<LocalDataSource>(() => LocalDataSourceImpl());

  instance.registerLazySingleton<Repository>(()=>RepositoryImpl(instance()));
}

void initHomeModule() {
  if(!GetIt.I.isRegistered<HomeUseCase>()) {
    instance.registerFactory<HomeUseCase>(() => HomeUseCase(instance()));
    instance.registerFactory<HomeViewModel>(() => HomeViewModel(instance()));
  }
}