import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_template_insideapp/features/market/domain/entities/asset.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_bloc.dart';
import 'package:flutter_template_insideapp/features/market/presentation/bloc/asset_state.dart';
import 'package:flutter_template_insideapp/features/market/presentation/widgets/asset_tile.dart';

class Assets extends StatelessWidget {
  const Assets({ super.key });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar(context),
      body: _buildBody() ,
    );
  }
  
  _buildAppbar(BuildContext context) {
    return AppBar(
      title: const Text(
          'Le template de la muerte',
          style: TextStyle(
            color: Colors.black
          ),
        ),
    );
  }

  _buildBody() {
    return BlocBuilder<AssetBloc,AssetsState> (
      builder: (_,state) {
        if (state is AssetsLoading) {
          return const Center(child: CupertinoActivityIndicator());
        }
        if (state is AssetsError) {
          return const Center(child: Icon(Icons.refresh));
        }
        if (state is AssetsDone) {
          return ListView.builder(
           itemBuilder: (context,index){
            return AssetWidget(
              asset: state.assets![index] ,
              onAssetPressed: (asset) => _onAssetPressed(context,asset),
            );
           },
           itemCount: state.assets!.length,
         );
        }
        return const SizedBox();
      },
    );
  }

  void _onAssetPressed(BuildContext context, AssetEntity asset) {
    //Navigator.pushNamed(context, '/AssetDetails', arguments: asset);
    if (kDebugMode) {
      print("${asset.name} cliqué");
    }
  }  
}