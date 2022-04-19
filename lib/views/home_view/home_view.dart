import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbaria/blocs/analyzer/analyzer_cubit.dart';
import 'package:herbaria/views/constants/colors.dart';
import 'package:herbaria/views/constants/herbaria_padding.dart';
import 'package:herbaria/views/home_view/components/add_image_bottomsheet.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analyzerCubit = context.watch<AnalyzerCubit>();
    return Scaffold(
      body: SizedBox(
        height: double.infinity,
        child: Stack(
          children: [
            HerbariaPadding(
              child: Center(
                child: Text('Faça uma análise',
                    style: Theme.of(context)
                        .textTheme
                        .headline4!
                        .copyWith(color: HerbariaColors.black)),
              ),
            ),
            AddImageBottomSheet(
              openCameraCallBack: analyzerCubit.openCamera,
              openGalleryCallBack: analyzerCubit.openGallery,
            ),
          ],
        ),
      ),
    );
  }
}
