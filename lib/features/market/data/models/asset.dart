import 'package:floor/floor.dart';
import 'package:flutter_template_insideapp/features/market/domain/entities/asset.dart';

@Entity(tableName: 'asset',primaryKeys: ['id'])
class AssetModel extends AssetEntity {
  const AssetModel({
    super.id,
    super.rank,
    super.symbol,
    super.name,
    super.priceUsd,
  });

  factory AssetModel.fromJson(Map < String, dynamic > map) {
    return AssetModel(
      id: map['id'] ?? "",
      rank: map['rank'] ?? "",
      symbol: map['symbol'] ?? "",
      name: map['name'] ?? "",
      priceUsd: map['priceUsd'] ?? "",
    );
  }

  factory AssetModel.fromEntity(AssetEntity entity) {
    return AssetModel(
      id: entity.id,
      rank: entity.rank,
      symbol: entity.symbol,
      name: entity.name,
      priceUsd: entity.priceUsd,
    );
  }
}