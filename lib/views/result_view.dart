import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:herbaria/views/constants/colors.dart';

import '../blocs/analyzer/analyzer_cubit.dart';

class ResultView extends StatelessWidget {
  const ResultView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final analyzerCubit = context.watch<AnalyzerCubit>();
    final analyzerCubitState = analyzerCubit.state;
    if (analyzerCubitState is AnalyzerLoaded) {
      return Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: HerbariaColors.green,
        appBar: PreferredSize(
            child: ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: AppBar(
                  backgroundColor: Colors.transparent,
                ),
              ),
            ),
            preferredSize: AppBar().preferredSize),
        body: ListView(
          children: [
            const SizedBox(
              height: 22.5,
            ),
            CarouselSlider(
              options: CarouselOptions(
                height: 250,
                aspectRatio: 1,
                enlargeCenterPage: true,
                viewportFraction: 0.65,
                enableInfiniteScroll: false,
                initialPage: 2,
              ),
              items: analyzerCubitState.item.plant.imagesAssetLocations
                  .map((imageUrl) {
                return Builder(
                  builder: (BuildContext context) {
                    return Container(
                      width: 250,
                      height: 250,
                      // margin: const EdgeInsets.symmetric(horizontal: 5.0),
                      decoration: BoxDecoration(
                        color: HerbariaColors.orange,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        border: Border.all(
                          color: HerbariaColors.white,
                          width: 5,
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.all(
                          Radius.circular(25),
                        ),
                        child: Image.asset(
                          imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  },
                );
              }).toList(),
            ),
            ConstrainedBox(
              constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - 250 - 61),
              child: Container(
                margin: const EdgeInsets.only(top: 61),
                decoration: const BoxDecoration(
                    color: HerbariaColors.lightGreen,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(61),
                        topRight: Radius.circular(61))),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 22, horizontal: 48),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          analyzerCubitState.item.plant.plantTitle,
                          style: const TextStyle(fontSize: 24),
                        ),
                        Text(
                          'Precisão: ${analyzerCubitState.item.precision}%',
                          style: const TextStyle(fontSize: 11),
                        ),
                        const SizedBox(
                          height: 27,
                        ),
                        Text(
                          analyzerCubitState.item.plant.description,
                          style: const TextStyle(fontSize: 16),
                          textAlign: TextAlign.start,
                        ),
                      ]),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return Container();
  }
}
