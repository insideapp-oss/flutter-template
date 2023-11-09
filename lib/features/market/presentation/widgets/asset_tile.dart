import 'package:flutter/material.dart';
import 'package:flutter_template_insideapp/features/market/domain/entities/asset.dart';

class AssetWidget extends StatelessWidget {
  final AssetEntity ? asset;
  final void Function(AssetEntity asset) ? onAssetPressed;

  const AssetWidget({
    super.key,
    this.asset,
    this.onAssetPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: _onTap,
      child: Container(
        padding: const EdgeInsetsDirectional.only(start: 14, end: 14, bottom: 7, top: 7),
          height: MediaQuery.of(context).size.width / 2.2,
          child: Row(
            children: [
              _buildTitleAndPrice(),
            ],
          ),
      ),
    );
  }

  Widget _buildTitleAndPrice() {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 7),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // name
              Text(
                asset!.name?? '',
                maxLines : 3,
                overflow : TextOverflow.ellipsis,
                style: const TextStyle(
                  fontFamily: 'Butler',
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                  color: Colors.black87,
                ),
              ),

              // price
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      asset!.priceUsd ?? '',
                      maxLines : 2,
                    ),
                ),
              ),

              // rank
              Row(
                children: [
                  const Icon(Icons.timeline_outlined, size: 16),
                    const SizedBox(width: 4),
                      Text(
                        asset!.rank!,
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                ],
              ),
            ],
          ),
      ),
    );
  }

    void _onTap() {
    if (onAssetPressed != null) {
      onAssetPressed!(asset!);
    }
  }

}