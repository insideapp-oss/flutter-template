import 'package:flutter_template_insideapp/features/market/data/data_sources/remote/coincap_api_service.dart';
import 'package:flutter_template_insideapp/features/market/data/repository/asset_repository.dart';
import 'package:flutter_template_insideapp/features/market/domain/repository/article_repository_impl.dart';
import 'package:flutter_template_insideapp/features/market/domain/usecases/get_asset.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';


final sl = GetIt.instance;

Future<void> initializeDependencies() async {  
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<CoincapApiService>(CoincapApiService(sl()));

  sl.registerSingleton<AssetRepository>(
    AssetRepositoryImpl(sl())
  );
  
  //UseCases
  sl.registerSingleton<GetAssetUseCase>(
    GetAssetUseCase(sl())
  );

  //Blocs
  sl.registerFactory<AssetBloc>(
    ()=> AssetBloc(sl())
  );

}