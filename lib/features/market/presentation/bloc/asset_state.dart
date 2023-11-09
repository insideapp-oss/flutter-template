import 'package:equatable/equatable.dart';
import 'package:dio/dio.dart';
import 'package:flutter_template_insideapp/features/market/domain/entities/asset.dart';

abstract class AssetsState extends Equatable {
  final List<AssetEntity> ? assets;
  final DioException ? error;
  
  const AssetsState({this.assets,this.error});
  
  @override
  List<Object> get props => [assets!, error!];
}

class AssetsLoading extends AssetsState {
  const AssetsLoading();
}

class AssetsDone extends AssetsState {
  const AssetsDone(List<AssetEntity> assets) : super(assets: assets);
}

class AssetsError extends AssetsState {
  const AssetsError(DioException error) : super(error: error);
}