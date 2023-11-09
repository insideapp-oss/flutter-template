
import 'package:flutter_template_insideapp/core/resources/data_state.dart';
import 'package:flutter_template_insideapp/features/market/domain/entities/asset.dart';

abstract class AssetRepository {
  Future<DataState<List<AssetEntity>>> getAssets();
}