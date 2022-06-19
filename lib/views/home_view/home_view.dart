import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbaria/blocs/analyzer/analyzer_cubit.dart';
import 'package:herbaria/blocs/history/history_cubit.dart';
import 'package:herbaria/views/constants/herbaria_padding.dart';
import 'package:herbaria/views/home_view/components/add_image_bottomsheet.dart';
import 'package:herbaria/views/home_view/components/history_card.dart';

import '../constants/colors.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final historyCubit = context.watch<HistoryCubit>();
    final historyCubitState = historyCubit.state;
    final isAnalyzerLoading =
        context.watch<AnalyzerCubit>().state is AnalyzerLoading;
    return Scaffold(
      body: BlocListener<AnalyzerCubit, AnalyzerState>(
        listener: (context, state) {
          if (state is AnalyzerError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.exception.title}'
                    '${state.exception.subTitle != null ? '\n${state.exception.subTitle}' : ''}'),
                behavior: SnackBarBehavior.floating,
              ),
            );
          }
        },
        child: SizedBox(
          height: double.infinity,
          child: Stack(
            children: [
              if (isAnalyzerLoading)
                const Center(
                  child: CircularProgressIndicator(),
                )
              else
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).padding.top + 16),
                  child: historyCubitState.history.isEmpty
                      ? HerbariaPadding(
                          child: Center(
                            child: Text(
                              'Faça uma análise',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline4!
                                  .copyWith(color: HerbariaColors.black),
                            ),
                          ),
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            const HerbariaPadding(
                              child: Text(
                                'Últimas Análises',
                                style: TextStyle(
                                  fontSize: 26,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            ...historyCubitState.history
                                .map<Widget>(
                                  (e) => HistoryCard(item: e),
                                )
                                .toList(),
                          ],
                        ),
                ),
              AddImageBottomSheet(
                openCameraCallBack: context.read<AnalyzerCubit>().openCamera,
                openGalleryCallBack: context.read<AnalyzerCubit>().openGallery,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
