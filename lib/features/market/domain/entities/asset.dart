import 'package:equatable/equatable.dart';

class AssetEntity extends Equatable{
  final String ? id;
  final String ? rank;
  final String ? symbol;
  final String ? name;
  final String ? priceUsd;

  const AssetEntity({
    this.id,
    this.rank,
    this.symbol,
    this.name,
    this.priceUsd,
  });

  @override
  List < Object ? > get props {
    return [
      id,
      rank,
      symbol,
      name,
      priceUsd,
    ];
  }
}