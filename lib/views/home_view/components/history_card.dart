import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbaria/blocs/analyzer/analyzer_cubit.dart';
import 'package:herbaria/views/constants/colors.dart';
import '../../../models/history_item.dart';

class HistoryCard extends StatelessWidget {
  final HistoryItem item;
  const HistoryCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: () {
        context.read<AnalyzerCubit>().loadFromHistory(item);
      },
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 80,
        margin: const EdgeInsets.only(right: 140),
        padding: const EdgeInsets.only(left: 16),
        decoration: const BoxDecoration(
          color: HerbariaColors.lightGreen,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(61),
            bottomRight: Radius.circular(61),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          if (item.imagesAssetLocations.asMap().containsKey(0))
            CircleAvatar(
              backgroundColor: HerbariaColors.green,
              foregroundImage: AssetImage(item.imagesAssetLocations.first),
            ),
          const Spacer(),
          Text(
            item.plantName,
            style: const TextStyle(fontSize: 24),
            maxLines: 2,
          ),
          const Spacer(),
        ]),
      ),
    );
  }
}
