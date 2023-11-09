import 'package:flutter_template_insideapp/core/resources/data_state.dart';
import 'package:flutter_template_insideapp/core/usecase/usecase.dart';
import 'package:flutter_template_insideapp/features/market/data/repository/asset_repository.dart';
import 'package:flutter_template_insideapp/features/market/domain/entities/asset.dart';

/// <return, params>
class GetAssetUseCase implements UseCase<DataState<List<AssetEntity>>,void>{
  
  final AssetRepository _assetRepository;

  GetAssetUseCase(this._assetRepository);
  
  @override
  Future<DataState<List<AssetEntity>>> call({void params}) {

    // TODO LOCAL PERSISTENCE
    
    return _assetRepository.getAssets();
  }
  
}