import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter_template_insideapp/core/resources/data_state.dart';
import 'package:flutter_template_insideapp/features/market/data/data_sources/remote/coincap_api_service.dart';
import 'package:flutter_template_insideapp/features/market/data/models/asset.dart';
import 'package:flutter_template_insideapp/features/market/data/repository/asset_repository.dart';

class AssetRepositoryImpl implements AssetRepository {
  final CoincapApiService _coincapApiService;
  AssetRepositoryImpl(this._coincapApiService);
  
  @override
  Future<DataState<List<AssetModel>>> getAssets() async {
   try {
    final httpResponse = await _coincapApiService.getAssets();

    if (httpResponse.response.statusCode == HttpStatus.ok) {
      return DataSuccess(httpResponse.data);
    } else {
      return DataFailed(
        DioException(
          error: httpResponse.response.statusMessage,
          response: httpResponse.response,
          type: DioExceptionType.badResponse,
          requestOptions: httpResponse.response.requestOptions
        )
      );
    }
   } on DioException catch(e){
    return DataFailed(e);
   }
  }  
}