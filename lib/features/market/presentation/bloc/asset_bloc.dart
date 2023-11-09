import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_insideapp/core/resources/data_state.dart';
import 'package:flutter_template_insideapp/features/market/domain/usecases/get_asset.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_event.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_state.dart';

class AssetBloc extends Bloc<AssetsEvent,AssetsState> {
  
  final GetAssetUseCase _getAssetUseCase;
  
  AssetBloc(this._getAssetUseCase) : super(const AssetsLoading()){
    on <GetAssets> (onGetAssets);
  }


  void onGetAssets(GetAssets event, Emitter < AssetsState > emit) async {
    final dataState = await _getAssetUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(
        AssetsDone(dataState.data!)
      );
    }
    
    if (dataState is DataFailed) {
      emit(
        AssetsError(dataState.error!)
      );
    }
  }
}